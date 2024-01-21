<?php
session_start();
include_once('../../sys/conexao.php');
include_once('../../sys/funcao.php');
include_once('../../sys/crud-adm.php');
include_once('../../sys/checa_login_adm.php');
#expulsa user
checa_login_adm();
#------------------------------------------------------------#
function att_providers($code,$name,$type,$providerStatus){
	global $mysqli;
	$query = "SELECT * FROM provedores WHERE code='".$code."' AND name='".$name."' AND type='".$type."'";
	$result = mysqli_query($mysqli , $query);
	if (mysqli_num_rows($result) > 0) {
		$data = mysqli_fetch_assoc($result);
		$id = $data['id'];
		$sql = $mysqli->prepare("UPDATE provedores SET status=? WHERE id=?");
		$sql->bind_param("si",$providerStatus,$id);
		if($sql->execute()) {
			$r_data = 1;
		}else{
			$r_data = 0;
		}
	}else{
		$sql1 = $mysqli->prepare("INSERT INTO provedores (code,name,type,status) VALUES (?,?,?,?)");
		$sql1->bind_param("ssss",$code,$name,$type,$providerStatus);
		if($sql1->execute()){
			$r_data = 1;
		}else{
			$r_data = 0;
		}
	}
	
	return $r_data;
}


#capta dados do form
if (isset($_POST['_csrf'])) {
	#------------------------------------------------------------#
	if(!empty($data_fiverscan['agent_code']) AND !empty($data_fiverscan['agent_token'])){
	
		$postArray = [
			'method' => 'provider_list', 
			'agent_code' => $data_fiverscan['agent_code'], 
			'agent_token' => $data_fiverscan['agent_token']
		];
		$jsonData = json_encode($postArray);
		$headerArray = ['Content-Type: application/json'];
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $data_fiverscan['url']);
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonData);
		curl_setopt($ch, CURLOPT_HTTPHEADER, $headerArray);
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		$res = curl_exec($ch);
		curl_close($ch);
		$data = json_decode($res, true);
		if ($data === null && json_last_error() !== JSON_ERROR_NONE) {
			die('Erro na decodificação JSON: ' . json_last_error_msg());
		}
		if($data['status'] == 1){
			$status = $data['status'];
			$msg = $data['msg'];
			$providers = $data['providers'];
			$count=0;
			$success_count=0;
			// Itera sobre os provedores
			foreach ($providers as $provider) {
				$code = $provider['code'];
				$name = $provider['name'];
				$type = $provider['type'];
				$providerStatus = $provider['status'];
				$count++;
				$success_count  += att_providers($code,$name,$type,$providerStatus);
			}
			
			if($count == $success_count){
				echo "<div class='alert alert-success' role='alert'><i class='fa fa-check-circle'></i> Dados atualizados com sucesso.</div><script>  setTimeout('window.location.href=\"".$painel_adm_provedores_games."\";', 3000); </script>";
			}else{
				echo "<div class='alert alert-warning' role='alert'><i class='fa fa-exclamation-circle'></i> Revise seus dados de Api..</div><script>  setTimeout('window.location.href=\"".$painel_adm_provedores_games."\";', 3000); </script>";
			}
			
		}else{
			echo "<div class='alert alert-warning' role='alert'><i class='fa fa-exclamation-circle'></i> Revise seus dados de Api..</div><script>  setTimeout('window.location.href=\"".$painel_adm_provedores_games."\";', 3000); </script>";
			
		}
	}
}


