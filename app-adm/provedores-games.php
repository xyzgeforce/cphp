<?php include_once('header.php');?>
    <!-- Main content -->
    <section class="content">
      <!-- Info boxes -->
      <div class="row">
         <div class="col-md-12 col-lg-12">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-cogs"></i> API GAMES CASSINO</h3><br><br>
              <form role="form" method="post">
                <div class="box-body">
                  <div class="row">
                    <div class="col-lg-12">
                      <div class="form-group">
                        <label for="exampleInputEmail1">Url  Api</label>
                        <input type="text" name="url" class="form-control" value="<?=$data_fiverscanpanel['url'];?>" placeholder="Agent Api" required>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label for="exampleInputEmail1">Agent Api</label>
                        <input type="text" name="agent_code" class="form-control" value="<?=$data_fiverscanpanel['agent_code'];?>" placeholder="Agent Api" required>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label for="exampleInputEmail1">Token Api</label>
                        <input type="text" name="agent_token" class="form-control" value="<?=$data_fiverscanpanel['agent_token'];?>" placeholder="Token ApiFiver" required  />
                      </div>
                    </div>
                  </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                  <?php $csrf->echoInputField(); ?>
                  <button type="submit" name="editar-api" class="btn btn-success btn-block">Atualizar Api FiverScan</button>
                </div>
              </form>
        
        
             
             
             
            </div>
          </div>
          <!-- /.box -->
        </div>
      
        <div class="col-md-12 col-lg-12">
          <div id="response"></div>
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-compress"></i> Provedores Games</h3><br><br>
              <div id="loading-message" class='alert alert-warning' role='alert' style="display: none;"> Aguarde, carregando dados...</div>
              <!-- /.box-header -->
                <form  id="form-att-games">
                  <?php $csrf->echoInputField(); ?>
                  <button type="submit" class="btn btn-success btn-block"><i class="fa fa-plus"></i> Atualizar Provedores</button>
                </form>
              <!-- form start -->
            </div>
          </div>
          <!-- /.box -->
        </div>
      
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title"><i class="fa fa-gamepad"></i> Listar Provedores</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive">
              <table class="table table-hover">
                <tbody><tr>
                  <th class="text-center">Code Provedor</th>
                  <th class="text-center">Nome Provedor</th>
                  <th class="text-center">Tipo Provedor</th>
                  <th class="text-center">Qtd de Games do Provedor</th>
                  <th class="text-center">Status Provedor</th>
                  <th class="text-center">Ação</th>
                </tr>
                <?php
                  $qry = "SELECT * FROM provedores WHERE id ORDER BY id DESC";
                  $res = mysqli_query($mysqli,$qry);
                  if(mysqli_num_rows($res)>0){
                      while($data = mysqli_fetch_assoc($res)){
                          if($data['status'] == 1){
                            $status_view = '<span class="label label-success"><i class="fa fa-check-circle-o"></i> Ativo</span>';
                          }else{
                            $status_view = '<span class="label label-warning"><i class="fa fa-times-circle"></i> Bloqueado</span>';  
                          }
                ?>
                <tr>
                  <td class="text-center"><strong><?=$data['code'];?></strong></td>
                  <td class="text-center"><?=$data['name'];?></td>
                  <td class="text-center"><strong><?=strtoupper($data['type']);?></strong></td>
                  <td class="text-center"><?=qtd_provedor_games($data['code']);?></td>
                  <td class="text-center"><?=$status_view;?></td>
                  <td class="text-center"><button class="btn btn-success btn-block btn-xs" data-toggle="modal" data-target="#modal-edit-<?=$data['id'];?>"><i class="fa fa-edit"></i>Atualizar Games</button></td>
                </tr>
                <!-- modal -->
                <div class="modal fade" id="modal-edit-<?=$data['id'];?>" style="display: none;">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h4 class="modal-title">[Atualizar Games]</h4>
                      </div>
                      <div class="modal-body">
                            <div id="loading-message<?=$data['id'];?>" class='alert alert-warning' role='alert' style="display: none;"> Aguarde, carregando dados...</div>
                            <form id="form-att-slots-games-<?=$data['id'];?>">
                            <div id="response<?=$data['id'];?>"></div>
                              <!-- /.box-body -->
                              <div class="box-footer">
                                <?php $csrf->echoInputField(); ?>
                                <input type="hidden" name="code" value="<?=$data['code'];?>" required />
                                <button type="submit" class="btn btn-success btn-block">Atualizar Games</button>
                              </div>
                            </form>
        
                      
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                      </div>
                    </div>
                    <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
                </div>
                
               <script>
                  $(document).ready(function() {
                    $('#form-att-slots-games-<?=$data['id'];?>').submit(function(event) {
                      event.preventDefault();
                      // Exibe a mensagem de "Aguarde"
                      $('#loading-message<?=$data['id'];?>').html('<i class="fa fa-refresh fa-spin fa-fw"></i>Aguarde, carregando dados...').show();
                      let formData = $(this).serialize();
                      $.ajax({
                        url: 'ajax/form-att-games-slots.php',
                        type: 'POST',
                        data: formData,
                        success: function(response) {
                          // Oculta a mensagem de "Aguarde"
                          $('#loading-message<?=$data['id'];?>').hide();
                          $('#response<?=$data['id'];?>').html(response).show(); // Exibe a div de resposta
                          setTimeout(function() {
                            $('#response<?=$data['id'];?>').hide(); // Oculta a div após 5 segundos
                          }, 9000);
                        },
                        error: function() {
                          // Em caso de erro, também oculta a mensagem de "Aguarde"
                          $('#loading-message<?=$data['id'];?>').hide();
                        }
                      });
                    });
                  });
                </script>
                
                
                <?php } }else{ ?>
                <tr>
                  <td class="text-center"><i class="fa fa-spinner fa-pulse fa-fw"></i> Sem dados no momento.</td>
                  <td class="text-center"></td>
                  <td class="text-center"></td>
                  <td class="text-center"></td>
                </tr>
                <?php } ?>
              
              </tbody></table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      
      
      
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
<?php include_once('footer.php');?>
<?php
if (isset($_POST['editar-api']) && isset($_POST['_csrf'])) {
	#----------------------------------------------#
    $url =  PHP_SEGURO($_POST['url']);
    $agent_code =  PHP_SEGURO($_POST['agent_code']);
    $agent_token =  PHP_SEGURO($_POST['agent_token']);
	$CRSF =   PHP_SEGURO($_POST['_csrf']);
	#----------------------------------------------#
	if(empty($CRSF)) {
		echo '<div class="alert alert-danger alert-dismissible">
                <h4><i class="icon fa fa-ban"></i> Aviso!</h4>Houve um erro ao obter dados atualize sua página.
              </div>';
	}
	if(empty($agent_code) && empty($agent_token) && empty($url)) {
		echo alertas_toaster('aviso','Insira os dados no formulário.',3500);
        return true;
	}
	$sql = $mysqli->prepare("UPDATE fiverscan SET url=?,agent_code=?,agent_token=? WHERE id=?");
    $sql->bind_param("sssi",$url,$agent_code,$agent_token,$data_fiverscanpanel['id']);
    if($sql->execute()) {
        echo alertas_toaster('ok','Ok! Conteúdo atualizado com sucesso.',3500);
        echo "<script>  setTimeout('window.location.href=\"".$painel_adm_provedores_games."\";', 2000); </script>";
    }else{
        echo alertas_toaster('aviso','Não foi possível atualizar dados.',3500);
        echo "<script>  setTimeout('window.location.href=\"".$painel_adm_provedores_games."\";', 2000); </script>";
    }
    $mysqli->close();
}
?>

<script>
  $(document).ready(function() {
    $('#form-att-games').submit(function(event) {
      event.preventDefault();
      // Exibe a mensagem de "Aguarde"
      $('#loading-message').html('<i class="fa fa-refresh fa-spin fa-fw"></i>Aguarde, carregando dados...').show();
      let formData = $(this).serialize();
      $.ajax({
        url: 'ajax/form-att-providers-api.php',
        type: 'POST',
        data: formData,
        success: function(response) {
          // Oculta a mensagem de "Aguarde"
          $('#loading-message').hide();
          $('#response').html(response).show(); // Exibe a div de resposta
          setTimeout(function() {
            $('#response').hide(); // Oculta a div após 5 segundos
          }, 9000);
        },
        error: function() {
          // Em caso de erro, também oculta a mensagem de "Aguarde"
          $('#loading-message').hide();
        }
      });
    });
  });
</script>











