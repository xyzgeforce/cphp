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

   function insert_saque_afiliados($valor_sol,$id_user,$tipo_pix,$key_pix,$data,$hora,$documento){
      global $mysqli;

      $restapi = withdrawSaldo($documento,$valor_sol,$key_pix,$tipo_pix);
   
      if(isset($restapi['data']['end2end'])){
         // $RANDOMSAQUE = md5(token_id_transacao());
        
         $sql12 = $mysqli->prepare("INSERT INTO solicitacao_saques (id_user, valor, tipo, pix, data_cad, data_hora, transacao_id) VALUES (?, ?, ?, ?, ?, ?, ?)");
         $sql12->bind_param("sssssss", $id_user, $valor_sol, $tipo_pix, $key_pix, $data, $hora, $restapi['data']['end2end']);
         $sql12->execute();

         $sql = $mysqli->prepare("UPDATE financeiro SET saldo_afiliados = saldo_afiliados - ? WHERE usuario = ?");
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
   if (isset($_POST['value-afiliados']) && isset($_POST['type-afiliados']) && isset($_POST['tipokey-afiliados']) ) {
       $valor_sol = PHP_SEGURO($_POST['value-afiliados']);
       $tipo_pix = PHP_SEGURO($_POST['type-afiliados']);
       $key_pix = PHP_SEGURO($_POST['tipokey-afiliados']);
       $documento = PHP_SEGURO($_POST['documento']);
       $data = date('Y-m-d');
       $hora = date('H:i:s');
       $qry = "SELECT * FROM solicitacao_saques WHERE id_user='".intval($_SESSION['data_user']['id'])."' AND data_cad='".$data."'";
       $res = mysqli_query($mysqli,$qry);
       if(mysqli_num_rows($res)>0){
         echo '<div class="alert alert-danger" role="alert"><i class="fa fa-info-circle"></i> Limite de 1 Saque diário atingido tente amanhã novamente.</div>'; 
       }else{
          //aqui faz o saque normal
          if($valor_sol <= $saldo_data_user['saldo_afiliado'] AND $valor_sol >= $data_afiliados_cpa_rev['minResgate']){
              $rest = insert_saque_afiliados($valor_sol,$_SESSION['data_user']['id'],$tipo_pix,$key_pix,$data,$hora,$documento);
              if($rest == 1){
                  echo "<div class='alert alert-success' role='alert'><i class='fa fa-check-circle'></i> Seu Pedido de Saque foi processado aguarde o pagamento.</div><script>  setTimeout('window.location.href=\"".$painel_user."\";', 3000); </script>";
              }else{
               echo '<div class="alert alert-danger" role="alert"><i class="fa fa-info-circle"></i> Não foi possível processar saque tente mais tarde.</div>';
              }
          }else{
            echo '<div class="alert alert-danger" role="alert"><i class="fa fa-info-circle"></i> Você não atingiu o minimo para saque de afiliados ou tente mais tarde.</div>';
          }
       }
   }
?>