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
   //MODO REAL
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
   #======================================#
   //MODO SANDBOX
   function att_paymentpix_sandbox($transacao_id){
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
   
   #======================================#
   function send_payment_suit_ipn($idtransacao){
        global $url_notificacao_ipn;
      // Dados a serem enviados
      $data = array(
          "idTransaction" => $idtransacao,
          "typeTransaction" => "PIX",
          "statusTransaction" => "PAID_OUT",
          "acquirer_message" => null,
          "acquirer_return_code" => null
      );
      // URL de destino
      $url = $url_notificacao_ipn;
      // Inicializar a sessão cURL
      $ch = curl_init($url);
      // Configurar opções da sessão cURL
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
      curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
      curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
      curl_setopt($ch, CURLOPT_HTTPHEADER, array(
          'Content-Type: application/json',
          'Content-Length: ' . strlen(json_encode($data))
      ));
      // Executar a solicitação cURL e obter a resposta
      $response = curl_exec($ch);
      // Verificar erros
      if (curl_errno($ch)) {
          echo 'Erro cURL: ' . curl_error($ch);
      }
      // Fechar a sessão cURL
      curl_close($ch);
      
      return $response;
    }
   #======================================#
   $qry = "SELECT * FROM transacoes WHERE usuario='".$ids."' AND status='processamento'";
   $res = mysqli_query($mysqli,$qry);
   if(mysqli_num_rows($res)>0){
       while($data = mysqli_fetch_assoc($res)){
         $return_data = request_paymentPIX($data['transacao_id']);
         if($return_data == 'PAID_OUT' AND $tipoAPI_SUITPAY == 1){
             //$att_Payment = att_paymentpix_real($data['transacao_id']);
             $att_Payment = send_payment_suit_ipn($data['transacao_id']);
             //echo $att_Payment.'| ok -> '.$data['transacao_id'].PHP_EOL;
         } else{
            // echo $return_data.' Aguardando -> '.$data['transacao_id'].PHP_EOL;
         }
         #----------------------------------------------------------------------#
           
           
           
           
         #----------------------------------------------------------------------#
         #----------------------------------------------------------------------#
       }
   }
   #======================================#
?>
       