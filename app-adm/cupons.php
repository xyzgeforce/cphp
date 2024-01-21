<?php include_once('header.php');?>
    <!-- Main content -->
    <section class="content">
      <!-- Info boxes -->
      <div class="row">
        <div class="col-md-12 col-lg-12">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-ticket"></i> Adicionar Novo Cupom</h3><br><br>
              <!-- /.box-header -->
                <button class="btn btn-success btn-block" data-toggle="modal" data-target="#modal-default"><i class="fa fa-plus"></i> Add Novo Cupom </button>
              <!-- form start -->
            </div>
          </div>
          <!-- /.box -->
        </div>
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title"><i class="fa fa-ticket"></i> Listar Cupons</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive">
              <table class="table table-hover">
                <tbody><tr>
                  <th class="text-center">Nome Cupom</th>
                  <th class="text-center">Valor Cupom</th>
                  <th class="text-center">Tipo de Cupom</th>
                  <th class="text-center">Qtd</th>
                  <th class="text-center">Status</th>
                  <th class="text-center">Ação</th>
                </tr>
                <?php
                  $qry = "SELECT * FROM cupom WHERE id ORDER BY id DESC";
                  $res = mysqli_query($mysqli,$qry);
                  if(mysqli_num_rows($res)>0){
                      while($data = mysqli_fetch_assoc($res)){
                        //------------------------------------------//
                        if($data['status'] == 1){
                          $status = "<span class='label label-success'><i class='fa fa-check-circle-o'></i>  Ativo</span>";
                        }else{
                          $status = "<span class='label label-danger'><i class='fa fa-ban'></i> Bloqueado</span>";
                        }
                        
                        if($data['tipo'] == 1){
                          $valortipo = '<i>'.$data['valor']."% no Depósito</i>";
                          $tipo = 'RECARGA';
                        }else{
                          $valortipo = "<i>R$ ".$data['valor'].' no Saldo</i>';
                          $tipo = 'SALDO';
                        }
                        
                        
                        
                ?>
                
                <tr>
                  <td class="text-center"><?=$data['nome'];?></td>
                  <td class="text-center"><strong><?=$valortipo;?></strong></td>
                  <td class="text-center"><?=$tipo;?></td>
                  <td class="text-center"><?=$data['qtd'].'/'.$data['qtd_insert'];?></td>
                  <td class="text-center"><?=$status;?></td>
                  <td class="text-center"><button class="btn btn-success btn-block btn-xs" data-toggle="modal" data-target="#modal-edit-<?=$data['id'];?>"><i class="fa fa-edit"></i>Editar</button></td>
                </tr>
                <!-- modal -->
                <div class="modal fade" id="modal-edit-<?=$data['id'];?>" style="display: none;">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h4 class="modal-title">[Editar Cupom]</h4>
                      </div>
                      <div class="modal-body">
                            <form role="form" method="post">
                              <div class="box-body">
                                <div class="row">
                                  <div class="col-lg-6">
                                    <div class="form-group">
                                      <label for="exampleInputEmail1">Nome do Cupom</label>
                                      <input type="text" name="nome" class="form-control" value="<?=$data['nome'];?>" placeholder="Nome de Usuário" required>
                                    </div>
                                  </div>
                                  <div class="col-lg-6">
                                    <div class="form-group">
                                      <label for="exampleInputEmail1">Tipo de Cupom (<i><?=$tipo;?></i>)</label>
                                      <select class="form-control" name="tipo">
                                        <option value="<?=$data['tipo'];?>" selected>-- Selecionar Tipo Cupom --</option>
                                        <option value="1">Recarga</option>
                                        <option value="2">Saldo</option>
                                      </select>
                                    </div>
                                  </div>
                                 
                                  <div class="col-lg-6">
                                    <div class="form-group">
                                      <label for="exampleInputEmail1">Quantidade de Cupons</label>
                                      <input type="number" name="qtd" class="form-control" value="<?=$data['qtd_insert'];?>" placeholder="1" maxlength="999" />
                                    </div>
                                  </div>
                                  <div class="col-lg-6">
                                    <div class="form-group">
                                      <label for="exampleInputEmail1">Status de Cupom (<i><?=$status;?></i>)</label>
                                      <select class="form-control" name="status">
                                        <option value="<?=$data['status'];?>" selected>-- Selecionar Status Cupom --</option>
                                        <option value="1">Ativar</option>
                                        <option value="0">Bloquear</option>
                                        <option value="2">Deletar</option>
                                      </select>
                                    </div>
                                  </div>
                                  <div class="col-lg-12">
                                    <div class="box box-default">
                                      <div class="box-header with-border">
                                        <i class="fa fa-warning"></i>
                                        <h3 class="box-title">Aviso</h3>
                                      </div>
                                      <div class="box-body">
                                        <div class="alert alert-default alert-dismissible">
                                          <hr></hr>
                                          Ao selecionar os tipos de Cupons:<br>
                                          Cupons tipo <strong>SALDO</strong>: O valor inserido é inteiro. <br>Ex: 1 será inserido R$ 1,00 de saldo ao ser utilizado este cupom.<br>
                                          <hr></hr>
                                          Cupons tipo <strong>RECARGA</strong>: O valor inserido é inteiro porém e contabilizado como %(Porcentagem) Ou seja em uma recarga de R$ 20,00 e você inseriu 10.<br>Ex: 10  será adicionado 10% no valor da recarga.<br>
                                          <hr></hr>
                                        </div>
                                      </div>

                                    </div>
                                  </div>
                                  
                                  <div class="col-lg-12">
                                    <div class="form-group">
                                      <label for="exampleInputEmail1">Valor de Cupons  (<?=$valortipo;?>)</label>
                                      <input type="number" name="valor_cupom" value="<?=$data['valor'];?>" class="form-control" placeholder="10" maxlength="999" />
                                    </div>
                                  </div>
                                
                                
                                
                                </div>
                              </div>
                              <!-- /.box-body -->
                              <div class="box-footer">
                                <?php $csrf->echoInputField(); ?>
                                <input type="hidden" name="id_cupom" value="<?=intval($data['id']);?>" required />
                                <button type="submit" name="editar-cupom" class="btn btn-primary btn-block">Atualizar Cupom</button>
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
          <h4 class="modal-title">[<i class="fa fa-ticket"></i> Novo Cupom]</h4>
        </div>
          <div class="modal-body">
            <form role="form" method="post">
              <div class="box-body">
                <div class="row">
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label for="exampleInputEmail1">Nome do Cupom</label>
                      <input type="text" name="nome" class="form-control" placeholder="Nome de Usuário" required>
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label for="exampleInputEmail1">Tipo de Cupom </label>
                      <select class="form-control" name="tipo">
                        <option value="" selected>-- Selecionar Cupom --</option>
                        <option value="1">Recarga</option>
                        <option value="2">Saldo</option>
                      </select>
                    </div>
                  </div>
                 
                  <div class="col-lg-12">
                    <div class="form-group">
                      <label for="exampleInputEmail1">Quantidade de Cupons</label>
                      <input type="number" name="qtd" class="form-control" placeholder="1" maxlength="15" />
                    </div>
                  </div>
                  <div class="col-lg-12">
                    <div class="box box-default">
                      <div class="box-header with-border">
                        <i class="fa fa-warning"></i>
                        <h3 class="box-title">Aviso</h3>
                      </div>

                      <div class="box-body">
                        <div class="alert alert-default alert-dismissible">
                          Ao selecionar os tipos de Cupons:<br>
                          Cupons tipo <strong>SALDO</strong>: O valor inserido é inteiro. <br>Ex: 1 será inserido R$ 1,00 de saldo ao ser utilizado este cupom.<br>
                          <hr></hr>
                          Cupons tipo <strong>RECARGA</strong>: O valor inserido é inteiro porém e contabilizado como %(Porcentagem) Ou seja em uma recarga de R$ 20,00 e você inseriu 10.<br>Ex: 10  será adicionado 10% no valor da recarga.<br>
                          
                        </div>
                      </div>

                    </div>
                  </div>
                  
                  <div class="col-lg-12">
                    <div class="form-group">
                      <label for="exampleInputEmail1">Valor de Cupons</label>
                      <input type="number" name="valor_cupom" class="form-control" placeholder="10" maxlength="999" />
                    </div>
                  </div>
                
                
                
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <?php $csrf->echoInputField(); ?>
                <button type="submit" name="add-cupom" class="btn btn-primary btn-block">Add Novo Cupom</button>
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
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- jQuery Masked Input -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>

<script>
    $(document).ready(function () {
        // Aplicar a máscara ao campo de telefone
        $('#telefone1').mask('(99) 99999-9999');
        $('#telefone2').mask('(99) 99999-9999');
    });
</script>





<?php
if (isset($_POST['editar-cupom']) && isset($_POST['_csrf'])) {
	#----------------------------------------------#
    $id_cupom =  PHP_SEGURO($_POST['id_cupom']);
    $nome =  PHP_SEGURO($_POST['nome']);
    $tipo =  PHP_SEGURO($_POST['tipo']);
    $qtd =  PHP_SEGURO($_POST['qtd']);
    $valor_cupom =  PHP_SEGURO($_POST['valor_cupom']);
    $status =  PHP_SEGURO($_POST['status']);
	$CRSF =   PHP_SEGURO($_POST['_csrf']);
	#----------------------------------------------#
	if(empty($CRSF)) {
		echo '<div class="alert alert-danger alert-dismissible">
                <h4><i class="icon fa fa-ban"></i> Aviso!</h4>Houve um erro ao obter dados atualize sua página.
              </div>';
	}
    if(empty($nome)) {
      echo alertas_toaster('aviso','Insira o nome de cupom.',3500);
      return true;
	}
    if(strlen($qtd) < 1){
      echo alertas_toaster('aviso','Insira uma quantidade de cupom no formulario.',3500);
      return true;  
    }
    if(strlen($valor_cupom) < 1){
      echo alertas_toaster('aviso','Insira um valor cupom no formulario.',3500);
      return true;  
    }
    if(empty($tipo)) {
      echo alertas_toaster('aviso','Selecione o tipo de cupom.',3500);
      return true;
	}
    #----------------------------------------------#
    if($status == 2){
      //deletar usuário
      $sql = $mysqli->prepare("DELETE FROM  cupom WHERE id=?");
      $sql->bind_param("i",$id_cupom);
      if($sql->execute()) {
          echo alertas_toaster('ok','Ok! Conteúdo deletado com sucesso.',3500);
          echo "<script>  setTimeout('window.location.href=\"".$painel_adm_cupons."\";', 2000); </script>";
      }
    }else{
      $sql = $mysqli->prepare("UPDATE cupom SET nome=?,tipo=?,valor=?,qtd_insert=?,status=? WHERE id=?");
      $sql->bind_param("sssssi",$nome,$tipo,$valor_cupom,$qtd,$status,$id_cupom);
      if($sql->execute()) {
          echo alertas_toaster('ok','Ok! Conteúdo atualizado com sucesso.',3500);
          echo "<script>  setTimeout('window.location.href=\"".$painel_adm_cupons."\";', 2000); </script>";
      }else{
          echo alertas_toaster('aviso','Não foi possível atualizar dados.',3500);
          echo "<script>  setTimeout('window.location.href=\"".$painel_adm_cupons."\";', 2000); </script>";
      }
      
    }
	
    
    
    $mysqli->close();
}
if (isset($_POST['add-cupom']) && isset($_POST['_csrf'])) {
	#----------------------------------------------##----------------------------------------------#
    $nome =  PHP_SEGURO($_POST['nome']);
    $tipo =  PHP_SEGURO($_POST['tipo']);
    $qtd =  PHP_SEGURO($_POST['qtd']);
    $valor_cupom =  PHP_SEGURO($_POST['valor_cupom']);
	$CRSF =   PHP_SEGURO($_POST['_csrf']);
	#----------------------------------------------##----------------------------------------------#
	if(empty($CRSF)) {
      echo alertas_toaster('aviso','Houve um erro ao obter dados atualize sua página.',3500);
      return true;
	}
	if(strlen($qtd) < 1){
      echo alertas_toaster('aviso','Insira uma quantidade de cupom no formulario.',3500);
      return true;  
    }
    if(strlen($valor_cupom) < 1){
      echo alertas_toaster('aviso','Insira um valor cupom no formulario.',3500);
      return true;  
    }
    if(empty($tipo)) {
      echo alertas_toaster('aviso','Selecione o tipo de cupom.',3500);
      return true;
	}
    if(empty($nome)) {
      echo alertas_toaster('aviso','Insira o nome de cupom.',3500);
      return true;
	}
	#----------------------------------------------##----------------------------------------------#
    $qry = "SELECT * FROM cupom WHERE nome='".$nome."'";
    $res = mysqli_query($mysqli,$qry);
    if(mysqli_num_rows($res)>0){
      echo alertas_toaster('aviso','Este nome de cupom já consta no sistema tente outro.',3500);
      return true;
    }else{
      $sql1 = $mysqli->prepare("INSERT INTO cupom (nome,tipo,valor,qtd_insert) VALUES (?,?,?,?)");
      $sql1->bind_param("ssss",$nome,$tipo,$valor_cupom,$qtd);
      if($sql1->execute()){
        echo alertas_toaster('ok','Ok! Cupom inserido com sucesso.',3500);
        echo "<script>  setTimeout('window.location.href=\"".$painel_adm_cupons."\";', 2000); </script>";
      }else{
        echo alertas_toaster('aviso','Não foi possível inserir dados.',3500);
        echo "<script>  setTimeout('window.location.href=\"".$painel_adm_cupons."\";', 2000); </script>";
      }
    }
    #----------------------------------------------##----------------------------------------------#
    //liberar variavel
    $mysqli->close();
}

?>













