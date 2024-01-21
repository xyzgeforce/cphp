<?php include_once('header.php');
$qry = "SELECT * FROM pagstart WHERE id=1";
$res = mysqli_query($mysqli,$qry);
$data = mysqli_fetch_assoc($res);

?>
    <!-- Main content -->
    <section class="content">
      <!-- Info boxes -->
      <div class="row">
        <div class="col-lg-12">
          <div class="box box-default">
            <div class="box-header with-border">
              <i class="fa fa-cubes"></i>
              <h3 class="box-title">PagStar</h3>
            </div>

              <div class="box-body">
                <form role="form" method="post">
                  <div class="box-body">
                    <div class="row">
                      <div class="col-lg-12">
                        <div class="form-group">
                          <label for="exampleInputEmail1">URL DE API</label>
                          <input type="text" name="url_api" class="form-control" value="<?=$data["url"]?>" placeholder="URL da API" required>
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Email</label>
                          <input type="email" name="email" value="<?=$data["email"]?>" class="form-control" placeholder="Dados Email" required />
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Tenant Id</label>
                          <input type="text" name="tenant_id" value="<?=$data["tenant_id"]?>" class="form-control" placeholder="Dados Tenant Id" required />
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Access Key</label>
                          <input type="text" name="access_key" value="<?=$data["access_key"]?>" class="form-control" placeholder="Dados Access Key" required />
                        </div>
                      </div>
                     </div>
                  </div>
                  <!-- /.box-body -->
                  <p>
                    <?php $csrf->echoInputField(); ?>
                    <button type="submit" name="editar-suitpay" class="btn btn-primary btn-block">Atualizar PagStar</button>
                  </p>
                </form>
              </div>
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
if (isset($_POST['editar-suitpay']) && isset($_POST['_csrf'])) {
	#----------------------------------------------#
    $url_api       =  PHP_SEGURO($_POST['url_api']);
    $access_key    =  PHP_SEGURO($_POST['access_key']);
    $email         =  PHP_SEGURO($_POST['email']);
    $tenant_id     =  PHP_SEGURO($_POST['tenant_id']);
	  $CRSF          =  PHP_SEGURO($_POST['_csrf']);
 
	#----------------------------------------------#
    if(empty($CRSF)) {
      echo '<div class="alert alert-danger alert-dismissible">
        <h4><i class="icon fa fa-ban"></i> Aviso!</h4>Houve um erro ao obter dados atualize sua página.
      </div>';
    }
    if (empty($access_key) && empty($email) && empty($tenant_id)) {
      echo alertas_toaster('aviso', 'Insira os dados solicitados no formulário.', 3500);
      return true;
    } else {
       
        if ($data) {
          // Se existe, faz uma atualização
          $sql = $mysqli->prepare("UPDATE pagstart SET url=?, access_key=?, email=?, tenant_id=? WHERE id=1");
          $sql->bind_param("ssss", $url_api, $access_key, $email, $tenant_id);
        } else {
          // Se não existe, faz uma inserção
          $sql = $mysqli->prepare("INSERT INTO pagstart (url, access_key, email, tenant_id) VALUES (?, ?, ?, ?)");
          $sql->bind_param("ssss", $url_api, $access_key, $email, $tenant_id);
        }

        if ($sql->execute()) {
            echo alertas_toaster('ok', 'Ok! Conteúdo atualizado com sucesso.', 3500);
            echo "<script>  setTimeout('window.location.href=\"" . $painel_adm_pagstar_pay . "\";', 2000); </script>";
        } else {
            echo alertas_toaster('aviso', 'Não foi possível atualizar dados.', 3500);
            echo "<script>  setTimeout('window.location.href=\"" . $painel_adm_pagstar_pay . "\";', 2000); </script>";
        }
        $mysqli->close();
    }
    $mysqli->close();
}

?>













