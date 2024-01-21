<?php include_once('header.php');
$qry = "SELECT * FROM config WHERE id=1";
$res = mysqli_query($mysqli,$qry);
$data = mysqli_fetch_assoc($res);
?>
    <!-- Main content -->
    <section class="content">
      <!-- Info boxes -->
      <div class="row">
        <div class="col-md-12 col-lg-12">
          <div class="box box-primary">
          <div class="box-header with-border">
          <h3 class="box-title">Configuração Financeira</h3>
          </div>
          <form method="post" role="form">
          <div class="box-body">
            <div class="row">
              <div class="col-md-6 col-lg-4">
                <div class="form-group">
                  <label for="exampleInputEmail1">Minimo Saque</label>
                  <input type="number" name="minsaque" value="<?=$data['minsaque'];?>" class="form-control" placeholder="10">
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="form-group">
                  <label for="exampleInputEmail1">Minimo Depósito</label>
                  <input type="number" name="mindep" value="<?=$data['mindep'];?>" class="form-control" placeholder="50">
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="form-group">
                  <label for="exampleInputEmail1">Minimo Play (Jogar)</label>
                  <input type="number" name="minplay" value="<?=$data['minplay'];?>" class="form-control" placeholder="10">
                </div>
              </div>
              
            </div>
         </div>

          <div class="box-footer">
          <?php $csrf->echoInputField();?>
          <button type="submit" name="editar-minplay" class="btn btn-primary btn-block">Atualizar dados</button>
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
if (isset($_POST['editar-minplay']) && isset($_POST['_csrf'])) {
	#----------------------------------------------#
    $minsaque =  PHP_SEGURO($_POST['minsaque']);
    $mindep =  PHP_SEGURO($_POST['mindep']);
    $minplay =  PHP_SEGURO($_POST['minplay']);
	$CRSF =   PHP_SEGURO($_POST['_csrf']);
	#----------------------------------------------#
	if(empty($CRSF)) {
		echo '<div class="alert alert-danger alert-dismissible">
                <h4><i class="icon fa fa-ban"></i> Aviso!</h4>Houve um erro ao obter dados atualize sua página.
              </div>';
	}
    if(empty($minsaque) && empty($mindep) && empty($minplay)) {
      echo alertas_toaster('aviso','Insira os valores nos fomulários.',3500);
      return true;
	}
    #----------------------------------------------#
    $sql = $mysqli->prepare("UPDATE config SET minplay=?,minsaque=?,mindep=? WHERE id=1");
    $sql->bind_param("sss",$minplay,$minsaque,$mindep);
    if($sql->execute()) {
        echo alertas_toaster('ok','Ok! Conteúdo atualizado com sucesso.',3500);
        echo "<script>  setTimeout('window.location.href=\"".$painel_adm_financeiro_sistema."\";', 2000); </script>";
    }else{
        echo alertas_toaster('aviso','Não foi possível atualizar dados.',3500);
        echo "<script>  setTimeout('window.location.href=\"".$painel_adm_financeiro_sistema."\";', 2000); </script>";
    }
    $mysqli->close();
}


?>













