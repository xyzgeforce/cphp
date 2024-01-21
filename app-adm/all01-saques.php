<?php include_once('header.php');?>
    <!-- Main content -->
    <section class="content">
       <!-- jQuery 3 -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
      <span id="conteudo"></span>
          <script>
				var qnt_result_pg = 35; //quantidade de registro por página
				var pagina = 1; //página inicial
				$(document).ready(function () {
					listar_usuario(pagina, qnt_result_pg); //Chamar a função para listar os registros
				});
				
				function listar_usuario(pagina, qnt_result_pg){
					var dados = {
						pagina: pagina,
						qnt_result_pg: qnt_result_pg
					}
					$.post('ajax/ajax_all_saques.php', dados , function(retorna){
						//Subtitui o valor no seletor id="conteudo"
						$("#conteudo").html(retorna);
					});
				} 
			</script>
     </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<?php include_once('footer.php');?>











