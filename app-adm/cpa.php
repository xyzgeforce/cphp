<?php include_once('header.php');
$qry = "SELECT * FROM afiliados_config WHERE id=1";
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
          <h3 class="box-title">Configuração de CPA/REV Afiliados</h3>
          </div>
          <form method="post" role="form">
          <div class="box-body">
            <div class="row">
              <div class="col-lg-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">Depósito Minimo CPA</label>
                  <input type="number" name="minDepForCpa" value="<?=$data['minDepForCpa'];?>" class="form-control" placeholder="10">
                </div>
              </div>
              <div class="col-lg-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">Resgate Minimo CPA (R$)</label>
                  <input type="number" name="minResgate" value="<?=$data['minResgate'];?>" class="form-control" placeholder="50">
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="form-group">
                  <label for="exampleInputEmail1">CPA Nivel 01 (R$)</label>
                  <input type="number" name="cpaLvl1" value="<?=$data['cpaLvl1'];?>" class="form-control" placeholder="10">
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="form-group">
                  <label for="exampleInputEmail1">CPA Nivel 02 (R$)</label>
                  <input type="number" name="cpaLvl2" value="<?=$data['cpaLvl2'];?>" class="form-control" placeholder="5">
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="form-group">
                  <label for="exampleInputEmail1">CPA Nivel 03 (R$)</label>
                  <input type="number" name="cpaLvl3" value="<?=$data['cpaLvl3'];?>" class="form-control" placeholder="1">
                </div>
              </div>
              <div class="col-md-12 col-lg-12"><hr></hr></div>
              <div class="col-md-6 col-lg-4">
                <div class="form-group">
                  <label for="exampleInputEmail1">REV Nivel 01 (% -Porcentagem)</label>
                  <input type="text" name="revShareLvl1" value="<?=$data['revShareLvl1'];?>" class="form-control" placeholder="10">
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="form-group">
                  <label for="exampleInputEmail1">REV Nivel 02 (% -Porcentagem)</label>
                  <input type="text" name="revShareLvl2" value="<?=$data['revShareLvl2'];?>" class="form-control" placeholder="5">
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="form-group">
                  <label for="exampleInputEmail1">REV Nivel 03 (% -Porcentagem)</label>
                  <input type="text" name="revShareLvl3" value="<?=$data['revShareLvl3'];?>" class="form-control" placeholder="1">
                </div>
              </div>
              
            </div>
         </div>

          <div class="box-footer">
          <?php $csrf->echoInputField();?>
          <button type="submit" name="editar-cpa" class="btn btn-primary btn-block">Atualizar dados</button>
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
if (isset($_POST['editar-cpa']) && isset($_POST['_csrf'])) {
	#----------------------------------------------#
    $minDepForCpa =  PHP_SEGURO($_POST['minDepForCpa']);
    $minResgate =  PHP_SEGURO($_POST['minResgate']);
    $cpaLvl1 =  PHP_SEGURO($_POST['cpaLvl1']);
    $cpaLvl2 =  PHP_SEGURO($_POST['cpaLvl2']);
    $cpaLvl3 =  PHP_SEGURO($_POST['cpaLvl3']);
    
    $revShareLvl1 =  PHP_SEGURO($_POST['revShareLvl1']);
    $revShareLvl2 =  PHP_SEGURO($_POST['revShareLvl2']);
    $revShareLvl3 =  PHP_SEGURO($_POST['revShareLvl3']);
    
    
	$CRSF =   PHP_SEGURO($_POST['_csrf']);
	#----------------------------------------------#
	if(empty($CRSF)) {
		echo '<div class="alert alert-danger alert-dismissible">
                <h4><i class="icon fa fa-ban"></i> Aviso!</h4>Houve um erro ao obter dados atualize sua página.
              </div>';
	}
    if(empty($minDepForCpa) && empty($minResgate)) {
      echo alertas_toaster('aviso','Insira os valores minímos para resgate.',3500);
      return true;
	}
    #----------------------------------------------#
    $sql = $mysqli->prepare("UPDATE afiliados_config SET minDepForCpa=?,minResgate=?,cpaLvl1=?,cpaLvl2=?,cpaLvl3=?,revShareLvl1=?,revShareLvl2=?,revShareLvl3=? WHERE id=1");
    $sql->bind_param("ssssssss",$minDepForCpa,$minResgate,$cpaLvl1,$cpaLvl2,$cpaLvl3,$revShareLvl1,$revShareLvl2,$revShareLvl3);
    if($sql->execute()) {
        echo alertas_toaster('ok','Ok! Conteúdo atualizado com sucesso.',3500);
        echo "<script>  setTimeout('window.location.href=\"".$painel_adm_cpa."\";', 2000); </script>";
    }else{
        echo alertas_toaster('aviso','Não foi possível atualizar dados.',3500);
        echo "<script>  setTimeout('window.location.href=\"".$painel_adm_cpa."\";', 2000); </script>";
    }
    $mysqli->close();
}


?>













