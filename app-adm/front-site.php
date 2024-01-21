<?php include_once('header.php');
$qry = "SELECT * FROM config WHERE id=1";
$res = mysqli_query($mysqli,$qry);
$data = mysqli_fetch_assoc($res);


if($data['status_topheader'] == 1){
  $view_status = '<span class="label label-success">Ativo</span>';
}else{
  $view_status = '<span class="label label-warning">Bloqueado</span>';
}

?>
    <link rel="stylesheet" href="<?=$docs_app_adm;?>bower_components/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
   
    <!-- Main content -->
    <section class="content">
      <!-- Info boxes -->
      <div class="row">
        <!-- TOPHEADER -->
        <div class="col-lg-12">
          <div class="box box-success collapsed-box">
            <div class="box-header with-border">
              <h3 class="box-title">Top Header Aviso (<?=$view_status;?>)</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
            <div class="box-body" style="">
                <form method="post" role="form">
                  <div class="box-body">
                    <div class="row">
                      <div class="col-lg-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Status Top Header (<?=$view_status;?>)</label>
                          <select class="form-control" name="status_topheader">
                            <option value="<?=$data['status_topheader'];?>" selected>-- Selecione seu Status TopHeader --</option>
                            <option value="1">Ativar</option>
                            <option value="0">Bloquear</option>
                          </select>
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Cor TopHeader</label>
                          <input type="text" name="cor_topheader" class="form-control my-colorpicker1 colorpicker-element" value="<?=$data['cor_topheader'];?>">
                        </div>
                      </div>
                  </div>

                  <div class="box-footer">
                  <?php $csrf->echoInputField();?>
                  <button type="submit" name="editar-topheader" class="btn btn-primary btn-block">Atualizar Top Header</button>
                  </div>
                  </form>
            </div>
          </div>
        </div>
        </div>
        <!-- DESCRIÇÃO SITE -->
        <div class="col-lg-12">
          <div class="box box-success collapsed-box">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-globe"></i> Descrição Site (Logo/Favicon)</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
            <div class="box-body" style="">
                <form method="post" role="form" enctype="multipart/form-data">
                  <div class="box-body">
                    <div class="row">
                      <div class="col-lg-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Nome Cassino</label>
                          <input type="text" name="site_name" class="form-control" value="<?=$data['nome'];?>" placeholder="Bet667">
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Nome Cassino Completo</label>
                          <input type="text" name="site_namefull" class="form-control" value="<?=$data['nome_site'];?>" placeholder="Bet667 - Sua Bet de Slots">
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Descrição Site</label>
                          <input type="text" name="descricao" class="form-control" value="<?=$data['descricao'];?>" placeholder="Bet667 - Sua Bet de Slots">
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Cor Site</label>
                          <input type="text" name="cor_site" class="form-control my-colorpicker2 colorpicker-element" value="<?=$data['cor_padrao'];?>" placeholder="#ed1c24">
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Logo Site</label>
                          <input type="file" class="form-control" name="img" id="img"><br/>
                          <?php if(!empty($data['logo'])){?>
                          <p class="text-center"><img src="<?=$docs_uploads.$data['logo']?>" width="200" height="75"></p>
                          <?php }?>
                          
                          
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Favicon Site</label>
                          <input type="file" class="form-control" name="imgico" id="imgico"><br/>
                          <?php if(!empty($data['favicon'])){?>
                          <p class="text-center"><img src="<?=$docs_uploads.$data['favicon']?>" width="75" height="75"></p>
                          <?php }?>
                        </div>
                      </div>
                  <div class="box-footer">
                  <?php $csrf->echoInputField();?>
                  <button type="submit" name="editar-descricao" class="btn btn-primary btn-block">Atualizar Top Header</button>
                  </div>
                  </form>
            </div>
          </div>
        </div>
        </div>
      
      
      
      
      
      
      
      
      
      
      </div>
        <!-- SEO SITE -->
        <div class="col-lg-12">
          <div class="box box-success collapsed-box">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-bullseye"></i> SEO Site</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
            <div class="box-body" style="">
                <form method="post" role="form" enctype="multipart/form-data">
                  <div class="box-body">
                    <div class="row">
                      <div class="col-lg-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Keyword Site</label>
                          <input type="text" name="keyword" class="form-control" value="<?=$data['keyword'];?>" placeholder="cassino,bet,pix">
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Img Seo Site</label>
                          <input type="file" class="form-control" name="img" id="img"><br/>
                          <?php if(!empty($data['img_seo'])){?>
                          <p class="text-center"><img src="<?=$docs_uploads.$data['img_seo']?>" width="250 " height="200"></p>
                          <?php }?>
                        </div>
                      </div>
                  <div class="box-footer">
                  <?php $csrf->echoInputField();?>
                  <button type="submit" name="editar-seo-site" class="btn btn-primary btn-block">Atualizar Seo Site</button>
                  </div>
                  </form>
            </div>
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
 <script src="<?=$docs_app_adm;?>bower_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<script>
  $(function () {
    //Colorpicker
    $('.my-colorpicker1').colorpicker()
    //color picker with addon
    $('.my-colorpicker2').colorpicker()

    //Timepicker
    $('.timepicker').timepicker({
      showInputs: false
    })
  })
