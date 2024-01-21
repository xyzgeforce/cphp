<?php
   session_start();
   include_once('../sys/funcao.php');
   if(isset($_SESSION['token_usuarios_encrypted']) && isset($_SESSION["crsf_token_usuarios"]) && isset($_SESSION["anti_crsf_token_usuarios"])){
      
      unset($_SESSION["token_usuarios_encrypted"]);//destroy crsf_token_adm
      unset($_SESSION["crsf_token_usuarios"]); //destroy token_adm_encrypted
      unset($_SESSION["anti_crsf_token_usuarios"]); //destroy token_user_encrypted
      unset($_SESSION['LOGGED']); //destroy token_user_encrypted
      session_destroy();
      //Após destruir redireciona login
      header('Location: '.$url_base.''); //Redireciona para pagina de login
      exit();
    }
?>