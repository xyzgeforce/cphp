<?php include_once('header.php');
$qry = "SELECT * FROM suitpay WHERE id=1";
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
              <h3 class="box-title">SuitPay</h3>
            </div>

              <div class="box-body">
                <form role="form" method="post">
                  <div class="box-body">
                    <div class="row">
                      <div class="col-lg-12">
                        <div class="form-group">
                          <label for="exampleInputEmail1">URL DE API</label>
                          <input type="text" name="url_api" class="form-control" value="<?=$data['url'];?>" placeholder="Nome de Usuário" required>
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Client Id</label>
                          <input type="text" name="client_id" value="<?=$data['client_id'];?>" class="form-control" placeholder="Dados Cliente Id" required />
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Client Secret</label>
                          <input type="text" name="client_secret" value="<?=$data['client_secret'];?>" class="form-control" placeholder="Dados Cliente Secret" required />
                        </div>
                      </div>
                     </div>
                  </div>
                  <!-- /.box-body -->
                  <p>
                    <?php $csrf->echoInputField(); ?>
                    <button type="submit" name="editar-suitpay" class="btn btn-primary btn-block">Atualizar SuitPay</button>
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
    $url_api =  PHP_SEGURO($_POST['url_api']);
    $client_id =  PHP_SEGURO($_POST['client_id']);
    $client_secret =  PHP_SEGURO($_POST['client_secret']);
	$CRSF =   PHP_SEGURO($_POST['_csrf']);
	#----------------------------------------------#
	if(empty($CRSF)) {
		echo '<div class="alert alert-danger alert-dismissible">
                <h4><i class="icon fa fa-ban"></i> Aviso!</h4>Houve um erro ao obter dados atualize sua página.
              </div>';
	}
	if(empty($client_id) && empty($client_secret)) {
      echo alertas_toaster('aviso','Insira os dados solicitados no formulário.',3500);
      return true;
	}else{
      $sql = $mysqli->prepare("UPDATE suitpay SET url=?,client_id=?,client_secret=? WHERE id=1");
      $sql->bind_param("sss",$url_api,$client_id,$client_secret);
      if($sql->execute()) {
          echo alertas_toaster('ok','Ok! Conteúdo atualizado com sucesso.',3500);
          echo "<script>  setTimeout('window.location.href=\"".$painel_adm_suit_pay."\";', 2000); </script>";
      }else{
          echo alertas_toaster('aviso','Não foi possível atualizar dados.',3500);
          echo "<script>  setTimeout('window.location.href=\"".$painel_adm_suit_pay."\";', 2000); </script>";
      }
	}
    $mysqli->close();
}

?>