</script>

<?php
if (isset($_POST['editar-seo-site']) && isset($_POST['_csrf'])) {
	#----------------------------------------------#
    $keyword =  PHP_SEGURO($_POST['keyword']);
    #----------------------------------------------#
    $imgNome  = $_FILES['img']['name'];
    #----------------------------------------------#
	$CRSF =   PHP_SEGURO($_POST['_csrf']);
	#----------------------------------------------#
	$fileLocal	= '../uploads/';
	#----------------------------------------------#
	if(empty($CRSF)) {
		echo '<div class="alert alert-danger alert-dismissible">
                <h4><i class="icon fa fa-ban"></i> Aviso!</h4>Houve um erro ao obter dados atualize sua página.
              </div>';
	}
    if(empty($keyword)) {
      echo alertas_toaster('aviso','Insira os dados no formulário.',3500);
      return true;
	}
    #----------------------------------------------#
    if(empty($imgNome)){
      $sql = $mysqli->prepare("UPDATE config SET keyword=? WHERE id=1");
      $sql->bind_param("s",$keyword);
      if($sql->execute()) {
          echo alertas_toaster('ok','Ok! Conteúdo atualizado com sucesso.',3500);
          echo "<script>  setTimeout('window.location.href=\"".$painel_adm_front_site."\";', 2000); </script>";
      }else{
          echo alertas_toaster('aviso','Não foi possível atualizar dados.',3500);
          echo "<script>  setTimeout('window.location.href=\"".$painel_adm_front_site."\";', 2000); </script>";
      }
    }
    elseif(!empty($imgNome)){
        unlink($fileLocal.$data['img_seo']);
        $fileExt            = substr($imgNome, strrpos($imgNome, '.')); 
		$formatosaceitos = array('.jpg','.png','.JPG','.jpeg','.svg','.webp','.ico');
		if (!in_array($fileExt, $formatosaceitos)){
			echo alertas_toaster('aviso','Aceitamos apenas imagens em formatos .jpg  .png  .JPG .jpeg .svg .webp');
			return true;
		}
		$nomeRandom         = rand(0, 99999999999) + rand(0, 99999999999) + rand(0, 99999999999); 
		$novoNome 		    =  $nomeRandom.$fileExt;
		$tamanho = $_FILES['img']['size'];
		if($tamanho > 20000000) {
			echo alertas_toaster('aviso','O arquivo de imagem execedeu os 20MB permitidos para upload.');
			return true;
		}
		if(move_uploaded_file($_FILES['img']['tmp_name'], $fileLocal.$novoNome)) {
          $bdnome = $novoNome;
          $sql = $mysqli->prepare("UPDATE config SET keyword=?,img_seo=? WHERE id=1");
          $sql->bind_param("ss",$keyword,$bdnome);
          if($sql->execute()) {
              echo alertas_toaster('ok','Ok! Conteúdo atualizado com sucesso.',3500);
              echo "<script>  setTimeout('window.location.href=\"".$painel_adm_front_site."\";', 2000); </script>";
          }else{
              echo alertas_toaster('aviso','Não foi possível atualizar dados.',3500);
              echo "<script>  setTimeout('window.location.href=\"".$painel_adm_front_site."\";', 2000); </script>";
          }
        }
    }
    $mysqli->close();
}


