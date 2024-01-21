<?php include_once('header.php');?>
	 <!-- jQuery 3 -->
     <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <!-- Main content -->
    <section class="content">
		<div class="row">
			<div class="col-md-12 col-lg-12">
				<div class="box box-success">
					<div class="box-header with-border">
						<h3 class="box-title">Buscar Game</h3>
					</div>
					<div class="box-body text-center">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-search"></i></span>
							<input type="text" class="form-control"  placeholder="Pesquisar Game" id="search" name="search">
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12 col-lg-12" id="result-games-adm"></div>
		
		</div>
	
		<span id="conteudo"></span>
		<script>
			var qnt_result_pg = 12; //quantidade de registro por página
			var pagina = 1; //página inicial
			$(document).ready(function () {
				$("#conteudo").html('<br/><div class="alert alert-warning alert-dismissible"><i class="fa fa-spinner fa-spin fa-fw"></i> Aguarde carregando dados..</div>');
				listar_usuario(pagina, qnt_result_pg); //Chamar a função para listar os registros
			});
			
			function listar_usuario(pagina, qnt_result_pg){
				var dados = {
					pagina: pagina,
					qnt_result_pg: qnt_result_pg
				}
				$.post('ajax/ajax_listar_games.php', dados , function(retorna){
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
<script>
	$(document).ready(function(){
      var timeout;
      $('#search').keyup(function(){
         var query = $(this).val();
         if (query.length > 2) {
               $.ajax({
                  url: 'ajax/search-game-adm.php',
                  method: 'POST',
                  data: {query: query},
                  success: function(data){
                     $('#result-games-adm').html(data);
                     if ($('#result-games-adm:contains("Nenhum game foi encontrado")').length) {
                           clearTimeout(timeout);
                           timeout = setTimeout(function(){
                              $('#result-games-adm').empty();
                              $('#search').val('');
                           }, 7000);
                     }
                  }
               });
         } else {
               $('#result-games-adm').empty();
         }
      });
   });
</script>











