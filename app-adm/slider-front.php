<?php include_once('header.php');
$qry = "SELECT * FROM afiliados_config WHERE id=1";
$res = mysqli_query($mysqli,$qry);
$data = mysqli_fetch_assoc($res);
?>

    
    
    <!-- Main content -->
    <section class="content">
      <!-- Info boxes -->
      <div class="row">
        <div id="response"></div>
        
        <div class="col-md-12 col-lg-12">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-object-ungroup"></i> Adicionar Novo Slider</h3><br><br>
              <!-- /.box-header -->
                <button class="btn btn-success btn-block" data-toggle="modal" data-target="#modal-default"><i class="fa fa-plus"></i> Add Novo Slider </button>
              <!-- form start -->
            </div>
          </div>
          <!-- /.box -->
        </div>
      
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title"><i class="fa fa-object-ungroup"></i> Listar Slider</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive">
              <table class="table table-hover">
                <tbody><tr>
                  <th class="text-center">Imagem Slider</th>
                  <th class="text-center">Nome Slider</th>
                  <th class="text-center">Status Slider</th>
                  <th class="text-center">Ação</th>
                </tr>
                <?php
                  $qry = "SELECT * FROM banner WHERE id ORDER BY id DESC";
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
                  <td class="text-center"><img src="<?=$docs_uploads.$data['img'];?>" alt="Slider" class="img-rounded" width="150" height="75"></td>
                  <td class="text-center"><br/><strong><?=$data['titulo'];?></strong></td>
                  <td class="text-center"><br/><?=$status_view;?></td>
                  <td class="text-center"><br/><button class="btn btn-success btn-block btn-xs" data-toggle="modal" data-target="#modal-edit-<?=$data['id'];?>"><i class="fa fa-edit"></i>Editar</button></td>
                </tr>
                <!-- modal -->
                <div class="modal fade" id="modal-edit-<?=$data['id'];?>" style="display: none;">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h4 class="modal-title">[Editar Slider]</h4>
                      </div>
                      <div class="modal-body">
                            <form id="form-slider-editar" enctype="multipart/form-data">
                              <div class="box-body">
                                <div class="row">
                                  <div class="col-lg-12">
                                    <div class="form-group">
                                      <label for="exampleInputEmail1">Nome do Slider</label>
                                      <input type="text" name="nome" class="form-control" value="<?=$data['titulo'];?>" placeholder="Nome de Slider" required>
                                    </div>
                                  </div>
                                  <div class="col-lg-12 text-center">
                                    <div class="ms-form-group">
                                      <img src="<?=$docs_uploads.$data['img'];?>" alt="Slider" class="img-rounded" width="250" height="150">
                                    </div>
                                  </div>
                                  <div class="col-md-12 col-lg-12">
                                      <div class="ms-form-group">
                                        <label>Imagem do Slider</label>
                                        <input type="file" class="form-control" name="img" id="img">
                                      </div>
                                  </div>
                                  <div class="col-lg-12"><br />
                                    <div class="form-group">
                                      <label for="exampleInputEmail1">Status de Slider</label>
                                      <select class="form-control" name="status">
                                        <option value="<?=$data['status'];?>" selected>-- Selecionar Status Slider --</option>
                                        <option value="1">Ativar</option>
                                        <option value="0">Bloquear</option>
                                        <option value="2">Deletar</option>
                                      </select>
                                    </div>
                                  </div>
                                
                                
                                </div>
                              </div>
                              <!-- /.box-body -->
                              <div class="box-footer">
                                <?php $csrf->echoInputField(); ?>
                                <input type="hidden" name="id_slider" value="<?=intval($data['id']);?>" required />
                                <input type="hidden" name="format_img" value="<?=$data['img'];?>" required />
                                <button type="submit" name="editar-slider" class="btn btn-success btn-block">Atualizar Slider</button>
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
                
                
                
                
                
                <?php } }else{ ?>
                <tr>
                  <td class="text-center"><i class="fa fa-spinner fa-pulse fa-fw"></i> Sem dados no momento.</td>
                  <td class="text-center"></td>
                  <td class="text-center"></td>
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
  
  
  <!-- modal -->
  <div class="modal fade" id="modal-default" style="display: none;">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span></button>
          <h4 class="modal-title">[<i class="fa fa-object-ungroup"></i> Novo Slider]</h4>
        </div>
          <div class="modal-body">
            <form id="form-slider-add" enctype="multipart/form-data">
              <div class="box-body">
                <div class="row">
                  <div class="col-md-12 col-lg-12">
                    <div class="form-group">
                      <label for="exampleInputEmail1">Nome do Slider</label>
                      <input type="text" name="nome" class="form-control" placeholder="Nome de Slider" required>
                    </div>
                  </div>
                  <div class="col-md-12 col-lg-12">
                      <div class="ms-form-group">
                        <label>Imagem do Slider</label>
                        <input type="file" class="form-control" name="img" id="img">
                      </div>
                  </div>
                  
                
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <?php $csrf->echoInputField(); ?>
                <button type="submit" class="btn btn-success btn-block">Add Novo Slider</button>
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
  
  

<?php include_once('footer.php');?>
  <script>
    $(document).ready(function() {
      $('#form-slider-add').submit(function(event) {
          event.preventDefault();
          let formData = new FormData(this); // Crie um novo objeto FormData com o formulário
          let fileInput = $('#img')[0]; // Seletor para o campo de entrada de arquivo

          if (fileInput.files.length > 0) {
              formData.append("img", fileInput.files[0]); // Adicione o arquivo selecionado ao FormData
          }
          var url = "<?=$painel_adm.'ajax/form-slider.php';?>";
          $.ajax({
              url: url,
              type: 'POST',
              data: formData,
              processData: false, // Não processar dados
              contentType: false, // Não definir o tipo de conteúdo
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
  <script>
    $(document).ready(function() {
      $('#form-slider-editar').submit(function(event) {
          event.preventDefault();
          let formData = new FormData(this); // Crie um novo objeto FormData com o formulário
          let fileInput = $('#img')[0]; // Seletor para o campo de entrada de arquivo

          if (fileInput.files.length > 0) {
              formData.append("img", fileInput.files[0]); // Adicione o arquivo selecionado ao FormData
          }
          var url = "<?=$painel_adm.'ajax/form-editar-slider.php';?>";
          $.ajax({
              url: url,
              type: 'POST',
              data: formData,
              processData: false, // Não processar dados
              contentType: false, // Não definir o tipo de conteúdo
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