if (isset($_POST['editar-topheader']) && isset($_POST['_csrf'])) {
	#----------------------------------------------#
    $status_topheader =  PHP_SEGURO($_POST['status_topheader']);
    $cor_topheader =  PHP_SEGURO($_POST['cor_topheader']);
	$CRSF =   PHP_SEGURO($_POST['_csrf']);
	#----------------------------------------------#
	if(empty($CRSF)) {
		echo '<div class="alert alert-danger alert-dismissible">
                <h4><i class="icon fa fa-ban"></i> Aviso!</h4>Houve um erro ao obter dados atualize sua página.
              </div>';
	}
    if(empty($cor_topheader)) {
      echo alertas_toaster('aviso','Insira os dados no formulário.',3500);
      return true;
	}
    #----------------------------------------------#
    $sql = $mysqli->prepare("UPDATE config SET status_topheader=?,cor_topheader=? WHERE id=1");
    $sql->bind_param("ss",$status_topheader,$cor_topheader);
    if($sql->execute()) {
        echo alertas_toaster('ok','Ok! Conteúdo atualizado com sucesso.',3500);
        echo "<script>  setTimeout('window.location.href=\"".$painel_adm_front_site."\";', 2000); </script>";
    }else{
        echo alertas_toaster('aviso','Não foi possível atualizar dados.',3500);
        echo "<script>  setTimeout('window.location.href=\"".$painel_adm_front_site."\";', 2000); </script>";
    }
    $mysqli->close();
}


