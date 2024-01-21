<?php
session_start();
include_once('../../sys/conexao.php');
include_once('../../sys/funcao.php');
include_once('../../sys/crud-adm.php');
include_once('../../sys/checa_login_adm.php');
#expulsa user
checa_login_adm();
#------------------------------------------------------------#
function att_game_slots_providers($gameCode,$gameName,$banner,$gameStatus,$provedor){
	global $mysqli;
	//$provedorxx = preg_replace("/[^a-zA-Z]/", "", $provedor);
	$stmt = $mysqli->prepare("SELECT * FROM games WHERE game_code = ? AND game_name = ? AND provider = ?");
	$stmt->bind_param("sss", $gameCode,$gameName,$provedor);
	$stmt->execute();
	$result = $stmt->get_result();
	if($result->num_rows > 0){
		$row = $result->fetch_assoc();
		$id = $row['id'];
		$sql = $mysqli->prepare("UPDATE games SET banner=?,status=? WHERE id=?");
		$sql->bind_param("ssi",$banner,$gameStatus,$id);
		if($sql->execute()) {
			$r_data = 1;
		}else{
			$r_data = 0;
		}
	}else{
		$sql1 = $mysqli->prepare("INSERT INTO games (game_code,game_name,banner,status,provider) VALUES (?,?,?,?,?)");
		$sql1->bind_param("sssss",$gameCode,$gameName,$banner,$gameStatus,$provedor);
		if($sql1->execute()){
			$r_data = 1;
		}else{
			$r_data = 0;
		}
	}
	
	return $r_data;
}


#capta dados do form
if (isset($_POST['_csrf']) && isset($_POST['code'])) {
	$provedor = PHP_SEGURO($_POST['code']);
	#------------------------------------------------------------#
	if(!empty($data_fiverscan['agent_code']) AND !empty($data_fiverscan['agent_token'])){
		$postArray = [
			"method"=> "game_list",
			'agent_code' => $data_fiverscan['agent_code'], 
			'agent_token' => $data_fiverscan['agent_token'],
			"provider_code"=> $provedor
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
			// Acessa itens específicos
			$status = $data['status'];
			$msg = $data['msg'];
			$games = $data['games'];
			$count=0;
			$success_count=0;
			// Itera sobre os provedores
			foreach ($games as $game) {
				$id = $game['id'];
				$gameCode = $game['game_code'];
				$gameName = $game['game_name'];
				$banner = $game['banner'];
				$gameStatus = $game['status'];
				$count++;
				$success_count  += att_game_slots_providers($gameCode,$gameName,$banner,$gameStatus,$provedor);
			}
			
			if($count == $success_count){
				echo "<div class='alert alert-success' role='alert'><i class='fa fa-check-circle'></i> Dados atualizados com sucesso.</div><script>  setTimeout('window.location.href=\"".$painel_adm_provedores_games."\";', 3000); </script>";
			}else{
				echo "<div class='alert alert-warning' role='alert'><i class='fa fa-exclamation-circle'></i> Revise seus dados de Api..</div><script>  setTimeout('window.location.href=\"".$painel_adm_provedores_games."\";', 3000); </script>";
				}
		
		}else{
			echo "<div class='alert alert-warning' role='alert'><i class='fa fa-exclamation-circle'></i> Revise seus dados de Api..
        </div><script>  setTimeout('window.location.href=\"".$painel_adm_provedores_games."\";', 3000); </script>";
		}
	}
}

