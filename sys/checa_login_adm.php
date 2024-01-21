<?php
	function checa_login_adm(){
		global $painel_adm_acessar;
	//FUNÇÃO CHECA LOGIN
		if(!isset($_SESSION['token_adm_encrypted']) && !isset($_SESSION["crsf_token_adm"]) && !isset($_SESSION["anti_crsf_token_adm"])){
			header('Location: '.$painel_adm_acessar.''); //Redireciona para pagina de login
		exit();
		}
	}
	if(isset($_SESSION['token_adm_encrypted']) && isset($_SESSION["crsf_token_adm"]) && isset($_SESSION["anti_crsf_token_adm"])){
		$view_id_user_decrypted = CRIPT_AES('decrypt', $_SESSION["token_adm_encrypted"]);
		$query = "SELECT * FROM admin_users WHERE id = '$view_id_user_decrypted' AND status=1";
		$result = mysqli_query($mysqli , $query) or die (mysqli_error($mysqli));
		if (mysqli_num_rows($result) > 0) {
			$row = mysqli_fetch_assoc($result);
			$_SESSION['data_adm'] = $row;
		}
	}
	
	