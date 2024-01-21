<?php
   session_start();
   include_once("../sys/conexao.php");
   include_once("../sys/funcao.php");
   include_once("../sys/crud.php");
   include_once("../sys/CSRF_Protect.php");
   $csrf = new CSRF_Protect();
   #======================================#
   include_once('../sys/checa_login_user.php');
   #expulsa user
   checa_login_user();
   $ids = $_SESSION['data_user']['id'];
   #======================================#
   // funcao pega saldo do cliente
   function pegarSaldo(){
        global $data_fiverscanpanel,$ids;
        $saldoreq = saldo_user($ids);
        
        $url = $data_fiverscanpanel['url']; 
        // Dados para o corpo da requisição em formato JSON
        $data = array(
            'method' => 'money_info',
            'agent_code' => $data_fiverscanpanel['agent_code'],
            'agent_token' => $data_fiverscanpanel['agent_token'], 
            'user_code' =>  $_SESSION['data_user']['email']
        );
    
        $json_data = json_encode($data);
        $response = enviarRequest($url, $json_data);
        $dados = json_decode($response, true);
        if (!empty($dados)) {
            if ($dados['status'] === 0) {
                $saldoapi =  floatval($saldoreq['saldo']);
            } else {
                $novoSaldo = $dados['user']['balance'];
                //atualizar no bd o saldo
                $att_saldo = att_saldo_user($novoSaldo,$ids);
                if($att_saldo == 1){
                    $saldoapi =  floatval($novoSaldo);
                }else{
                   $saldoapi =  floatval($saldoreq['saldo']); 
                }
            }
        } else {
            $saldoapi =  floatval(saldo_user($ids));
        }
        
        return $saldoapi;
    }
   #======================================#
   //MOSTRA SALDO API
   echo Reais2(pegarSaldo());
   #======================================#
?>
       