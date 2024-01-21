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
   $saldo_data_user = saldo_user($_SESSION['data_user']['id']);
   #======================================#
   # type value key
   function insert_saque($valor_sol,$id_user,$tipo_pix,$key_pix,$data,$hora){
      global $mysqli;
      $restapi = withdrawSaldo($_SESSION['data_user']['email'],$valor_sol);
      if($restapi['status'] == 1 AND $restapi['msg'] == "SUCCESS"){
          $RANDOMSAQUE = md5(token_id_transacao());
         $sql12 = $mysqli->prepare("INSERT INTO solicitacao_saques (id_user,valor,tipo,pix,data_cad,data_hora,transacao_id) VALUES (?,?,?,?,?,?,?)");
         $sql12->bind_param("sssssss",$id_user,$valor_sol,$tipo_pix,$key_pix,$data,$hora,$RANDOMSAQUE);
        
        $sql = $mysqli->prepare("UPDATE financeiro SET saldo = saldo - ? WHERE usuario = ?");
         $sql->bind_param("si",$valor_sol,$_SESSION['data_user']['id']);
         if($sql->execute() AND $sql12->execute()){
            $for = 1;
         }else{
            $for = 0; 
         }
      }else{
         $for = 0;
      } 
      return $for;
   }
   #-------------------------------------------------------------------------------------------------------------------------------------#
   if (isset($_POST['value']) && isset($_POST['type']) && isset($_POST['tipokey']) ) {
       $valor_sol = PHP_SEGURO($_POST['value']);
       $tipo_pix = PHP_SEGURO($_POST['type']);
       $key_pix = PHP_SEGURO($_POST['tipokey']);
       $data = date('Y-m-d');
       $hora = date('H:i:s');
       $qry = "SELECT * FROM solicitacao_saques WHERE id_user='".intval($_SESSION['data_user']['id'])."' AND data_cad='".$data."'";
       $res = mysqli_query($mysqli,$qry);
       if(mysqli_num_rows($res)>0){
         echo '<div class="alert alert-danger" role="alert"><i class="fa fa-info-circle"></i> Limite de 1 Saque diário atingido tente amanhã novamente.</div>'; 
       }else{
          //aqui faz o saque normal
          if($valor_sol <= $saldo_data_user['saldo']  AND $valor_sol >= $dataconfig['minsaque']){
              $rest = insert_saque($valor_sol,$_SESSION['data_user']['id'],$tipo_pix,$key_pix,$data,$hora);
              if($rest == 1){
                  echo "<div class='alert alert-success' role='alert'><i class='fa fa-check-circle'></i> Seu Pedido de Saque foi processado aguarde o pagamento.</div><script>  setTimeout('window.location.href=\"".$painel_user."\";', 3000); </script>";
              }else{
               echo '<div class="alert alert-danger" role="alert"><i class="fa fa-info-circle"></i> Não foi possível processar saque tente mais tarde.</div>';
              }
          }else{
            echo '<div class="alert alert-danger" role="alert"><i class="fa fa-info-circle"></i> Você não atingiu o minímo para saque ou tente novamente mais tarde.</div>';
          }
       }
   }
?>