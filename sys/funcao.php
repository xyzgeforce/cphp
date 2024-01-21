<?php
//=======================================#
$pasta_url = '/';
//=======================================#
//FUNÇÃO PARA CAPTAR A URL DO  SISTEMA ==#
function pega_http_https() {
    $is_secure = false;
    if (isset($_SERVER['HTTPS']) && strtolower($_SERVER['HTTPS']) == 'on') {
        $is_secure = true;
    } elseif (!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https' || !empty($_SERVER['HTTP_X_FORWARDED_SSL']) && $_SERVER['HTTP_X_FORWARDED_SSL'] == 'on') {
        $is_secure = true;
    }
    return $is_secure ? 'https' : 'http';
}

function url_sistema() {
    global $pasta_url;
    $protocol = pega_http_https();
    $system_url = $protocol . "://" . $_SERVER['HTTP_HOST'] . $pasta_url;
    return rtrim($system_url, '/');
}
#==================================//
#==================================//
#==================================//
# VARIAVEIS ========================//
//modo sandbox   0 // real 1
$tipoAPI_SUITPAY = 1;
$contato_suporte = "#";
$refer_padrao = 'af21Zd9OXRc';  # refer padrão nos cads
#==================================//
#==================================//
#==================================//
#==================================//
#==================================//
//-------------- URL PADRÃO -------//
if (php_sapi_name() != "cli") {
    $url_base = url_sistema() . '/';
    $url_notificacao_ipn = url_sistema() . '/ipn/suitpay';
	#-----------------------------------------#
    $painel_user = url_sistema() . '/app-user';
    $painel_sair = url_sistema() . '/app-user/sair';
    $painel_minhaconta = url_sistema() . '/app-user/minha-conta';
    $painel_afiliado = url_sistema() . '/app-user/afiliado';
    $painel_afiliado_ver = url_sistema() . '/app-user/ver/';
    $painel_afiliado_historico_de_saque = url_sistema() . '/app-user/historico-de-saque';
    $painel_afiliado_bonus_historico = url_sistema() . '/app-user/bonus-historico';
    $painel_afiliado_hist_depositos = url_sistema() . '/app-user/hist-depositos';
    $painel_afiliado_all_games = url_sistema() . '/app-user/all-games';
    $painel_afiliado_aovivo = url_sistema() . '/app-user/aovivo';
    $painel_afiliado_cassino = url_sistema() . '/app-user/cassino';
    $painel_afiliado_popular = url_sistema() . '/app-user/popular';
	
	
	
    $painel_gerapix_api = url_sistema() . '/app-user/form-gerapix-api.php';
    $painel_afiliado_sol_saque = url_sistema() . '/app-user/form-sol-saque.php';
    $painel_afiliado_sol_saque_afiliados = url_sistema() . '/app-user/form-sol-saque-afiliados.php';
	
	
	#LINKS PAGINAS FRONT ================================#
    $cassino_aovivo = url_sistema() . '/aovivo';
    $page_cassino = url_sistema() . '/cassino';
    $termos = url_sistema() . '/termos-de-uso';
    $faq = url_sistema() . '/faq';
    $gambling = url_sistema() . '/gambling';
    $popular = url_sistema() . '/popular';
    $indique = url_sistema() . '/indique';
	#===================================================#
	#$painel_user = url_sistema() . '/app-user/games/ver/';
	 

	#PAINEL ADM
	$painel_adm = $url_base.'app-adm/';
	$painel_adm_acessar = $painel_adm.'acessar';
	$painel_adm_sair = $painel_adm.'sair';
	$painel_adm_administradores = $painel_adm.'administradores';
	$painel_adm_cupons = $painel_adm.'cupons';
	$painel_adm_cpa = $painel_adm.'cpa';
	$painel_adm_slider_front = $painel_adm.'slider-front';
	$painel_adm_front_site = $painel_adm.'front-site';
	$painel_adm_suit_pay = $painel_adm.'suit-pay';
	$painel_adm_provedores_games = $painel_adm.'provedores-games';
	$painel_adm_slots_games = $painel_adm.'slots-games';
	$painel_adm_financeiro_sistema = $painel_adm.'financeiro-sistema';
	$painel_adm_listar_usuarios = $painel_adm.'listar-usuarios';
	$painel_adm_ver_usuarios = $painel_adm.'ver-usuarios/';
	$painel_adm_saldo_api_js = $painel_adm.'saldo-api-js';
	$painel_adm_depositos_pendentes = $painel_adm.'depositos-pendentes';
	$painel_adm_all_depositos = $painel_adm.'all-depositos';
	$painel_adm_saques_pendentes = $painel_adm.'saques-pendentes';
	$painel_adm_all_saques = $painel_adm.'all01-saques';
	$painel_adm_view_game = $painel_adm.'view-game/';
	
	
	
	#BASE DOCS DO SISTEMA
	$docs_site = $url_base.'docs_cassino/';
	$docs_uploads = $url_base.'uploads/';
	$docs_uploads_img_triste = $url_base.'docs_cassino/images/triste.png';
	$docs_app_adm = $url_base.'docs_painel/';
	
}


