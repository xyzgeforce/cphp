<?php
session_start();
include_once('../sys/conexao.php');
include_once('../sys/funcao.php');
include_once('../sys/crud.php');
#------------------------------------------------------------#
#capta dados do form
if (isset($_POST['email']) && isset($_POST['senha']) && isset($_POST['_csrf'])) {
	$email =  PHP_SEGURO($_POST['email']);
	$senha =   PHP_SEGURO($_POST['senha']);
	$CRSF =   PHP_SEGURO($_POST['_csrf']);
	#------------------------------------------------------------#
	if(empty($CRSF)) {
		echo '<div class="alert alert-warning " role="alert"><i class="fas fa-exclamation-circle"></i>Oops! Houve um erro ao obter dados atualize sua página.
            </div>';
	}
	if(empty($email)) {
		echo '<div class="alert alert-warning " role="alert"><i class="fas fa-exclamation-circle"></i>Oops! Insira um e-mail no formulário.
            </div>';
	}
	if(filter_var($email, FILTER_VALIDATE_EMAIL) AND !empty($email)){}else{
     echo '<div class="alert alert-warning " role="alert"><i class="fas fa-exclamation-circle"></i>Oops! Insira um e-mail válido no formulário.
            </div>';
    }
	if(empty($senha)) {
		echo '<div class="alert alert-warning " role="alert"><i class="fas fa-exclamation-circle"></i>Oops! Insira sua senha no formulário.
            </div>';
	}
	#------------------------------------------------------------#	
	$query = "SELECT * FROM usuarios WHERE email = '$email'";
	$result = mysqli_query($mysqli , $query) or die (mysqli_error($mysqli));
	if (mysqli_num_rows($result) > 0) {
		$row = mysqli_fetch_array($result);
			$user_idx = $row['id'];
			$emailbd = $row['email'];
			$pass = $row['senha'];
			if (password_verify($senha, $pass)) {
				$data = date('Y-m-d H:i:s');
				$datadsd = date('Y-m-d');
				$_token_easy = md5(sha1(mt_rand()).$data.$emailbd.$user_idx);
				$_token = CRIPT_AES('encrypt', $_token_easy);
				// Proteção XSS, pois podemos imprimir esse valor
				$users_id = preg_replace("/[^0-9]+/", "", $user_idx);
				// ==========  CRIANDO ROTA DE SISTEMA =====================================#
				$_SESSION['token_usuarios_encrypted'] = CRIPT_AES('encrypt', $users_id);
				$_SESSION['crsf_token_usuarios'] = $_token;
				$_SESSION['anti_crsf_token_usuarios'] = $CRSF;
				if(isset($_SESSION['token_usuarios_encrypted']) && isset($_SESSION['crsf_token_usuarios']) && isset($_SESSION['anti_crsf_token_usuarios'])){
					echo "<div class='alert alert-success' role='alert'><i class='fa fa-check-circle'></i> Acessando Conta aguarde....</div><script>  setTimeout('window.location.href=\"".$painel_user."\";', 3000); </script>";
				}else{
					echo '<div class="alert alert-warning" role="alert"><i class="fa fa-exclamation-circle"></i> Tente novamente.</div>';
				}
			}else{
				echo '<div class="alert alert-warning" role="alert"><i class="fa fa-exclamation-circle"></i> Insira uma senha válida.</div>';
			}
	}else{
		echo '<div class="alert alert-warning" role="alert"><i class="fa fa-exclamation-circle"></i>Seus dados não foram encontrados contate seu Suporte.
            </div>';
	}
}
#------------------------------------------------------------#