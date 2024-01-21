<?php include_once('header.php');?>
    <!-- Main content -->
    <section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title"><i class="fa fa-money"></i> Saques Pendentes</h3>
					</div>

					<div class="box-body table-responsive no-padding">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th class="text-center">Data/Hora</th>
									<th class="text-center">User E-mail</th>
									<th class="text-center">Id Transação</th>
									<th class="text-center">Valor Solicitado</th>
									<th class="text-center">Status Saque</th>
									<th class="text-center">Ação</th>
								</tr>
								<?php
									$qry = "SELECT * FROM solicitacao_saques WHERE status=0";
									$res = mysqli_query($mysqli,$qry);
									if(mysqli_num_rows($res)>0){
										while($data = mysqli_fetch_assoc($res)){
											$data_return = data_user_id($data['id_user']);
											if($data['status'] == 1){
											  $status_view = '<span class="label label-success"><i class="fa fa-check-circle-o"></i> PAGO</span>';
											}else{
											  $status_view = '<span class="label label-warning"><i class="fa fa-refresh fa-spin fa-fw"></i> PENDENTE</span>';  
											}
								?>
								<tr>
									<td class="text-center"><?=ver_data_hoje($data['data_cad'],$data['data_hora']);?></td>
									<td class="text-center"><?=$data_return['email'];?></td>
									<td class="text-center"><?=$data['transacao_id'];?></td>
									<td class="text-center"><strong>R$ <?=Reais2($data['valor']);?></strong></td>
									<td class="text-center"><?=$status_view;?></td>
									<td class="text-center">
										<button type="button" class="btn btn-success btn-xs btn-block" data-toggle="modal" data-target="#modal-default<?=$data['id'];?>">Editar</button>
									</td>
								</tr>
								
								
								<div class="modal fade" id="modal-default<?=$data['id'];?>" style="display: none;">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">×</span></button>
													<h4 class="modal-title">[MÓDULO SAQUE]</h4>
											</div>
											<div class="modal-body">
												<div class="col-md-12">
													<div class="box box-primary">
													<form role="form" method="post">
														<div class="box-body">
															<div class="form-group text-center">
																<div class="alert alert-warning alert-dismissible">
																<h4><i class="icon fa fa-warning"></i> Aviso!</h4>
																Atualize a Solicitação de Saque somente depois que você efetuar manualmente o pagamento ao usuário.
																</div>
															</div>
															<div class="form-group text-center">
																<label for="exampleInputEmail1">Valor a ser Pago</label>
																<h1><strong>R$ <?=Reais2($data['valor']);?></strong></h1>
															</div>
															<div class="form-group">
																<label for="exampleInputEmail1">Nome User</label>
																<input type="text" class="form-control" id="exampleInputEmail1" value="<?=$data_return['nome'];?>" readonly>
															</div>
															<div class="form-group">
																<label for="exampleInputEmail1">Tipo Pix</label>
																<input type="text" class="form-control" id="exampleInputEmail1" value="<?=$data['tipo'];?>" readonly>
															</div>
															<div class="form-group">
																<label for="exampleInputPassword1">Key Pix</label>
																<input type="text" class="form-control" value="<?=$data['pix'];?>">
															</div>
														</div>

													<div class="box-footer">
														<?php $csrf->echoInputField(); ?>
														<input type="hidden" name="id_pay" value="<?=intval($data['id']);?>" required />
														<button type="submit" name="att-pay" class="btn btn-success btn-block">Atualizar Solicitação de Saque</button>
													</div>
													</form>
													</div>
												</div>
											</div>
											<div class="modal-footer">
												
											
												<button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
											</div>
										</div>
									</div>
								</div>
								<?php } }else{ ?>
								<tr>
									<td><i class="fa fa-spinner fa-spin"></i> Sem dados no momento.</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<?php } ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<?php include_once('footer.php');?>
<?php
if (isset($_POST['att-pay']) && isset($_POST['_csrf']) && isset($_POST['id_pay'])) {
	#----------------------------------------------#
    $id_pay =  PHP_SEGURO($_POST['id_pay']);
	$CRSF =   PHP_SEGURO($_POST['_csrf']);
	$data = date('Y-m-d H:i:s');
	#----------------------------------------------#
	if(empty($CRSF)) {
		echo '<div class="alert alert-danger alert-dismissible">
                <h4><i class="icon fa fa-ban"></i> Aviso!</h4>Houve um erro ao obter dados atualize sua página.
              </div>';
	}
	$sql = $mysqli->prepare("UPDATE solicitacao_saques SET data_att=?,status=1 WHERE id=?");
    $sql->bind_param("si",$data,$id_pay);
    if($sql->execute()) {
        echo alertas_toaster('ok','Ok! Conteúdo atualizado com sucesso.',3500);
        echo "<script>  setTimeout('window.location.href=\"".$painel_adm_saques_pendentes."\";', 2000); </script>";
    }else{
        echo alertas_toaster('aviso','Não foi possível atualizar dados.',3500);
        echo "<script>  setTimeout('window.location.href=\"".$painel_adm_saques_pendentes."\";', 2000); </script>";
    }
 $mysqli->close();
}

?>