//========================================================//
// Esta função é para impedir caracteres especiais
function PHP_SEGURO($string) {
	global $mysqli;
	$string = trim($string);
	$string = mysqli_real_escape_string($mysqli, $string);
	$string = htmlspecialchars($string, ENT_QUOTES,'UTF-8');
	$string = str_replace('\r\n', " <br>", $string);
	$string = str_replace('\n\r', " <br>", $string);
	$string = str_replace('\r', " <br>", $string);
	$string = str_replace('\n', " <br>", $string);
	$string = str_replace('&amp;#', '&#', $string);
	$string = stripslashes($string);
	
	return $string;
}
//========================================================//
// notificações swall alert
function alertas_swall($tipo,$titulo,$tempo){
	switch ($tipo) {
		case 'erro':
			$alerta_x = '<script>
							$(document).ready(function(){
							Swal.fire({
							position: "center",
							icon: "error",
							title: "'.$titulo.'",
							showConfirmButton: false,
							timer: '.$tempo.'
							});
						});
				</script>;
				';
			break;
		case 'ok':
			$alerta_x = '<script>
							$(document).ready(function(){
							Swal.fire({
							  position: "center",
							  icon: "success",
							  title: "'.$titulo.'",
							  showConfirmButton: false,
							  timer: '.$tempo.'
							});
						});
				</script>';
			break;
		case 'aviso':
			$alerta_x = '<script>
							$(document).ready(function(){
							Swal.fire({
							position: "center",
							icon: "warning",
							title: "'.$titulo.'",
							showConfirmButton: false,
							timer: '.$tempo.'
							});
						});
				</script>';
			break;
		
	}
	return $alerta_x;
}
//========================================================//
// notificações swall alert
function alertas_toaster($tipo, $titulo, $timer =null) {
	switch ($tipo) {
		case 'erro':
			$alerta_x = '<script>
								$(document).ready(function(){
								
								Command: toastr["error"]("' . $titulo . '")
								toastr.options = {
									"closeButton": false,
									"debug": false,
									"newestOnTop": false, 
									"progressBar": true,
									"positionClass": "toast-bottom-center",
									"preventDuplicates": false,
									"onclick": null,
									"showDuration": "300",
									"hideDuration": "1000",
									"timeOut": "5000",
									"extendedTimeOut": "1000",
									"showEasing": "swing",
									"hideEasing": "linear",
									"showMethod": "fadeIn",
									"hideMethod": "fadeOut"
							    }
								
							});
					</script>
					';
			break;
		case 'ok':
			$alerta_x = '<script>
								$(document).ready(function(){
								
								Command: toastr["success"]("", "' . $titulo . '")
								toastr.options = {
								"closeButton": false,
								"debug": false,
								"newestOnTop": true,
								"progressBar": true,
								"positionClass": "toast-bottom-center",
								"preventDuplicates": true,
								"onclick": null,
								"showDuration": "300",
								"hideDuration": "1000",
								"timeOut": "5000",
								"extendedTimeOut": "1000",
								"showEasing": "swing",
								"hideEasing": "linear",
								"showMethod": "fadeIn",
								"hideMethod": "fadeOut"
								}
								
							});
					</script>';
			break;
		case 'aviso':
			$alerta_x = '<script>
								$(document).ready(function(){
								
								Command: toastr["warning"]("' . $titulo . '")
								toastr.options = {
								"closeButton": false,
								"debug": false,
								"newestOnTop": false,
								"progressBar": true,
								"positionClass": "toast-bottom-center",
								"preventDuplicates": true,
								"onclick": null,
								"showDuration": "300",
								"hideDuration": "1000",
								"timeOut": "5000",
								"extendedTimeOut": "1000",
								"showEasing": "swing",
								"hideEasing": "linear",
								"showMethod": "fadeIn",
								"hideMethod": "fadeOut"
								}
								
							});
					</script>';
			break;
	}
	return $alerta_x;
}
//========================================================//
//###### Criptografia de AES-256-CBC ######################
function CRIPT_AES($action, $string){
    $output = false;
    $encrypt_method = "AES-256-CBC";
    $secret_key = '20245089347RePbOt';
    $secret_iv = 'SSM5aD4mos87&RePbOt65';
    // hash
    $key = hash('sha256', $secret_key);    
    // iv - encrypt method AES-256-CBC expects 16 bytes 
    $iv = substr(hash('sha256', $secret_iv), 0, 16);
    if ( $action == 'encrypt' ) {
        $output = openssl_encrypt($string, $encrypt_method, $key, 0, $iv);
        $output = base64_encode($output);
    } else if( $action == 'decrypt' ) {
        $output = openssl_decrypt(base64_decode($string), $encrypt_method, $key, 0, $iv);
    }
    return $output;
}
//#####################################################################################
// Criptografia Base_64
function encodeAll($string) {
    $encoded = base64_encode(base64_encode(base64_encode(base64_encode($string))));
    return $encoded;
}
//========================================================================================================#
function decodeAll($string) {
    $decoded = base64_decode(base64_decode(base64_decode(base64_decode($string))));
    return $decoded;
}
//========================================================================================================#
// Gera URL AMIGAVEL
function url_amigavel($nom_tag,$slug="-") {
  	$string = strtolower($nom_tag);
	
	// Código ASCII das vogais
	$ascii['a'] = range(224, 230);
	$ascii['e'] = range(232, 235);
	$ascii['i'] = range(236, 239);
	$ascii['o'] = array_merge(range(242, 246), array(240, 248));
	$ascii['u'] = range(249, 252);
	
	// Código ASCII dos outros caracteres
	$ascii['b'] = array(223);
	$ascii['c'] = array(231);
	$ascii['d'] = array(208);
	$ascii['n'] = array(241);
	$ascii['y'] = array(253, 255);
	
	foreach ($ascii as $key=>$item) {
	    $acentos = '';
	    foreach ($item AS $codigo) $acentos .= chr($codigo);
	    $troca[$key] = '/['.$acentos.']/i';
	}
	
	$string = preg_replace(array_values($troca), array_keys($troca), $string);
	
	// Slug?
	if ($slug) {
	    // Troca tudo que não for letra ou número por um caractere ($slug)
	    $string = preg_replace('/[^a-z0-9]/i', $slug, $string);
	    // Tira os caracteres ($slug) repetidos
	    $string = preg_replace('/' . $slug . '{2,}/i', $slug, $string);
	    $string = trim($string, $slug);
	}
	return $string;
}
// Função para gerar SLUGS codes para referencia dos afiliados
function gerar_pass_key($largura=16,$api=""){    
    $letras_numeros = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"; 
    srand((double)microtime()*1000000); 
    for($i=0; $i<$largura; $i++) { 
      $api.= $letras_numeros[rand()%strlen($letras_numeros)]; 
    } 
  return $api; 
}
// Função para gerar SLUGS codes para referencia dos afiliados
function token_aff($largura=8,$api=""){    
    $letras_numeros = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"; 
    srand((double)microtime()*1000000); 
    for($i=0; $i<$largura; $i++) { 
      $api.= $letras_numeros[rand()%strlen($letras_numeros)]; 
    } 
  return $api; 
}
function token_id_transacao($largura=18,$api=""){    
    $letras_numeros = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"; 
    srand((double)microtime()*1000000); 
    for($i=0; $i<$largura; $i++) { 
      $api.= $letras_numeros[rand()%strlen($letras_numeros)]; 
    } 
  return $api; 
}
//Função Reais
function Reais2($value) {
	$reais = number_format($value, 2, ',', '.');
	return $reais;
}
#somente numeros
function somente_numeros($var){
	return preg_replace('/[^0-9]/', '', $var);
}

