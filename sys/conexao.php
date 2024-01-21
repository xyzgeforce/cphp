<?php
//  -- Setar o timezone padrão do sistema  --------------------------------------------------------//
date_default_timezone_set("America/Sao_Paulo");
define('PRODUCAO', true);
if (PRODUCAO) {
    $bd = array(
        'local' => 'localhost', // local/ip
        'usuario' => 'root', // user bd
        'senha' => '', // senha bd
        'banco' => 'new_winner@bet' // nome bd
    );
}else {
    $bd = array(
         'local' => 'localhost', // local/ip
        'usuario' => 'USUARIO_DB', // user bd
        'senha' => 'SENHA_DB', // senha bd
        'banco' => 'SUA_DB' // nome bd
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