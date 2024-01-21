<?php
   session_start();
   include_once("../sys/conexao.php");
   include_once("../sys/funcao.php");
   include_once("../sys/crud.php");
   include_once("../sys/CSRF_Protect.php");
   $csrf = new CSRF_Protect();
   #======================================#
   include_once('../sys/checa_login_user.php');
   
   #expulsa user
   checa_login_user();

//    #======================================#
//    function enviarRequestPix($url, $header, $data=null) {
//         $ch = curl_init();
//         $data_json = json_encode($data);
//         // Configurando as opções do cURL
//         curl_setopt($ch, CURLOPT_URL, $url);
//         if(!$data == null){
//             curl_setopt($ch, CURLOPT_POST, 1);
//             curl_setopt($ch, CURLOPT_POSTFIELDS, $data_json);
//         }
//         curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
//         curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
//         // Executando a requisição e obtendo a resposta
//         $response = curl_exec($ch);
//         // Fechando a conexão cURL
//         curl_close($ch);
//         return $response;
//     }
//    function requestToken($url, $header, $data) {
//         $ch = curl_init();
//         // Configurando as opções do cURL
//         curl_setopt($ch, CURLOPT_URL, $url);
//         curl_setopt($ch, CURLOPT_POST, 1);
//         curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
//         curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
//         curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
//         // Executando a requisição e obtendo a resposta
//         $response = curl_exec($ch);
//         // Fechando a conexão cURL
//         curl_close($ch);
//         return $response;
//     }

function generateQRCode($data) {
    // Carregue a biblioteca PHP QR Code
    require_once('../docs_cassino/libraries/phpqrcode/qrlib.php');
    // Caminho onde você deseja salvar o arquivo PNG do QRCode (opcional)
    $file = '../uploads/qrcode.png';
    // Gere o QRCode
    QRcode::png($data, $file);
    // Carregue o arquivo PNG do QRCode
    $qrCodeImage = file_get_contents($file);
    // Converta a imagem para base64
    $base64QRCode = base64_encode($qrCodeImage);
    return $base64QRCode;
} 

function insert_payment($insert){
    global $mysqli;
    $dataarray = $insert;
    $sql1 = $mysqli->prepare("INSERT INTO transacoes (transacao_id,usuario,valor,tipo,data_hora,qrcode,code,status) VALUES (?,?,?,?,?,?,?,?)");
    $sql1->bind_param("ssssssss",$dataarray['transacao_id'],$dataarray['usuario'],$dataarray['valor'],$dataarray['tipo'],$dataarray['data_hora'],$dataarray['qrcode'],$dataarray['code'],$dataarray['status']);
    if($sql1->execute()){  $ert = 1;
    }else{ $ert = 0; }
    return $ert;
}

  
function criarQrCodePagStart($valor,$cpf,$tipo) {
    global $data_pagstart;

    $transacao_id = 'SP'. rand(0, 999) .'-'.date('YMDHms');
    $data = get_object_vars(getToken());
  
    if(!isset($data["data"]->access_token)):
      echo "<div class='alert alert-danger' role='alert'> Erro ao processar dados tente mais tarde.</div>";
      exit;
    endif;
 
    $curl = curl_init();

    curl_setopt_array($curl, array(
      CURLOPT_URL => $data_pagstart['url'].'/wallet/partner/transactions/generate-anonymous-pix',
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_ENCODING => '',
      CURLOPT_MAXREDIRS => 10,
      CURLOPT_TIMEOUT => 0,
      CURLOPT_FOLLOWLOCATION => true,
      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
      CURLOPT_CUSTOMREQUEST => 'POST',
      CURLOPT_POSTFIELDS => json_encode(array(
          "value" => $valor,
          "name" => $_SESSION['data_user']['nome'],
          "document"=> $cpf,
          "tenant_id"=> $data_pagstart['tenant_id'],
          "expiration"=> 1200,
          "transaction_id"=>  "PIX".$transacao_id,
          "callback" => "https://futurama.com/api/pix/PIX".$transacao_id
      )),
      CURLOPT_HTTPHEADER => array(
        'Authorization: Bearer '. $data["data"]->access_token,
        'Content-Type: application/json'
      ),
    ));

    $response = curl_exec($curl);

    curl_close($curl);

    $data = json_decode($response, true);

    if(isset($data['data']['pix_key'])){
      $insert = array(
          'transacao_id' => "PIX".$transacao_id,
          'usuario'      => $_SESSION['data_user']['id'],
          'valor'        => $valor,
          'tipo'         => 'deposito',
          'data_hora'    => date('Y-m-d H:i:s'),
          'qrcode'       => generateQRCode($data["data"]['pix_key']),
          'status'       => 'processamento',
          'code'         => $data["data"]['pix_key']
      );

      $insert_paymentBD = insert_payment($insert);
     
      if($insert_paymentBD == 1){
      	$_SESSION['paymentpix'] = $insert;
      	echo '<p class="text-center"><img src="data:image/png;base64,'. $insert['qrcode'].'" alt="Imagem"></p><br/>
      	<input type="text" class="form-control" id="textoParaCopiar" value="'. $insert['code'].'"><br/>
      	<button class="btn btn-success btn-block" onclick="copiarTexto()"><i class="fa fa-qrcode"></i> Copiar Pix</button><br/>
      	<div class="alert alert-success" role="alert" id="mensagem" style="text-color:white;"></div>
      	';
      	echo '<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>';
      }else{
      	echo "<div class='alert alert-danger' role='alert'> Erro ao processar dados tente mais tarde.</div>";
      }
  }else{
      echo "<div class='alert alert-danger' role='alert'> Erro ao processar dados tente mais tarde.</div>";
  }
}
   