function ver_data($dta_pagamento) {
    $inserido = $dta_pagamento;
    return date('d/m/Y H:i:s', strtotime($inserido));
}

function ver_data_hoje($dta_pagamento,$hora) {
    $inserido = $dta_pagamento.' '.$hora;
    return date('d/m/Y H:i:s', strtotime($inserido));
}

//========================================================================================================#
#validar CPF
function validarCPF($cpf) {
    // Remover caracteres não numéricos
    $cpf = preg_replace('/[^0-9]/', '', $cpf);

    // Verificar se o CPF tem 11 dígitos
    if (strlen($cpf) != 11) {
        return false;
    }

    // Verificar se todos os dígitos são iguais (evitar CPFs inválidos, mas com dígitos iguais)
    if (preg_match('/^(\d)\1*$/', $cpf)) {
        return false;
    }

    // Separar os dígitos
    $digitoVerificador1 = intval($cpf[9]);
    $digitoVerificador2 = intval($cpf[10]);

    // Calcular o primeiro dígito verificador
    $soma = 0;
    for ($i = 0; $i < 9; $i++) {
        $soma += intval($cpf[$i]) * (10 - $i);
    }
    $resto = $soma % 11;
    $digitoCalculado1 = ($resto < 2) ? 0 : 11 - $resto;

    // Calcular o segundo dígito verificador
    $soma = 0;
    for ($i = 0; $i < 10; $i++) {
        $soma += intval($cpf[$i]) * (11 - $i);
    }
    $resto = $soma % 11;
    $digitoCalculado2 = ($resto < 2) ? 0 : 11 - $resto;

    // Verificar se os dígitos calculados coincidem com os dígitos verificadores informados
    return ($digitoCalculado1 == $digitoVerificador1 && $digitoCalculado2 == $digitoVerificador2);
}
//========================================================================================================#










	
	