<?php include_once('header.php');?>
    <!-- Main content -->
    <section class="content">
      <!-- Info boxes -->
      <div class="row">
         <div class="col-xs-12">
            <span id="conteudo"></span>
              <script>
                  $(document).ready(function () {
                      listar_usuario(pagina, qnt_result_pg); //Chamar a função para listar os registros
                  });
                  function atualizarDiv(retorna) {
                    $('#conteudo').html(retorna);
                  }
                  function exibirdata(pagina, qnt_result_pg) {
                      var dados = {
                          pagina: pagina,
                          qnt_result_pg: qnt_result_pg
                      }
                      $.ajax({
                            type: "POST",
                            url: "ajax/ajax_listar_usuarios.php",
                            data: { qnt_result_pg: 50,pagina:1 },
                            success: function(response) {
                              atualizarDiv(response);
                            }
                        });
                  }
                  exibirdata();
               </script>
      
      
      
      </div>
        
     <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
<?php include_once('footer.php');?>











