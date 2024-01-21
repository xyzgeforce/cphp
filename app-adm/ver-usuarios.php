<?php include_once('header.php');
if(isset($_REQUEST['slug'])){
  $id_user = decodeAll($_REQUEST['slug']);
  $qry = "SELECT * FROM usuarios WHERE id='".intval($id_user)."'";
  $res = mysqli_query($mysqli,$qry);
  $data = mysqli_fetch_assoc($res);
  
  
  $saldo_user = saldo_user($data['id']);
}
//========================================================================================================#
$url_atual =(isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
//========================================================================================================#
?>
    <!-- Main content -->
    <section class="content">
      <!-- Info boxes -->
      <div class="row">
        <div class="col-md-6 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="fa fa-arrow-circle-up"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Total Depósitos</span>
              <span class="info-box-number">R$ <?=Reais2(total_dep_id($data['id']));?></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <div class="col-md-6 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-red"><i class="fa fa-arrow-circle-down"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Total Saques</span>
              <span class="info-box-number">R$ <?=Reais2(total_saques_id($data['id']));?></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
        
        <div class="col-md-6 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-blue"><i class="fa fa-gamepad"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Saldo Cassino</span>
              <span class="info-box-number">R$ <?=Reais2($saldo_user['saldo']);?></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
        
        <div class="col-md-6 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-blue"><i class="fa fa-users"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Saldo Afiliados</span>
              <span class="info-box-number">R$ <?=Reais2($saldo_user['saldo_afiliado']);?></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
        <div class="col-md-12 col-lg-12">
          <div class="box box-primary">
          <div class="box-header with-border">
          <h3 class="box-title"><i class="fa fa-user"></i>Configuração de Usuário</h3>
          </div>
          <form method="post" role="form">
          <div class="box-body">
            <div class="row">
              <div class="col-lg-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">Nome de Usuário</label>
                  <input type="text" name="nome" value="<?=$data['nome'];?>" class="form-control" placeholder="Ex: Carlos Emanuel">
                </div>
              </div>
              <div class="col-lg-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">Token de Afiliado</label>
                  <input type="text" value="<?=$data['token_refer'];?>" class="form-control" readonly>
                </div>
              </div>
              <div class="col-md-6 col-lg-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">Nova Senha</label>
                  <input type="password" name="senha" class="form-control" placeholder="**********">
                </div>
              </div>
              <div class="col-md-6 col-lg-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">Repita a Nova Senha</label>
                  <input type="password" name="n_senha" class="form-control" placeholder="**********">
                </div>
              </div>
              
              
            </div>
         </div>

          <div class="box-footer">
          <?php $csrf->echoInputField();?>
          <button type="submit" name="editar-perfil" class="btn btn-primary btn-block">Atualizar dados</button>
          </div>
          </form>
          </div>
        </div>
       
       <div class="col-md-12 col-lg-12">
          <div class="box box-success collapsed-box">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-arrow-circle-up"></i> Listar Depósitos</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                </button>
              </div>
            </div>
            <div class="box-body">
                <div class="col-xs-12">
                  <div class="box">
                  <div class="box-body table-responsive">
                  <table class="table table-hover">
                  <tbody>
                    <tr>
                      <th>Data/Hora</th>
                      <th>Valor</th>
                      <th>Status</th>
                    </tr>
                    <?php
                      $qryT = "SELECT * FROM transacoes WHERE usuario='".$data['id']."'";
                      $rest = mysqli_query($mysqli,$qryT);
                      if(mysqli_num_rows($rest)>0){
                          while($datasaque = mysqli_fetch_assoc($rest)){
                              if($datasaque['status'] == "processamento"){
                                  $status = '<span class="label label-warning">Pendente</span>';
                              }else{
                                $status = '<span class="label label-success">Pago</span>';
                              }
                    ?>
                    <tr>
                      <td><?=ver_data($datasaque['data_hora']);?></td>
                      <td>R$ <?=Reais2($datasaque['valor']);?></td>
                      <td><?=$status;?></td>
                    </tr>
                    <?php }}else{?>
                    <tr>
                      <td>Sem dados a serem exibidos.</td>
                      <td></td>
                      <td></td>
                    </tr>
                    <?php } ?>
                  </tbody></table>
                  </div>

                  </div>

                  </div>
              
              
            </div>
          </div>
        </div>
       
       <!-- Saques -->
       <div class="col-md-12 col-lg-12">
          <div class="box box-danger collapsed-box">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-arrow-circle-down"></i> Listar Saques</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                </button>
              </div>
            </div>
            <div class="box-body">
                <div class="col-xs-12">
                  <div class="box">
                  <div class="box-body table-responsive">
                  <table class="table table-hover">
                  <tbody>
                    <tr>
                      <th>Data/Hora</th>
                      <th>Valor</th>
                      <th>Status</th>
                    </tr>
                    <?php
                      $qryT = "SELECT * FROM solicitacao_saques WHERE id_user='".$data['id']."'";
                      $rest = mysqli_query($mysqli,$qryT);
                      if(mysqli_num_rows($rest)>0){
                          while($datasaque = mysqli_fetch_assoc($rest)){
                              if($datasaque['status'] == 0){
                                  $status = '<span class="label label-warning">Pendente</span>';
                              }else{
                                $status = '<span class="label label-success">Pago</span>';
                              }
                    ?>
                    <tr>
                      <td><?=ver_data_hoje($datasaque['data_cad'],$datasaque['data_hora']);?></td>
                      <td>R$ <?=Reais2($datasaque['valor']);?></td>
                      <td><?=$status;?></td>
                    </tr>
                    <?php }}else{?>
                    <tr>
                      <td>Sem dados a serem exibidos.</td>
                      <td></td>
                      <td></td>
                    </tr>
                    <?php } ?>
                  </tbody></table>
                  </div>

                  </div>

                  </div>
              
              
              
            </div>
          </div>
        </div>


      <!-- ADD SALDO APIFIVER -->
      <div class="col-md-12 col-lg-12">
          <div class="box box-info collapsed-box">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-plus"></i> Add Saldo Via Api FiverScan</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                </button>
              </div>
            </div>
             <form method="post" role="form">
          <div class="box-body">
            <div class="row">
              <div class="col-lg-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">Valor Atual</label>
                  <input type="text" value="R$ <?=$saldo_user['saldo'] ;?>" class="form-control" placeholder="Ex: 0.00" readonly >
                </div>
              </div>
              <div class="col-lg-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">Valor a ser Adicionado</label>
                  <input type="text" name="valor" class="form-control" placeholder="Ex: 0.00" required >
                </div>
              </div>
              
            </div>
         </div>
          <div class="box-footer">
          <?php $csrf->echoInputField();?>
          <button type="submit" name="add-saldo-api" class="btn btn-primary btn-block">Adicionar novo Saldo</button>
          </div>
          </form>
          </div>
        </div>
      
      
      
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<?php include_once('footer.php');?>



<?php
if (isset($_POST['editar-perfil']) && isset($_POST['_csrf'])) {
	#----------------------------------------------#
    $nome =  PHP_SEGURO($_POST['nome']);
    $senha =  PHP_SEGURO($_POST['senha']);
    $n_senha =  PHP_SEGURO($_POST['n_senha']);
	$CRSF =   PHP_SEGURO($_POST['_csrf']);
	#----------------------------------------------#
	if(empty($CRSF)) {
		 echo alertas_toaster('aviso','Atualize sua página.',3500);
        return true;
	}
    if(empty($senha)) {
      $sql = $mysqli->prepare("UPDATE usuarios SET nome=? WHERE id=?");
      $sql->bind_param("si",$nome,$data['id']);
      if($sql->execute()) {
          echo alertas_toaster('ok','Ok! Conteúdo atualizado com sucesso.',3500);
          echo "<script>  setTimeout('window.location.href=\"".$painel_adm_listar_usuarios."\";', 2000); </script>";
      }else{
          echo alertas_toaster('aviso','Não foi possível atualizar dados.',3500);
          echo "<script>  setTimeout('window.location.href=\"".$painel_adm_listar_usuarios."\";', 2000); </script>";
      }
	}else{
      if($senha != $n_senha){
          echo alertas_toaster('aviso','As Senhas não coincidem.',3500);
          return true;
      }
      $pass =  password_hash($senha, PASSWORD_DEFAULT, array("cost" => 10));
      $sql = $mysqli->prepare("UPDATE usuarios SET nome=?,senha=? WHERE id=?");
      $sql->bind_param("ssi",$nome,$pass,$data['id']);
      if($sql->execute()) {
          echo alertas_toaster('ok','Ok! Conteúdo atualizado com sucesso.',3500);
          echo "<script>  setTimeout('window.location.href=\"".$painel_adm_listar_usuarios."\";', 2000); </script>";
      }else{
          echo alertas_toaster('aviso','Não foi possível atualizar dados.',3500);
          echo "<script>  setTimeout('window.location.href=\"".$painel_adm_listar_usuarios."\";', 2000); </script>";
      }
    }
    #----------------------------------------------#
    $mysqli->close();
}

#ADICIONAR SALDO VIA API
if (isset($_POST['add-saldo-api']) && isset($_POST['_csrf'])) {
    $valor =  PHP_SEGURO(floatval($_POST['valor']));
    $CRSF =   PHP_SEGURO($_POST['_csrf']);
    #----------------------------------------------#
    if(empty($CRSF)) {
        echo alertas_toaster('aviso','Atualize sua página.',3500);
        return true;
    }
    if(empty($valor)) {
        echo alertas_toaster('aviso','Insira o valor no formulário.',3500);
        return true;
    }
    if($valor < 1) {
        echo alertas_toaster('aviso','Insira um valor acima de R$ 1,00.',3500);
        return true;
    }
    if($valor <= $saldoapi_fiverscan){
      $ft = insert_payment_adm($data['id'],$data['email'],$valor);
      if($ft == 1){
        echo alertas_toaster('ok','Saldo atualizado com sucesso.',3500);
        echo "<script>  setTimeout('window.location.href=\"".$url_atual."\";', 2000); </script>";
      }else{
        echo alertas_toaster('aviso','Não foi possível atualizar saldo.',3500);
        return true;
      }
    }else{
       echo alertas_toaster('aviso','O valor execede o saldo na api da FiverScan.',3500);
      return true; 
    }
    $mysqli->close();
  }
?>













