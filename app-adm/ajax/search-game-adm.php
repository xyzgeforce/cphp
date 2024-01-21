<?php
session_start();
include_once('../../sys/conexao.php');
include_once('../../sys/funcao.php');
include_once('../../sys/crud.php');
include_once('../../sys/crud-adm.php');
include_once('../../sys/checa_login_adm.php');
#expulsa user
checa_login_adm();

global $mysqli;
if(isset($_POST['query']) AND !empty($_POST['query'])){
      $buscar = PHP_SEGURO($_POST['query']);
      $sql = "SELECT * FROM games WHERE game_name LIKE '%$buscar%'";
      $res = mysqli_query($mysqli,$sql);
      if(mysqli_num_rows($res)>0){
		while($data = mysqli_fetch_assoc($res)){
			if($data['status'] == 1){
				$status_view = 'success';
			}else{
				$status_view = 'danger';  
			}
	?>
	<div class="col-md-3">
		<div class="box box-<?=$status_view;?> box-solid">
			<div class="box-header with-border">
				<h3 class="box-title"><?=$data['game_name'];?></h3>
			</div>
			<div class="box-body text-center">
				<img src="<?=$data['banner'];?>" alt="AvatarGame" class="img-rounded" width="189" height="145">
				<p> Provedor: <strong><?=strtoupper($data['provider']);?></p>
				<a href="<?=$painel_adm_view_game.encodeAll($data['id']);?>" class="btn btn-success btn-block btn-sm"><i class="fa fa-eye"></i> Editar Game</a>
			</div>
		</div>
	</div>
	<?php }}else{ ?>
	<div class="alert alert-danger alert-dismissible">
		<h4><i class="icon fa fa-ban"></i> Aviso ! Nenhum game foi encontrado.</h4>
	</div>
	<?php } ?>
	
<?php } ?>