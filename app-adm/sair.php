<?php
	session_start();
	include_once("../sys/conexao.php");
	include_once("../sys/funcao.php");
	if(isset($_SESSION['token_adm_encrypted']) && isset($_SESSION["crsf_token_adm"]) && isset($_SESSION["anti_crsf_token_adm"])){
		unset($_SESSION["token_adm_encrypted"]);//destroy crsf_token_adm
		unset($_SESSION["crsf_token_adm"]); //destroy token_adm_encrypted
		unset($_SESSION["anti_crsf_token_adm"]); //destroy token_user_encrypted
		session_destroy();
		//Após destruir redireciona login
		header('Location: '.$painel_adm_acessar.''); //Redireciona para pagina de login
		exit();
    }
?>