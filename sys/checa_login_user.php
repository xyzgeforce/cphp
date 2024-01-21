<?php
	function checa_login_user(){
		global $url_base;
	//FUNÇÃO CHECA LOGIN
		if(!isset($_SESSION['token_usuarios_encrypted']) && !isset($_SESSION["crsf_token_usuarios"]) && !isset($_SESSION["anti_crsf_token_usuarios"])){
			header('Location: '.$url_base.''); //Redireciona para pagina de login
		   exit();
		}
	}
	if(isset($_SESSION['token_usuarios_encrypted']) && isset($_SESSION["crsf_token_usuarios"]) && isset($_SESSION["anti_crsf_token_usuarios"])){
		$view_id_user_decrypted = CRIPT_AES('decrypt', $_SESSION["token_usuarios_encrypted"]);
		$query = "SELECT * FROM usuarios WHERE id = '$view_id_user_decrypted'";
		$result = mysqli_query($mysqli , $query) or die (mysqli_error($mysqli));
		if (mysqli_num_rows($result) > 0) {
			$row = mysqli_fetch_assoc($result);
			$_SESSION['data_user'] = $row;
		}
	}
	
	