<?php
session_start();
include_once('../sys/conexao.php');
include_once('../sys/funcao.php');
include_once('../sys/crud.php');
#------------------------------------------------------------#
#capta dados do form
if (isset($_POST['nome_user']) && isset($_POST['email']) && isset($_POST['senha']) && isset($_POST['_csrf'])) {
	$nome_user =  PHP_SEGURO($_POST['nome_user']);
	$email =  PHP_SEGURO($_POST['email']);
	$senha =   PHP_SEGURO($_POST['senha']);
	$patro =   PHP_SEGURO($_POST['afiliado']);
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
	if(strlen($senha) < 6){
		echo '<div class="alert alert-warning " role="alert"><i class="fas fa-exclamation-circle"></i> Insira uma senha mais forte.</div>';
	}
	if(strlen($nome_user) < 6){
		echo '<div class="alert alert-warning " role="alert"><i class="fas fa-exclamation-circle"></i> Insira seu Nome Completo.</div>';
	}
	if(empty($patro)){
		$patro  = $refer_padrao; // ref master
	}else{
		$patro  = $patro;
	}
	#------------------------------------------------------------#	
	$query = "SELECT * FROM usuarios WHERE email = '$email'";
	$result = mysqli_query($mysqli , $query) or die (mysqli_error($mysqli));
	if (mysqli_num_rows($result) > 0) {
		//ja tem cadastro
		echo "<div class='alert alert-success' role='alert'><i class='fas fa-exclamation-circle'></i> Acesse sua Conta agora.</div><script>  setTimeout('window.location.href=\"".$url_base."\";', 3000); </script>";
	}else{
		//insere cad
		
		$senha =  password_hash($senha, PASSWORD_DEFAULT, array("cost" => 10));
        $sql1 = $mysqli->prepare("INSERT INTO usuarios (nome,email,senha,afiliado) VALUES (?,?,?,?)");
		$sql1->bind_param("ssss",$nome_user,$email,$senha,$patro);
		if($sql1->execute()){
			$id = $sql1 -> insert_id;
			$res = criar_financeiro($id);                 // cria financeiro user
			$res_tokenrefer = criar_tokenrefer($id);     // cria token refer user
			$criar_user_api = criarUsuarioAPI($email);  // cria user na api fiver
			if($res == 1  AND $res_tokenrefer == 1  AND $criar_user_api == 1){
				// destruir a sessao q capta o refer
				if(isset($_SESSION['CAP_REFER'])){
					unset($_SESSION['CAP_REFER']);
				}
				echo "<div class='alert alert-success' role='alert'><i class='fa fa-check-circle'></i> Conta criada com sucesso! Acesse sua conta.....</div><script>  setTimeout('window.location.href=\"".$url_base."\";', 3000); </script>";
			}else{
				echo '<div class="alert alert-warning " role="alert"><i class="fas fa-exclamation-circle"></i> Não foi possível realizar seu cadastro tente novamente. </div>';
			}
		}else{
			echo '<div class="alert alert-warning " role="alert"><i class="fas fa-exclamation-circle"></i> Não foi possível realizar seu cadastro tente novamente. </div>';
		}
	}
}



