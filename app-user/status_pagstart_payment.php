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
   
   function att_paymentpix_real($transacao_id){
        global $mysqli;
        $sql = $mysqli->prepare("UPDATE transacoes SET status='pago' WHERE transacao_id=?");
        $sql->bind_param("s",$transacao_id);
        if($sql->execute()) {
            $rf = 1;
        }else{
            $rf = 0;
        }
        return $rf;
    }

   function checkPayment($transacao_id){
        $data = get_object_vars(getToken());

        if (!isset($data["data"]->access_token)) {
            echo "<div class='alert alert-danger' role='alert'> Erro ao processar dados tente mais tarde.</div>";
            exit;
        }

        global $data_pagstart;

        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => $data_pagstart['url'] . '/wallet/partner/transactions/' . $transacao_id . '/check',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'HEAD',
            CURLOPT_HTTPHEADER => array(
                'Authorization: Bearer ' . $data["data"]->access_token,
                'Content-Type: application/json'
            ),
        ));

        $response = curl_exec($curl);
        $info = curl_getinfo($curl);
        $statusCode = $info['http_code'];

        curl_close($curl);
        return $statusCode;
}


    #======================================#
    $qry = "SELECT * FROM transacoes WHERE usuario='".$ids."' AND status='processamento' AND TIMESTAMPDIFF(SECOND, data_hora, NOW()) <= 1200";
    $res = mysqli_query($mysqli,$qry);
    if(mysqli_num_rows($res)>0){
        while($data = mysqli_fetch_assoc($res)){
            $statuscode = checkPayment($data['transacao_id']);
         if($statuscode === 200){
            att_paymentpix_real($data['transacao_id']);

            $sql = $mysqli->prepare("UPDATE financeiro SET saldo = saldo + ? WHERE usuario = ?");
            $sql->bind_param("si",$data['valor'],$_SESSION['data_user']['id']);
            $sql->execute();
         } else{
            // echo $return_data.' Aguardando -> '.$data['transacao_id'].PHP_EOL;
         }
        }
    }
    #======================================#


 
?>
       