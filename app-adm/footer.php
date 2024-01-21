<footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Versão</b> Beta 1.0
    </div>
    <strong>Copyright &copy; 2023-2024 <a href="#">BetFyrie</a>.</strong> Todos os direitos reservados.
  </footer>
</div>
<!-- ./wrapper -->




    <div class="modal fade" id="modal-buscar">
        <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
        <h4 class="modal-title">[<i class="fa fa-user"></i> Buscar Usuário]</h4>
        </div>
        <div class="modal-body">
            <form role="form" method="post">
               <div class="box-body">
                 <div class="row">
                   <div class="col-lg-12">
                     <div class="form-group">
                       <label for="exampleInputEmail1">E-mail do Usuário</label>
                       <input type="email" name="email" class="form-control" placeholder="Insira o e-mail de busca" required>
                     </div>
                   </div>
                 </div>
               </div>
               <!-- /.box-body -->
               <div class="box-footer">
                 <?php $csrf->echoInputField(); ?>
                 <button type="submit" name="buscar-user" class="btn btn-success btn-block">Buscar Usuário</button>
               </div>
             </form>
                     
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
        </div>
        </div>

        </div>

    </div>



<!-- Bootstrap 3.3.7 -->
<script src="<?=$docs_app_adm;?>bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="<?=$docs_app_adm;?>bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="<?=$docs_app_adm;?>dist/js/adminlte.min.js"></script>
<!-- Sparkline -->
<script src="<?=$docs_app_adm;?>bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap  -->
<script src="<?=$docs_app_adm;?>plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="<?=$docs_app_adm;?>plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll -->
<script src="<?=$docs_app_adm;?>bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS -->
<script src="<?=$docs_app_adm;?>bower_components/chart.js/Chart.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<?=$docs_app_adm;?>dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<?=$docs_app_adm;?>dist/js/demo.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

<script>
function saldoapiFiver() {
    var URL_SALDO = '<?=$painel_adm_saldo_api_js;?>';
    $.get(URL_SALDO, function (data) {
        $('#id-saldo-api').html(data).show();
        // Processar a resposta ou realizar outras ações necessárias
        //console.log("Status de pagamento:", data);
    }).fail(function () {
        //console.error("Erro ao obter o status de pagamento");
    });
}
setInterval(saldoapiFiver, 8000);
</script>


</body>
</html>

<?php
if (isset($_POST['buscar-user']) && isset($_POST['_csrf'])) {
	#----------------------------------------------#
	$email =   PHP_SEGURO($_POST['email']);
	$CRSF =   PHP_SEGURO($_POST['_csrf']);
	#----------------------------------------------#
	if(empty($CRSF)) {
      echo alertas_toaster('aviso','Houve um erro ao obter dados atualize sua página.',3500);
      return true;
	}
	if(empty($email)) {
      echo alertas_toaster('aviso','Insira um e-mail no formulário.',3500);
      return true;
	}
	if(filter_var($email, FILTER_VALIDATE_EMAIL) AND !empty($email)){}else{
      echo alertas_toaster('aviso','Insira um e-mail válido no formulário.',3500);
      return true;
    }
    #----------------------------------------------##----------------------------------------------#
	#----------------------------------------------##----------------------------------------------#
	#----------------------------------------------##----------------------------------------------#
    $qry = "SELECT * FROM usuarios WHERE email='".$email."'";
    $res = mysqli_query($mysqli,$qry);
    if(mysqli_num_rows($res)>0){
        $data = mysqli_fetch_assoc($res);
        $url_redir_userx = $painel_adm_ver_usuarios.encodeAll($data['id']);
        echo alertas_toaster('ok','Buscando dados aguarde...',3500);
        echo "<script>  setTimeout('window.location.href=\"".$url_redir_userx ."\";', 2000); </script>";
    }else{
      echo alertas_toaster('aviso','Não foi possível encontrar usuário.',3500);
      return true;
      
    }
    #----------------------------------------------##----------------------------------------------#
    #----------------------------------------------##----------------------------------------------#
    #----------------------------------------------##----------------------------------------------#
    //liberar variavel
    $mysqli->close();
}

?>

