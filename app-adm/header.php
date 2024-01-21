<?php
  #======================================#
  ini_set('display_errors', 1);
  error_reporting(E_ALL);
  #======================================#
  session_start();
  include_once("../sys/conexao.php");
  include_once("../sys/funcao.php");
  include_once("../sys/crud.php");
  include_once("../sys/crud-adm.php");
  include_once('../sys/checa_login_adm.php');
  include_once("../sys/CSRF_Protect.php");
  $csrf = new CSRF_Protect();
  #======================================#
  #expulsa user
  checa_login_adm();
  #======================================#
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Painel Adm - MXV</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="<?=$docs_app_adm;?>bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?=$docs_app_adm;?>bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<?=$docs_app_adm;?>bower_components/Ionicons/css/ionicons.min.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="<?=$docs_app_adm;?>bower_components/jvectormap/jquery-jvectormap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?=$docs_app_adm;?>dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="<?=$docs_app_adm;?>dist/css/skins/_all-skins.min.css">
  
  
  <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
  <!-- jQuery 3 -->
  <script src="<?=$docs_app_adm;?>dist/js/jquery-3.5.0.min.js"></script>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <style>
    @keyframes fa-pisca {
         0% { opacity: 1; }
         50% { opacity: 0.5; }
         100% { opacity: 0; }
     }
    .fa-pisca {
       -webkit-animation: fa-pisca .75s linear infinite;
       -moz-animation: fa-pisca .75s linear infinite;
       -ms-animation: fa-pisca .75s linear infinite;
       -o-animation: fa-pisca .75s linear infinite;
       animation: fa-pisca .75s linear infinite;
    }
  </style>
  
  
</head>
<body class="hold-transition skin-red sidebar-mini">
<div class="wrapper">

  <header class="main-header">

    <!-- Logo -->
    <a href="<?=$painel_adm;?>" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>C</b>ADM</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b><i class="fa fa-diamond"></i> PAINEL </b>ADMIN</span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Notifications: style can be found in dropdown.less -->
          <?php if(count_saques_pendentes() >0){?>
            <li class="dropdown user user-menu">
              <a href="<?=$painel_adm_saques_pendentes;?>">
                <i class="fa fa-money fa-pisca"></i>
                <span class="label label-success"><?=count_saques_pendentes();?></span>
              </a>
            </li>
          <?php } ?>
          
          
          <li class="dropdown user user-menu">
            <a href="<?=$painel_adm_slots_games;?>">
              <i class="fa fa-gamepad"></i>
              <span class="label label-success"><?=qtd_games_ativos();?></span>
            </a>
          </li>
          <li class="dropdown user user-menu">
            <a href="#" data-toggle="modal" data-target="#modal-buscar">
              <i class="fa fa-search"></i>
            </a>
          </li>
          
          <!-- Notifications: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="<?=$docs_app_adm;?>dist/img/perfil.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs"><?=$_SESSION['data_adm']['nome'];?></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="<?=$docs_app_adm;?>dist/img/perfil.jpg" class="img-circle" alt="User Image">

                <p>
                  <?=$_SESSION['data_adm']['nome'];?> - Admin Slots
                </p>
              </li>
              <!-- Menu Body -->
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Perfil</a>
                </div>
                <div class="pull-right">
                  <a href="<?=$painel_adm_sair;?>" class="btn btn-default btn-flat">Sair</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
        </ul>
      </div>

    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="<?=$docs_app_adm;?>dist/img/perfil.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><?=$_SESSION['data_adm']['nome'];?></p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">Menu</li>
		<li><a href="<?=$painel_adm;?>"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
         <li class="treeview">
          <a href="#">
            <i class="fa fa-user"></i>
            <span>Usuários</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="<?=$painel_adm_listar_usuarios;?>"><i class="fa fa-circle-o"></i> Listar Usuários</a></li>
          </ul>
        </li>
		<li class="treeview">
          <a href="#">
            <i class="fa fa-money"></i>
            <span>Financeiro</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="<?=$painel_adm_financeiro_sistema;?>"><i class="fa fa-circle-o"></i> Financeiro Sistema</a></li>
            <li><a href="#"> ---------</a></li>
            <li><a href="<?=$painel_adm_depositos_pendentes;?>"><i class="fa fa-circle-o"></i> Depósitos Pendentes</a></li>
            <li><a href="<?=$painel_adm_all_depositos;?>"><i class="fa fa-circle-o"></i> Listar Depósitos</a></li>
            <li><a href="#"> ---------</a></li>
            <li><a href="<?=$painel_adm_saques_pendentes;?>"><i class="fa fa-circle-o"></i> Saques Pendentes</a></li>
            <li><a href="<?=$painel_adm_all_saques;?>"><i class="fa fa-circle-o"></i> Listar Saques</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-laptop"></i>
            <span>GateWay de Pagamento</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="<?=$painel_adm_suit_pay;?>"><i class="fa fa-circle-o"></i> SuitPay</a></li>
          </ul>
        </li>
		<li class="treeview">
          <a href="#">
            <i class="fa fa-laptop"></i>
            <span>Config Api Slot</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="<?=$painel_adm_provedores_games;?>"><i class="fa fa-circle-o"></i> Provedores Games</a></li>
            <li><a href="<?=$painel_adm_slots_games;?>"><i class="fa fa-circle-o"></i> Slots Games</a></li>
          </ul>
        </li>
        <!-- CONFIG FRONT SITE -->
		<li class="treeview">
          <a href="#">
            <i class="fa fa-cogs"></i>
            <span>Config Front Site</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="<?=$painel_adm_front_site;?>"><i class="fa fa-circle-o"></i> Front Site</a></li>
            <li><a href="<?=$painel_adm_slider_front;?>"><i class="fa fa-circle-o"></i> Slider Front</a></li>
          </ul>
        </li>
		<!-- AFILIADOS -->
		<li class="treeview">
          <a href="#">
            <i class="fa fa-users"></i>
            <span>Afiliados</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="<?=$painel_adm_cpa;?>"><i class="fa fa-circle-o"></i> Config. CPA</a></li>
            <li><a href="<?=$painel_adm_cupons;?>"><i class="fa fa-circle-o"></i> Cupons</a></li>
          </ul>
        </li>
		<!-- ADMINISTRADORES -->
		<li><a href="<?=$painel_adm_administradores;?>"><i class="fa fa-diamond"></i> <span>Administradores</span></a></li>
		<!-- SAIR -->
	    <li><a href="<?=$painel_adm_sair;?>"><i class="fa fa-circle-o text-red"></i> <span>Sair</span></a></li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small>Painel de Controle</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>
