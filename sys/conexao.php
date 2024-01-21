<?php
//  -- Setar o timezone padrão do sistema  --------------------------------------------------------//
date_default_timezone_set("America/Sao_Paulo");
define('PRODUCAO', true);
if (PRODUCAO) {
    $bd = array(
        'local' => 'localhost', // local/ip
        'usuario' => 'betojeco_bet777', // user bd
        'senha' => '~pC[ZaDvi]J!', // senha bd
        'banco' => 'betojeco_bet777' // nome bd
    );
}else {
    $bd = array(
         'local' => 'localhost', // local/ip
        'usuario' => 'betojeco_bet777', // user bd
        'senha' => '~pC[ZaDvi]J!', // senha bd
        'banco' => 'betojeco_bet777' // nome bd
    );
}
#----------------------------------------------------------------------------------------------------------#
//-- conexao procedural --------------------------------------------------------------------------//
$mysqli = new mysqli($bd['local'], $bd['usuario'], $bd['senha'], $bd['banco']);
if ($mysqli->connect_errno) {
    echo "Erro ao Conectar o BD: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
    exit;
}
$mysqli->set_charset("utf8");
?>