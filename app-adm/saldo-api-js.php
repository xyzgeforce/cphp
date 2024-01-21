<?php
  #======================================#
  ini_set('display_errors', 1);
  error_reporting(E_ALL);
  #======================================#
  session_start();
  include_once("../sys/conexao.php");
  include_once("../sys/funcao.php");
  include_once("../sys/crud-adm.php");
  include_once('../sys/checa_login_adm.php');
  include_once("../sys/CSRF_Protect.php");
  $csrf = new CSRF_Protect();
  #======================================#
  #expulsa user
  checa_login_adm();
  #======================================#
  echo 'R$'. Reais2(balance_api());
  
  
?>