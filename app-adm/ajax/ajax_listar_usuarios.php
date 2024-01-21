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
#capta dados do form
$pagina = filter_input(INPUT_POST, 'pagina', FILTER_SANITIZE_NUMBER_INT);
$qnt_result_pg = filter_input(INPUT_POST, 'qnt_result_pg', FILTER_SANITIZE_NUMBER_INT);
//calcular o inicio visualização
$inicio = ($pagina * $qnt_result_pg) - $qnt_result_pg;
//consultar no banco de dados
$result_usuario = "SELECT * FROM usuarios WHERE id ORDER BY id DESC LIMIT $inicio, $qnt_result_pg";
$resultado_usuario = mysqli_query($mysqli, $result_usuario);
//Verificar se encontrou resultado na tabela "usuarios"
if(($resultado_usuario) AND ($resultado_usuario->num_rows != 0)){?>

  <div class="row">
         <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title"><i class="fa fa-users"></i> Listar Usuários</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive">
              <table class="table table-hover">
                <tbody><tr>
                  <th class="text-center">Nome</th>
                  <th class="text-center">E-mail</th>
                  <th class="text-center">Total Depósitos</th>
                  <th class="text-center">Total Saques</th>
                  <th class="text-center">Ação </th>
                </tr>
                <?php
                    while($data = mysqli_fetch_assoc($resultado_usuario)){
						$RET_SAQUES =    total_saques_id($data['id']);
						$RET_DEPOSITOS = total_dep_id($data['id']);
                ?>
                <tr>
                  <td class="text-center"><?=$data['nome'];?></td>
                  <td class="text-center"><?=$data['email'];?></td>
                  <td class="text-center">R$ <?=Reais2($RET_DEPOSITOS);?></td>
                  <td class="text-center">R$ <?=Reais2($RET_SAQUES);?></td>
                  <td class="text-center"><a href="<?=$painel_adm_ver_usuarios.encodeAll($data['id']);?>" class="btn btn-success btn-xs btn-block"><i class="fa fa-eye"></i> Editar Usuário</a></td>
                </tr>
                
                <?php }?>
              
              </tbody></table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
	</div>
	<!-- /.row -->
<?php
	//Paginação - Somar a quantidade de usuários
	$result_pg = "SELECT COUNT(id) AS num_result FROM usuarios";
	$resultado_pg = mysqli_query($mysqli, $result_pg);
	$row_pg = mysqli_fetch_assoc($resultado_pg);

	//Quantidade de pagina
	$quantidade_pg = ceil($row_pg['num_result'] / $qnt_result_pg);

	//Limitar os link antes depois
	$max_links = 2;


	echo '<br>';
	echo '<nav aria-label="Page navigation">';
	echo '<ul class="pagination justify-content-center">';
	echo '<li class="page-item">';
	echo "<span class='page-link'><a href='#' onclick='listar_usuario(1, $qnt_result_pg)'>Primeira</a> </span>";
	echo '</li>';
	for ($pag_ant = $pagina - $max_links; $pag_ant <= $pagina - 1; $pag_ant++) {
		if($pag_ant >= 1){
			echo "<li class='page-item'><a class='page-link' href='#' onclick='listar_usuario($pag_ant, $qnt_result_pg)'>$pag_ant </a></li>";
		}
	}
	echo '<li class="page-item active">';
	echo '<span class="page-link">';
	echo "$pagina";
	echo '</span>';
	echo '</li>';

	for ($pag_dep = $pagina + 1; $pag_dep <= $pagina + $max_links; $pag_dep++) {
		if($pag_dep <= $quantidade_pg){
			echo "<li class='page-item'><a class='page-link' href='#' onclick='listar_usuario($pag_dep, $qnt_result_pg)'>$pag_dep</a></li>";
		}
	}
	echo '<li class="page-item">';
	echo "<span class='page-link'><a href='#' onclick='listar_usuario($quantidade_pg, $qnt_result_pg)'>Última</a></span>";
	echo '</li>';
	echo '</ul>';
	echo '</nav>';

}else{
	echo "<div class='alert alert-danger' role='alert'>Sem dado disponivel!</div>";
}