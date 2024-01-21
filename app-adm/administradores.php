<?php include_once('header.php');?>
    <!-- Main content -->
    <section class="content">
      <!-- Info boxes -->
      <div class="row">
        <div class="col-md-12 col-lg-12">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">+ Adicionar Novo Administrador</h3><br><br>
              <!-- /.box-header -->
                <button class="btn btn-success btn-block" data-toggle="modal" data-target="#modal-default"><i class="fa fa-plus"></i> Add Novo Usuário Administrativo </button>
              <!-- form start -->
            </div>
          </div>
          <!-- /.box -->
        </div>
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Listar Adms</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive">
              <table class="table table-hover">
                <tbody><tr>
                  <th class="text-center">Nome</th>
                  <th class="text-center">Contato</th>
                  <th class="text-center">Nivel</th>
                  <th class="text-center">Status</th>
                  <th class="text-center">Ação</th>
                </tr>
                <?php
                  $qry = "SELECT * FROM admin_users WHERE id ORDER BY id DESC";
                  $res = mysqli_query($mysqli,$qry);
                  if(mysqli_num_rows($res)>0){
                      while($data = mysqli_fetch_assoc($res)){
                        if($data['nivel'] == 1){
                          $niveladm = "<i class='fa fa-diamond'></i> Administrador";
                        }elseif($data['nivel'] == 2){
                            $niveladm = "<i class='fa fa-money'></i> Financeiro";
                        }elseif($data['nivel'] == 3){
                            $niveladm = "<i class='fa fa-comments'></i> Suporte";
                        }else{
                          $niveladm = "-----";
                        }
                        //------------------------------------------//
                        if($data['status'] == 1){
                          $status = "<span class='label label-success'><i class='fa fa-check-circle-o'></i>  Ativo</span>";
                        }else{
                          $status = "<span class='label label-danger'><i class='fa fa-ban'></i> Bloqueado</span>";
                        }
                ?>
                
                <tr>
                  <td class="text-center"><?=$data['nome'];?></td>
                  <td class="text-center"><?=$data['contato'];?></td>
                  <td class="text-center"><?=$niveladm;?></td>
                  <td class="text-center"><?=$status;?></td>
                  <td class="text-center"><button class="btn btn-success btn-block btn-xs" data-toggle="modal" data-target="#modal-edit-<?=$data['id'];?>"><i class="fa fa-edit"></i>Editar</button></td>
                </tr>
                <!-- modal -->
                <div class="modal fade" id="modal-edit-<?=$data['id'];?>" style="display: none;">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h4 class="modal-title">[Editar Dados]</h4>
                      </div>
                      <div class="modal-body">
                          <form role="form" method="post">
                            <div class="box-body">
                              <div class="row">
                                <div class="col-lg-6">
                                  <div class="form-group">
                                    <label for="exampleInputEmail1">Nome</label>
                                    <input type="text" name="nome" class="form-control" value="<?=$data['nome'];?>" placeholder="Nome de Usuário" required>
                                  </div>
                                </div>
                                <div class="col-lg-6">
                                  <div class="form-group">
                                    <label for="exampleInputEmail1">Contato <i class="fa fa-whatsapp"></i></label>
                                    <input type="text" name="telefone1" id="telefone1" class="form-control" value="<?=$data['contato'];?>" placeholder="Contato"maxlength="15" />
                                  </div>
                                </div>
                                <div class="col-lg-6">
                                  <div class="form-group">
                                    <label for="exampleInputEmail1">E-mail</label>
                                    <input type="email" name="email" class="form-control" value="<?=$data['email'];?>" placeholder="E-mail" required>
                                  </div>
                                </div>
                                <div class="col-lg-6">
                                  <div class="form-group">
                                    <label for="exampleInputEmail1">Senha</label>
                                    <input type="password" name="senha" class="form-control" placeholder="****">
                                  </div>
                                </div>
                                <div class="col-lg-6">
                                  <div class="form-group">
                                    <label for="exampleInputEmail1">Status  (<?=$status;?>)</label>
                                    <select class="form-control" name="status">
                                      <option value="<?=$data['status'];?>" selected>-- Selecionar Status --</option>
                                      <option value="1">Ativar</option>
                                      <option value="0">Bloquear</option>
                                      <option value="2">Deletar</option>
                                    </select>
                                  </div>
                                </div>
                                <div class="col-lg-6">
                                  <div class="form-group">
                                    <label for="exampleInputEmail1">Nivel  (<i><?=$niveladm;?></i>)</label>
                                    <select class="form-control" name="nivel">
                                      <option value="<?=$data['nivel'];?>" selected>-- Selecionar Status --</option>
                                      <option value="1">Administrador</option>
                                      <option value="2">Financeiro</option>
                                      <option value="3">Suporte</option>
                                    </select>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                              <?php $csrf->echoInputField(); ?>
                              <input type="hidden" name="id_user" value="<?=intval($data['id']);?>" required />
                              <button type="submit" name="editar-adm" class="btn btn-primary btn-block">Atualizar Dados</button>
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
                
                
                
                
                
                <?php } } ?>
              
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
          <h4 class="modal-title">Default Modal</h4>
        </div>
          <div class="modal-body">
            <form role="form" method="post">
              <div class="box-body">
                <div class="row">
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label for="exampleInputEmail1">Nome</label>
                      <input type="text" name="nome" class="form-control" placeholder="Nome de Usuário" required>
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label for="exampleInputEmail1">Contato <i class="fa fa-whatsapp"></i></label>
                      <input type="text" name="telefone2" id="telefone2" class="form-control" placeholder="Contato"maxlength="15" />
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label for="exampleInputEmail1">E-mail</label>
                      <input type="email" name="email" class="form-control" placeholder="E-mail" required>
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label for="exampleInputEmail1">Senha</label>
                      <input type="password" name="senha" class="form-control" placeholder="****">
                    </div>
                  </div>
                  <div class="col-lg-12">
                    <div class="form-group">
                      <label for="exampleInputEmail1">Nivel </label>
                      <select class="form-control" name="nivel">
                        <option value="" selected>-- Selecionar Status --</option>
                        <option value="1">Administrador</option>
                        <option value="2">Financeiro</option>
                        <option value="3">Suporte</option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <?php $csrf->echoInputField(); ?>
                <button type="submit" name="add-adm" class="btn btn-primary btn-block">Add Administrador</button>
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
if (isset($_POST['editar-adm']) && isset($_POST['_csrf'])) {
	#----------------------------------------------#
    $id_user =  PHP_SEGURO($_POST['id_user']);
    $nome =  PHP_SEGURO($_POST['nome']);
    $telefone =  PHP_SEGURO($_POST['telefone1']);
	$senha =   PHP_SEGURO($_POST['senha']);
	$email =   PHP_SEGURO($_POST['email']);
	$status =   PHP_SEGURO($_POST['status']);
	$nivel =   PHP_SEGURO($_POST['nivel']);
	$CRSF =   PHP_SEGURO($_POST['_csrf']);
	#----------------------------------------------#
	if(empty($CRSF)) {
		echo '<div class="alert alert-danger alert-dismissible">
                <h4><i class="icon fa fa-ban"></i> Aviso!</h4>Houve um erro ao obter dados atualize sua página.
              </div>';
	}
	if(empty($email)) {
		echo '<div class="alert alert-danger alert-dismissible">
                <h4><i class="icon fa fa-ban"></i> Aviso!</h4>Insira um e-mail no formulário.
              </div>';
	}
	if(filter_var($email, FILTER_VALIDATE_EMAIL) AND !empty($email)){}else{
		echo '<div class="alert alert-danger alert-dismissible">
                <h4><i class="icon fa fa-ban"></i> Aviso!</h4>Insira um e-mail válido no formulário.
              </div>';
    }
	if(empty($senha)) {
        if($status == 2){
          //deletar usuário
          $sql = $mysqli->prepare("DELETE FROM  admin_users WHERE id=?");
          $sql->bind_param("i",$id_user);
          if($sql->execute()) {
              echo alertas_toaster('ok','Ok! Conteúdo atualizado com sucesso.',3500);
              echo "<script>  setTimeout('window.location.href=\"".$painel_adm_administradores."\";', 2000); </script>";
          }
        }else{
          $sql = $mysqli->prepare("UPDATE admin_users SET nome=?,email=?,contato=?,nivel=?,status=? WHERE id=?");
          $sql->bind_param("sssssi",$nome,$email,$telefone,$nivel,$status,$id_user);
          if($sql->execute()) {
              echo alertas_toaster('ok','Ok! Conteúdo atualizado com sucesso.',3500);
              echo "<script>  setTimeout('window.location.href=\"".$painel_adm_administradores."\";', 2000); </script>";
          }else{
              echo alertas_toaster('aviso','Não foi possível atualizar dados.',3500);
              echo "<script>  setTimeout('window.location.href=\"".$painel_adm_administradores."\";', 2000); </script>";
          }
        }
	}else{
      if($status == 2){
        //deletar usuário
        $sql = $mysqli->prepare("DELETE FROM  admin_users WHERE id=?");
        $sql->bind_param("i",$id_user);
        if($sql->execute()) {
            echo alertas_toaster('ok','Ok! Conteúdo atualizado com sucesso.',3500);
            echo "<script>  setTimeout('window.location.href=\"".$painel_adm_administradores."\";', 2000); </script>";
        }
      }else{
        $pass =  password_hash($senha, PASSWORD_DEFAULT, array("cost" => 10));
        $sql = $mysqli->prepare("UPDATE admin_users SET nome=?,email=?,contato=?,nivel=?,status=?,senha=? WHERE id=?");
        $sql->bind_param("ssssssi",$nome,$email,$telefone,$nivel,$status,$pass,$id_user);
        if($sql->execute()) {
            echo alertas_toaster('ok','Ok! Conteúdo atualizado com sucesso.',3500);
            echo "<script>  setTimeout('window.location.href=\"".$painel_adm_administradores."\";', 2000); </script>";
        }else{
            echo alertas_toaster('aviso','Não foi possível atualizar dados.',3500);
            echo "<script>  setTimeout('window.location.href=\"".$painel_adm_administradores."\";', 2000); </script>";
        }
      }
	}
  $mysqli->close();
}
if (isset($_POST['add-adm']) && isset($_POST['_csrf'])) {
	#----------------------------------------------#
    $nome =  PHP_SEGURO($_POST['nome']);
    $telefone =  PHP_SEGURO($_POST['telefone2']);
	$senha =   PHP_SEGURO($_POST['senha']);
	$email =   PHP_SEGURO($_POST['email']);
	$nivel =   PHP_SEGURO($_POST['nivel']);
	$CRSF =   PHP_SEGURO($_POST['_csrf']);
	#----------------------------------------------#
	if(empty($CRSF)) {
      echo alertas_toaster('aviso','Houve um erro ao obter dados atualize sua página.',3500);
      return true;
	}
	if(empty($email)) {
      echo alertas_toaster('aviso','Insira um e-mail no formulário.',3500);
      return true;
	}
	if(filter_var($email, FILTER_VALIDATE_EMAIL) AND !empty($email)){}else{
      echo alertas_toaster('aviso','Insira um e-mail válido no formulário.',3500);
      return true;
    }
	if(empty($senha)) {
      echo alertas_toaster('aviso','Insira uma senha no formulário.',3500);
      return true;
	}
    if(strlen($senha) < 5){
      echo alertas_toaster('aviso','Insira uma senha mais forte no formulário.',3500);
      return true;  
    }
	if(empty($nivel)) {
      echo alertas_toaster('aviso','Selecione o nivel de acesso.',3500);
      return true;
	}
    #----------------------------------------------##----------------------------------------------#
	#----------------------------------------------##----------------------------------------------#
	#----------------------------------------------##----------------------------------------------#
    $qry = "SELECT * FROM admin_users WHERE email='".$email."'";
    $res = mysqli_query($mysqli,$qry);
    if(mysqli_num_rows($res)>0){
      echo alertas_toaster('aviso','Este e-mail já consta no sistema tente outro.',3500);
      return true;
    }else{
      $pass =  password_hash($senha, PASSWORD_DEFAULT, array("cost" => 10));
      $sql1 = $mysqli->prepare("INSERT INTO admin_users (nome,email,contato,senha,nivel,status) VALUES (?,?,?,?,?,1)");
      $sql1->bind_param("sssss",$nome,$email,$telefone,$pass,$nivel);
      if($sql1->execute()){
        echo alertas_toaster('ok','Ok! Usuário inserido com sucesso.',3500);
        echo "<script>  setTimeout('window.location.href=\"".$painel_adm_administradores."\";', 2000); </script>";
      }else{
        echo alertas_toaster('aviso','Não foi possível inserir dados.',3500);
        echo "<script>  setTimeout('window.location.href=\"".$painel_adm_administradores."\";', 2000); </script>";
      }
    }
    #----------------------------------------------##----------------------------------------------#
    #----------------------------------------------##----------------------------------------------#
    #----------------------------------------------##----------------------------------------------#
    //liberar variavel
    $mysqli->close();
}

?>













