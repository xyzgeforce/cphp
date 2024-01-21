<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
session_start();
# ----------------------------------------------------------------------------------------------------------#
include_once('../sys/conexao.php');
include_once('../sys/funcao.php');
# ----------------------------------------------------------------------------------------------------------#
include_once("../sys/CSRF_Protect.php");
$csrf = new CSRF_Protect();
# ----------------------------------------------------------------------------------------------------------#
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Painel Adm - BetFyrie</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="<?=$docs_app_adm;?>bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?=$docs_app_adm;?>bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<?=$docs_app_adm;?>bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?=$docs_app_adm;?>dist/css/AdminLTE.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <script src="<?=$docs_app_adm;?>assets/js/jquery-3.5.0.min.js"></script>
  <style>
      #response {
        display: none; /* Oculta a div inicialmente */
      }
  </style>
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="<?=$docs_app_adm;?>"><b><i class="fa fa-diamond"></i> PAINEL </b>ADMIN</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Insira os dados de Acesso</p>

    <form  id="form-acessar">
      <div id="response"></div>
    
      <div class="form-group has-feedback">
        <input type="email" class="form-control" name="email" id="email" placeholder="Insira seu e-mail" required>
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" name="senha" id="senha" placeholder="Insira sua Senha" required>
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <!-- /.col -->
        <div class="col-xs-12">
          <?php $csrf->echoInputField(); ?>
        
        
          <button type="submit" class="btn btn-primary btn-block btn-flat">Acessar</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="<?=$docs_app_adm;?>bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="<?=$docs_app_adm;?>bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<script>
  $(document).ready(function() {
    $('#form-acessar').submit(function(event) {
      event.preventDefault();
      let formData = $(this).serialize();
      $.ajax({
        url: 'ajax/form-acessar.php',
        type: 'POST',
        data: formData,
        success: function(response) {
          $('#response').html(response).show(); // Exibe a div de resposta
          setTimeout(function() {
            $('#response').hide(); // Oculta a div após 5 segundos
          }, 9000);
        }
      });
    });
  });
</script>

</body>
</html>