//    function criarQrCode($valor,$cpf,$tipo) {
//         global $data_suitpay,$painel_user,$tipoAPI_SUITPAY,$url_base;
//         $transacao_id = 'SP'. rand(0, 999) .'-'.date('YMDHms');
//         // Pega a data de hoje
//         $dataDeHoje = new DateTime();
//         // Adiciona um dia
//         $dataDeAmanha = $dataDeHoje->modify('+1 day');
//         // Formata a data para exibição
//         $dataFormatada = $dataDeAmanha->format('Y-m-d');
//         if($tipoAPI_SUITPAY == 1){
//             $url = $data_suitpay['url'].'/api/v1/gateway/request-qrcode';
//             $data = array(
//                 "requestNumber" => $transacao_id,
//                 "dueDate" => $dataFormatada,
//                 'amount' => $valor,
//                 'client' => array(
//                     'name' => $_SESSION['data_user']['nome'],
//                     'document' => preg_replace("/[^0-9]/", "", $cpf),
//                     "email" => $_SESSION['data_user']['email']
//                 )
//             );

//             $header = array(
//                 'ci: '.$data_suitpay['client_id'],
//                 'cs: '.$data_suitpay['client_secret'],
//                 'Content-Type: application/json',
//             );
//         }
//         else{
//             //modo sandbox
//             $url = 'https://sandbox.ws.suitpay.app/api/v1/gateway/request-qrcode';
//             $data = array(
//                 "requestNumber" => $transacao_id,
//                 "dueDate" => $dataFormatada,
//                 'amount' => $valor,
//                 'client' => array(
//                      'name' => $_SESSION['data_user']['nome'],
//                     'document' => preg_replace("/[^0-9]/", "", $cpf),
//                     "email" => $_SESSION['data_user']['email']
//                 )
//             );
//             $header = array(
//                 'ci: testesandbox_1687443996536',
//                 'cs: 5b7d6ed3407bc8c7efd45ac9d4c277004145afb96752e1252c2082d3211fe901177e09493c0d4f57b650d2b2fc1b062d',
//                 'Content-Type: application/json',
//             );
//         }
//         $response = enviarRequestPix($url, $header, $data);
//         $dados = json_decode($response, true);
//         if(isset($dados['idTransaction'])){
//             $insert = array(
//                 'transacao_id' =>  $dados['idTransaction'],
//                 'usuario' => $_SESSION['data_user']['id'],
//                 'valor' => $valor,
//                 'tipo' => 'deposito',
//                 'data_hora' => date('Y-m-d H:i:s'),
//                 'qrcode' => generateQRCode($dados['paymentCode']),
//                 'status' => 'processamento',
//                 'code' =>  $dados['paymentCode']
//             );
//             //insert transação
//             $insert_paymentBD = insert_payment($insert);
//             if($insert_paymentBD == 1){
//                 $_SESSION['paymentpix'] = $insert;
//                 echo '<p class="text-center"><img src="data:image/png;base64,'. $insert['qrcode'].'" alt="Imagem"></p>
//                 <br/>
//                 <input type="text" class="form-control" id="textoParaCopiar" value="'. $insert['code'].'"><br/>
//                 <button class="btn btn-success btn-block" onclick="copiarTexto()"><i class="fa fa-qrcode"></i> Copiar Pix</button><br/>
//                 <div class="alert alert-success" role="alert" id="mensagem" style="text-color:white;"></div>
//                 ';
                
                
//                 echo '<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>';
//                 //echo "<div class='alert alert-success' role='alert'><i class='fa fa-check-circle'></i> Aguarde seu QRCode Pix está sendo gerado..</div><script>  setTimeout('window.location.href=\"".$painel_user."\";', 3000); </script>";
//             }else{
//                 echo "<div class='alert alert-danger' role='alert'> Erro ao processar dados tente mais tarde.</div>";
//             }
//         }else{
//             echo "<div class='alert alert-danger' role='alert'> Erro ao processar dados tente mais tarde.</div>";
//         }
//     }



   if (isset($_POST['valor']) && isset($_POST['cpf']) && isset($_SESSION['data_user'])) {
        $valor = PHP_SEGURO($_POST['valor']);
        $cpf   = PHP_SEGURO($_POST['cpf']);

        if (!validarCPF($cpf)) {
            echo "<div class='alert alert-danger' role='alert'><i class='fa fa-info-circle'></i>  Insira um Cpf valido!</div><script>  setTimeout('window.location.href=\"".$painel_user."\";', 3000); </script>";
            exit();
        }
        
        if($valor < $dataconfig['mindep']){
            echo "<div class='alert alert-danger' role='alert'><i class='fa fa-info-circle'></i>  Insira um valor acima de R$ ".Reais2($dataconfig['mindep'])."!</div><script>  setTimeout('window.location.href=\"".$painel_user."\";', 3000); </script>";
            exit();
        }

        criarQrCodePagStart($valor, $cpf, null);
    }
    
?>