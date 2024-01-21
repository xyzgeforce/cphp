<?php include_once('header.php');?>
  <!-- Content Wrapper. Contains page content -->
  

    <!-- Main content -->
    <section class="content">
      <!-- Info boxes -->
      <div class="row">
        <?php if(count_saques_pendentes() >0){?>
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="box box-default">
              <div class="box-body">
                <div class="alert alert-warning alert-dismissible">
                  <h4><i class="icon fa fa-warning fa-pisca"></i> Aviso de Saques Pendentes!</h4>
                  Você possui solicitações de saques  <strong>PENDENTES</strong> <a href="<?=$painel_adm_saques_pendentes;?>">[CLIQUE AQUI]</a>
                </div>
              </div>
            </div>
          </div>
        <?php }?>
        <?php if(empty($data_fiverscanpanel['agent_code']) AND empty($data_fiverscanpanel['agent_token'])){?>
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="box box-default">
              <div class="box-body">
                <div class="alert alert-warning alert-dismissible">
                  <h4><i class="icon fa fa-warning"></i> Aviso!</h4>
                  Você precisa inserir as configurações de <strong><i class="fa fa-gamepad"></i> API FIVERSCAN</strong> <a href="<?=$painel_adm_provedores_games;?>">[CLIQUE AQUI]</a>
                </div>
              </div>
            </div>
          </div>
         <?php } ?>      
        <?php if(empty($data_suitpay['client_id']) AND empty($data_suitpay['client_secret'])){?>
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="box box-default">
              <div class="box-body">
                <div class="alert alert-warning alert-dismissible">
                  <h4><i class="icon fa fa-warning"></i> Aviso!</h4>
                  Você precisa inserir as configurações financeiras da <strong> API SUITPAY</strong> <a href="<?=$painel_adm_suit_pay;?>">[CLIQUE AQUI]</a>
                </div>
              </div>
            </div>
          </div>
         <?php } ?>    
        <?php if($saldoapi_fiverscan <= 0){?>
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="box box-default">
              <div class="box-body">
                <div class="alert alert-danger alert-dismissible">
                  <h4><i class="icon fa fa-warning"></i> Aviso Saldo de Api Zerado!</h4>
                  Você precisa inserir saldo em sua conta FiverScan contate seu Agente <a href="<?=$contato_suporte;?>">[CLIQUE AQUI]</a> 
                </div>
              </div>
            </div>
          </div>
         <?php } ?>    
      
      
      
      
        <div class="col-md-12 col-sm-12 col-xs-12 text-center">
          <div class="info-box">
            <span class="info-box-icon bg-yellow"><i class="fa fa-diamond"></i></span>

            <div class="info-box-content">
              <span class="info-box-text"><strong>Saldo da API Cassino</strong></span>
              <span class="info-box-number" id="id-saldo-api">0.00</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-warning"><i class="fa fa-arrow-circle-up"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Depósito Pendentes</span>
              <span class="info-box-number">R$ <?=Reais2(depositos_pendentes());?></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="fa fa-arrow-circle-up"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Depósito Diario</span>
              <span class="info-box-number">R$ <?=Reais2(depositos_diarios());?></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="fa fa-arrow-circle-up"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Depósito Total</span>
              <span class="info-box-number">R$ <?=Reais2(depositos_total());?></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
       <!-- SAQUES -->
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-warning"><i class="fa fa-arrow-circle-down"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Saques Pendentes</span>
              <span class="info-box-number">R$ <?=Reais2(saques_pendentes());?></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="info-box">
              <span class="info-box-icon bg-red"><i class="fa fa-arrow-circle-down"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Saques Diario</span>
                <span class="info-box-number">R$ <?=Reais2(saques_diarios_pagos());?></span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="info-box">
              <span class="info-box-icon bg-red"><i class="fa fa-arrow-circle-down"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Saques Total</span>
                <span class="info-box-number">R$ <?=Reais2(saques_total());?></span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
        <!-- SALDO CASSINO -->
        <div class="col-md-12 col-sm-12 col-xs-12 text-center">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="fa fa-money"></i></span>

            <div class="info-box-content">
              <span class="info-box-text"><strong>Saldo Cassino</strong></span>
              <span class="info-box-number">R$  <?=Reais2(saldo_cassino());?></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- USUARIOS -->
        <div class="col-md-12 col-sm-12 col-xs-12 text-center">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="fa fa-users"></i></span>

            <div class="info-box-content">
              <span class="info-box-text"><strong>Total de Usuários</strong></span>
              <span class="info-box-number"> <?=qtd_usuarios();?></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- Visitas -->
        <div class="col-md-6 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="fa fa-pie-chart"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Visitas Diarias</span>
              <span class="info-box-number"> <?=visitas_count('diario');?> </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <div class="col-md-6 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="fa fa-pie-chart"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Visitas Total</span>
              <span class="info-box-number"> <?=visitas_count('total');?> </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
        
        
        <!-- GAMES -->
        <div class="col-md-6 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-warning"><i class="fa fa-gamepad"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Games Ativos</span>
              <span class="info-box-number"> <?=qtd_games_ativos();?> </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- PROVEDORES -->
        <div class="col-md-6 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-warning"><i class="fa fa-bug"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">PROVEDORES Ativos</span>
              <span class="info-box-number"> <?=qtd_provedor_ativos();?> </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
       <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<?php include_once('footer.php');?>