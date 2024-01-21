<?php
session_start();
include_once('../sys/conexao.php');
include_once('../sys/funcao.php');
include_once('../sys/crud.php');
global $mysqli;
// Receber dados da solicitação POST JSON
$data = json_decode(file_get_contents("php://input"), true);
// Verificar se o JSON foi decodificado com sucesso
if ($data === null && json_last_error() !== JSON_ERROR_NONE) {
    // Erro ao decodificar o JSON
    http_response_code(400); // Bad Request
    //echo json_encode(array('error' => 'Erro na decodificação do JSON.'));
    exit;
}
$idTransaction = PHP_SEGURO($data['idTransaction']);     		 // id da transação
$typeTransaction = PHP_SEGURO($data['typeTransaction']); 		// tipo de transação
$statusTransaction = PHP_SEGURO($data['statusTransaction']);	// Status de Transação
#====================================================================#
function busca_payment_id($id_user){
	global $mysqli;
	$qry = "SELECT * FROM transacoes WHERE usuario='".intval($id_user)."'  AND tipo='deposito' AND status='pago'";
	$res = mysqli_query($mysqli,$qry);
	if(mysqli_num_rows($res)>0){
		$ft = 1;
	}else{
		$ft = 0;
	}
	return $ft;
}
#====================================================================#
function retorna_token_id($token){
	global $mysqli;
	$qry = "SELECT * FROM usuarios WHERE token_refer='".$token."'";
	$res = mysqli_query($mysqli,$qry);
	if(mysqli_num_rows($res)>0){
		$data = mysqli_fetch_assoc($res);
		$ret = $data['id'];
	}else{
	   $ret = 0;
	}
	return $ret;
	
	
}
#====================================================================#
function busca_refer03_id($id){
	global $mysqli;
	$qry = "SELECT * FROM usuarios WHERE token_refer='".$id."'";
	$res = mysqli_query($mysqli,$qry);
	if(mysqli_num_rows($res)>0){
		$data = mysqli_fetch_assoc($res);
		if(!empty($data['afiliado'])){
		  $ret = retorna_token_id($data['afiliado']);
		}else{
		  $ret = 0;
		}
	}else{
	   $ret = 0;
	}
	return $ret;
}
#====================================================================#
function busca_refer03($id){
	global $mysqli;
	$qry = "SELECT * FROM usuarios WHERE id='".$id."'";
	$res = mysqli_query($mysqli,$qry);
	if(mysqli_num_rows($res)>0){
		$data = mysqli_fetch_assoc($res);
		if(!empty($data['afiliado'])){
		  $ret = retorna_token_id($data['afiliado']);
		}else{
		  $ret = 0;
		}
	}else{
	   $ret = 0;
	}
	return $ret;
}
#====================================================================#
function busca_refer02($id){
	global $mysqli;
	$qry = "SELECT * FROM usuarios WHERE id='".$id."'";
	$res = mysqli_query($mysqli,$qry);
	if(mysqli_num_rows($res)>0){
		$data = mysqli_fetch_assoc($res);
		if(!empty($data['afiliado'])){
		  $ret = retorna_token_id($data['afiliado']);
		}else{
		  $ret = 0;
		}
	}else{
	   $ret = 0;
	}
	return $ret;
}
#====================================================================#
function busca_refer01($token){
	global $mysqli;
	$qry = "SELECT * FROM usuarios WHERE token_refer='".$token."'";
	$res = mysqli_query($mysqli,$qry);
	if(mysqli_num_rows($res)>0){
		$data = mysqli_fetch_assoc($res);
		$ret = $data['id'];
	}else{
	   $ret = 0;
	}
	return $ret;
}
#====================================================================#
function insert_for_cpa_n03($id){
	global $mysqli,$data_afiliados_cpa_rev;
	$cpanv03 = $data_afiliados_cpa_rev['cpaLvl3'];
	$id_user = busca_refer03($id);
	$bcs_user_id = retorna_token_id($id_user);
	if($bcs_user_id == 1){
		$sql = $mysqli->prepare("UPDATE financeiro SET saldo_afiliados = saldo_afiliados + ? WHERE usuario = ?");
		$sql->bind_param("si",$cpanv03,$bcs_user_id);
		if($sql->execute()){
			#----------------------------------------------------------------------#
			$data = date('Y-m-d H:i:s');
			$sql12 = $mysqli->prepare("INSERT INTO pay_valores_cassino (id_user,valor,data_time,tipo) VALUES (?,?,?,0)");
			$sql12->bind_param("sss",$bcs_user_id,$cpanv02,$data);
			$sql12->execute();
			#----------------------------------------------------------------------#
		}
	}
}
#====================================================================#
function insert_for_cpa_n02($id){
	global $mysqli,$data_afiliados_cpa_rev;
	$cpanv02 = $data_afiliados_cpa_rev['cpaLvl2'];
	$bcs_user_id = busca_payment_id($id);
	$id_tokenrefer_nv03 = busca_refer03($id);
	$sql = $mysqli->prepare("UPDATE financeiro SET saldo_afiliados = saldo_afiliados + ? WHERE usuario = ?");
	$sql->bind_param("si",$cpanv02,$id);
	if($sql->execute()){
		//$insert_pay_cpa_n03 = insert_for_cpa_n03($id_tokenrefer_nv03);
		#----------------------------------------------------------------------#
		$data = date('Y-m-d H:i:s');
		$sql12 = $mysqli->prepare("INSERT INTO pay_valores_cassino (id_user,valor,data_time,tipo) VALUES (?,?,?,0)");
		$sql12->bind_param("sss",$id,$cpanv02,$data);
		$sql12->execute();
		#----------------------------------------------------------------------#
	}
}
#====================================================================#
function insert_for_cpa_n01($id){
	global $mysqli,$data_afiliados_cpa_rev;
	$cpanv01 = $data_afiliados_cpa_rev['cpaLvl1'];
	$id_nv02 = busca_refer02($id);
	$sql = $mysqli->prepare("UPDATE financeiro SET saldo_afiliados = saldo_afiliados + ? WHERE usuario = ?");
	$sql->bind_param("si",$cpanv01,$id);
	if($sql->execute()){
		$insert_pay_cpa_n02 = insert_for_cpa_n02($id_nv02);
	}
	#----------------------------------------------------------------------#
	$data = date('Y-m-d H:i:s');
	$sql12 = $mysqli->prepare("INSERT INTO pay_valores_cassino (id_user,valor,data_time,tipo) VALUES (?,?,?,0)");
	$sql12->bind_param("sss",$id,$cpanv01,$data);
	$sql12->execute();
	#----------------------------------------------------------------------#
	
}
#====================================================================#
function busca_payment_tokenrefer($tokenrefer){
	global $mysqli;
	$qry = "SELECT * FROM usuarios WHERE token_refer='".$tokenrefer."'";
	$res = mysqli_query($mysqli,$qry);
	if(mysqli_num_rows($res)>0){
		$data = mysqli_fetch_assoc($res);
		//$idbd01 = busca_refer01($data['id']);
		$insert_pay_cpa_n01 = insert_for_cpa_n01($data['id']);
	}
}
#====================================================================#
#04
function busca_afiliado_nv01($id_user){
	global $mysqli;
	$qry = "SELECT * FROM usuarios WHERE id='".intval($id_user)."'";
	$res = mysqli_query($mysqli,$qry);
	if(mysqli_num_rows($res)>0){
		$data = mysqli_fetch_assoc($res);
		if(!empty($data['afiliado'])){
			$insert_pay_cpa_n01 = busca_payment_tokenrefer($data['afiliado']);
		}
	}
}
#====================================================================#
#03
function busca_valor_ipn($transacao_id){
	global $mysqli,$data_afiliados_cpa_rev,$tipoAPI_SUITPAY;
	$qry = "SELECT * FROM transacoes WHERE transacao_id='".$transacao_id."'";
	$res = mysqli_query($mysqli,$qry);
	if(mysqli_num_rows($res)>0){
		$data = mysqli_fetch_assoc($res);
		$id = $data['usuario'];
		$retornaUSER = data_user_id($id);
		#MODO SANDBOX
		if($tipoAPI_SUITPAY == 0){
			if($data['valor'] >= $data_afiliados_cpa_rev['minDepForCpa']){
				$insert_nv01 = busca_afiliado_nv01($id);
			}
		}else{
			$retorna_insert_saldo_suit_pay = enviarSaldo($retornaUSER['email'], $data['valor']);
			if($retorna_insert_saldo_suit_pay['status'] == 1 AND $retorna_insert_saldo_suit_pay['msg'] == "SUCCESS"){
				// se o deposito for o minimo insere cpa
				if($data['valor'] >= $data_afiliados_cpa_rev['minDepForCpa']){
					$insert_nv01 = busca_afiliado_nv01($id);
				}
			}
		}
	}
}
#====================================================================#
#02
function att_paymentpix($transacao_id){
    global $mysqli;
    $sql = $mysqli->prepare("UPDATE transacoes SET status='pago' WHERE transacao_id=?");
    $sql->bind_param("s",$transacao_id);
    if($sql->execute()) {
		$buscar = busca_valor_ipn($transacao_id);
        $rf = 1;
    }else{
        $rf = 0;
    }
    return $rf;
}
#====================================================================#
#01
if(isset($idTransaction) AND $typeTransaction == "PIX" AND $statusTransaction == "PAID_OUT"){
	$att_transacao = att_paymentpix($idTransaction);
}
#MODO SANDBOX 
if($tipoAPI_SUITPAY == 0){
	if(isset($idTransaction) AND $typeTransaction == "PIX" AND $statusTransaction == "UNPAID"){
		$att_transacao = att_paymentpix($idTransaction);
	}
}
#====================================================================#


