<?php include_once('header.php');
if(isset($_REQUEST['slug'])){
  $id_user = decodeAll($_REQUEST['slug']);
  $qry = "SELECT * FROM games WHERE id='".intval($id_user)."'";
  $res = mysqli_query($mysqli,$qry);
  if(mysqli_num_rows($res)>0){
    $data = mysqli_fetch_assoc($res);
  }else{
      echo "<script>  setTimeout('window.location.href=\"".$painel_adm."\";', 0); </script>";
      exit();
  }
}
//========================================================================================================#
$url_atual =(isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
//========================================================================================================#
?>
<?php
  if($data['status'] == 1){
    $status = '';
  }else{
    $status = '';
  }
  if($data['popular'] == 1){
    $popular = '(<strong><i>Popular</i></strong>)';
  }else{
    $popular = '';
  }



?>

    <!-- Main content -->
    <section class="content">
      <!-- Info boxes -->
      <div class="row">
         <div class="col-md-12 col-lg-12">
          <div class="box box-primary">
          <div class="box-header with-border">
          <h3 class="box-title"><i class="fa fa-gamepad"></i> Configuração de Game</h3>
          </div>
          <form method="post" enctype="multipart/form-data">
          <div class="box-body">
            <div class="row">
              <div class="col-md-3 col-lg-3">
                <div class="form-group">
                  <label for="exampleInputEmail1">Nome de Game</label>
                  <input type="text" value="<?=$data['game_name'];?>" class="form-control" readonly>
                </div>
              </div>
              <div class="col-md-3 col-lg-3">
                <div class="form-group">
                  <label for="exampleInputEmail1">Provedor</label>
                  <input type="text" value="<?=$data['provider'];?>" class="form-control" readonly>
                </div>
              </div>
              <div class="col-md-6 col-lg-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">Popular Game <?=$popular;?></label>
                  <select class="form-control" name="popular">
                    <option value="<?=$data['popular'];?>" selected>-- Selecione Status Popular Games --</option>
                    <option value="1">Ativar Popular Game</option>
                    <option value="0">Desativar Popular Game</option>
                  </select>
                </div>
              </div>
              <div class="col-md-12 col-lg-12">
                <div class="form-group">
                  <label for="exampleInputEmail1">Banner Game</label>
                  <input type="file" name="img" class="form-control"><br/>
                  <p class="text-center">:: Banner Atual ::</p><br/>
                  <p class="text-center"><img src="<?=$data['banner'];?>" alt="Game" class="img-rounded" width="300" height="250"></p><br/>
                 </div>
              </div>
            </div>
         </div>
          <div class="box-footer">
            <?php $csrf->echoInputField();?>
            <button type="submit" name="editar-game" class="btn btn-success btn-block">Atualizar dados de Game</button>
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
if (isset($_POST['editar-game']) && isset($_POST['_csrf'])) {
	#----------------------------------------------#
    $popular =  PHP_SEGURO($_POST['popular']);
    $imgNome  = $_FILES['img']['name'];
	$CRSF =   PHP_SEGURO($_POST['_csrf']);
	#----------------------------------------------#
	if(empty($CRSF)) {
		 echo alertas_toaster('aviso','Atualize sua página.',3500);
        return true;
	}
    #-------------------------------------#
    $fileLocal	= '../uploads/';
    #-------------------------------------#
    # se ambos nao tiverem vazios
	if(!empty($imgNome)){
		$fileExt            = substr($imgNome, strrpos($imgNome, '.')); 
		$formatosaceitos = array('.jpg','.png','.JPG','.jpeg','.svg','.webp','.ico');
		if (!in_array($fileExt, $formatosaceitos)){
			echo alertas_toaster('aviso','Aceitamos apenas imagens em formatos .jpg  .png  .JPG .jpeg .svg .webp');
			return true;
		}
		$nomeRandom         = rand(0, 99999999999) + rand(0, 99999999999) + rand(0, 99999999999); 
		$novoNome 		    = "game-".$nomeRandom.$fileExt;
		$tamanho = $_FILES['img']['size'];
		if($tamanho > 20000000) {
			echo alertas_toaster('aviso','O arquivo de imagem execedeu os 20MB permitidos para upload.');
			return true;
		}
		if(move_uploaded_file($_FILES['img']['tmp_name'], $fileLocal.$novoNome)) {
			$bdnome = $docs_uploads.$novoNome; 
			$sql = $mysqli->prepare("UPDATE games SET popular=?,banner=? WHERE id=?");
            $sql->bind_param("ssi",$popular,$bdnome,$data['id']);
            if($sql->execute()) {
                echo alertas_toaster('ok','Ok! Conteúdo atualizado com sucesso.',3500);
                echo "<script>  setTimeout('window.location.href=\"".$url_atual."\";', 2000); </script>";
            }else{
                echo alertas_toaster('aviso','Não foi possível atualizar dados.',3500);
                echo "<script>  setTimeout('window.location.href=\"".$url_atual."\";', 2000); </script>";
            }
		}else{
          echo  alertas_toaster('aviso','Não conseguimos mover conteúdo.');
          return true;
        }
	}else{
      $sql = $mysqli->prepare("UPDATE games SET popular=? WHERE id=?");
      $sql->bind_param("si",$popular,$data['id']);
      if($sql->execute()) {
          echo alertas_toaster('ok','Ok! Conteúdo atualizado com sucesso.',3500);
          echo "<script>  setTimeout('window.location.href=\"".$url_atual."\";', 2000); </script>";
      }else{
          echo alertas_toaster('aviso','Não foi possível atualizar dados.',3500);
          echo "<script>  setTimeout('window.location.href=\"".$url_atual."\";', 2000); </script>";
      }
	}
	#-------------------------------------#
    $mysqli->close();
}
?>