if (isset($_POST['editar-descricao']) && isset($_POST['_csrf'])) {
	#----------------------------------------------#
    $site_name =  PHP_SEGURO($_POST['site_name']);
    $site_namefull =  PHP_SEGURO($_POST['site_namefull']);
    $descricao =  PHP_SEGURO($_POST['descricao']);
    $cor_site =  PHP_SEGURO($_POST['cor_site']);
    #----------------------------------------------#
    $imgNome  = $_FILES['img']['name'];
    $imgico  = $_FILES['imgico']['name'];
    #----------------------------------------------#
	$CRSF =   PHP_SEGURO($_POST['_csrf']);
	#----------------------------------------------#
	$fileLocal	= '../uploads/';
	#----------------------------------------------#
	if(empty($CRSF)) {
		echo '<div class="alert alert-danger alert-dismissible">
                <h4><i class="icon fa fa-ban"></i> Aviso!</h4>Houve um erro ao obter dados atualize sua página.
              </div>';
	}
    if(empty($site_name) && empty($site_namefull) && empty($descricao)) {
      echo alertas_toaster('aviso','Insira os dados no formulário.',3500);
      return true;
	}
    #----------------------------------------------#
    if(empty($imgNome) AND empty($imgico)){
      $sql = $mysqli->prepare("UPDATE config SET nome=?,nome_site=?,descricao=?,cor_padrao=? WHERE id=1");
      $sql->bind_param("ssss",$site_name,$site_namefull,$descricao,$cor_site);
      if($sql->execute()) {
          echo alertas_toaster('ok','Ok! Conteúdo atualizado com sucesso.',3500);
          echo "<script>  setTimeout('window.location.href=\"".$painel_adm_front_site."\";', 2000); </script>";
      }else{
          echo alertas_toaster('aviso','Não foi possível atualizar dados.',3500);
          echo "<script>  setTimeout('window.location.href=\"".$painel_adm_front_site."\";', 2000); </script>";
      }
    }
    elseif(!empty($imgNome) AND empty($imgico)){
        unlink($fileLocal.$data['logo']);
        $fileExt            = substr($imgNome, strrpos($imgNome, '.')); 
		$formatosaceitos = array('.jpg','.png','.JPG','.jpeg','.svg','.webp','.ico');
		if (!in_array($fileExt, $formatosaceitos)){
			echo alertas_toaster('aviso','Aceitamos apenas imagens em formatos .jpg  .png  .JPG .jpeg .svg .webp');
			return true;
		}
		$nomeRandom         = rand(0, 99999999999) + rand(0, 99999999999) + rand(0, 99999999999); 
		$novoNome 		    =  $nomeRandom.$fileExt;
		$tamanho = $_FILES['img']['size'];
		if($tamanho > 20000000) {
			echo alertas_toaster('aviso','O arquivo de imagem execedeu os 20MB permitidos para upload.');
			return true;
		}
		if(move_uploaded_file($_FILES['img']['tmp_name'], $fileLocal.$novoNome)) {
          $bdnome = $novoNome;
          $sql = $mysqli->prepare("UPDATE config SET nome=?,nome_site=?,descricao=?,logo=?,cor_padrao=? WHERE id=1");
          $sql->bind_param("sssss",$site_name,$site_namefull,$descricao,$bdnome,$cor_site);
          if($sql->execute()) {
              echo alertas_toaster('ok','Ok! Conteúdo atualizado com sucesso.',3500);
              echo "<script>  setTimeout('window.location.href=\"".$painel_adm_front_site."\";', 2000); </script>";
          }else{
              echo alertas_toaster('aviso','Não foi possível atualizar dados.',3500);
              echo "<script>  setTimeout('window.location.href=\"".$painel_adm_front_site."\";', 2000); </script>";
          }
        }
    }
    elseif(empty($imgNome) AND !empty($imgico)){
        unlink($fileLocal.$data['favicon']);
        $fileExt            = substr($imgico, strrpos($imgico, '.')); 
		$formatosaceitos = array('.jpg','.png','.JPG','.jpeg','.svg','.webp','.ico');
		if (!in_array($fileExt, $formatosaceitos)){
			echo alertas_toaster('aviso','Aceitamos apenas imagens em formatos .jpg  .png  .JPG .jpeg .svg .webp');
			return true;
		}
		$nomeRandom         = rand(0, 99999999999) + rand(0, 99999999999) + rand(0, 99999999999); 
		$novoNome 		    =  $nomeRandom.$fileExt;
		$tamanho = $_FILES['imgico']['size'];
		if($tamanho > 20000000) {
			echo alertas_toaster('aviso','O arquivo de imagem execedeu os 20MB permitidos para upload.');
			return true;
		}
		if(move_uploaded_file($_FILES['imgico']['tmp_name'], $fileLocal.$novoNome)) {
          $bdnome = $novoNome;
          $sql = $mysqli->prepare("UPDATE config SET nome=?,nome_site=?,descricao=?,favicon=?,cor_padrao=? WHERE id=1");
          $sql->bind_param("sssss",$site_name,$site_namefull,$descricao,$bdnome,$cor_site);
          if($sql->execute()) {
              echo alertas_toaster('ok','Ok! Conteúdo atualizado com sucesso.',3500);
              echo "<script>  setTimeout('window.location.href=\"".$painel_adm_front_site."\";', 2000); </script>";
          }else{
              echo alertas_toaster('aviso','Não foi possível atualizar dados.',3500);
              echo "<script>  setTimeout('window.location.href=\"".$painel_adm_front_site."\";', 2000); </script>";
          }
        }
    }
    elseif(!empty($imgNome) AND !empty($imgico)){
        unlink($fileLocal.$data['logo']);
        unlink($fileLocal.$data['favicon']);
        
        
        
        
        $fileExt            = substr($imgNome, strrpos($imgNome, '.')); 
        $fileExt01            = substr($imgico, strrpos($imgico, '.')); 
		$formatosaceitos = array('.jpg','.png','.JPG','.jpeg','.svg','.webp','.ico');
		if (!in_array($fileExt, $formatosaceitos) && !in_array($fileExt01, $formatosaceitos)){
			echo alertas_toaster('aviso','Aceitamos apenas imagens em formatos .jpg  .png  .JPG .jpeg .svg .webp');
			return true;
		}
        
        
        
		$nomeRandom         = rand(0, 99999999999) + rand(0, 99999999999) + rand(0, 99999999999); 
		$novoNome 		    =  $nomeRandom.$fileExt;
        
        $nomeRandom3         = rand(0, 99999999999) + rand(0, 99999999999) + rand(0, 99999999999); 
		$novoNome3 		    =  $nomeRandom3.$fileExt01;
        
        
        
        
		$tamanho = $_FILES['img']['size'];
		$tamanho2 = $_FILES['imgico']['size'];
		if($tamanho > 20000000 && $tamanho2 > 20000000) {
			echo alertas_toaster('aviso','O arquivo de imagem execedeu os 20MB permitidos para upload.');
			return true;
		}
		if(move_uploaded_file($_FILES['imgico']['tmp_name'], $fileLocal.$novoNome3) && move_uploaded_file($_FILES['img']['tmp_name'], $fileLocal.$novoNome)) {
          $img = $novoNome;
          $ico = $novoNome3;
          $sql = $mysqli->prepare("UPDATE config SET nome=?,nome_site=?,descricao=?,logo=?,favicon=?,cor_padrao=? WHERE id=1");
          $sql->bind_param("ssssss",$site_name,$site_namefull,$descricao,$img,$ico,$cor_site);
          if($sql->execute()) {
              echo alertas_toaster('ok','Ok! Conteúdo atualizado com sucesso.',3500);
              echo "<script>  setTimeout('window.location.href=\"".$painel_adm_front_site."\";', 2000); </script>";
          }else{
              echo alertas_toaster('aviso','Não foi possível atualizar dados.',3500);
              echo "<script>  setTimeout('window.location.href=\"".$painel_adm_front_site."\";', 2000); </script>";
          }
        }
    }
    
    
    
    
    
    
    
    $mysqli->close();
}


?>













