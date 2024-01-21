<?php include_once('header.php');?>  
<!-- Começa Aqui -->
<div class="main-content home">
   <div class="container-medium">
    <h3 class="mb-20">Históricos de Saque</h3>
    <div class="card">
        <p class="gray">
            <div class="table-responsive">
               <table  class="table table-bordered table-dark">
                 <thead>
                   <tr>
                     <th scope="col" class="text-center">Data/Hora</th>
                     <th scope="col" class="text-center">Transação Id</th>
                     <th scope="col" class="text-center">Valor Solicitado</th>
                     <th scope="col" class="text-center">Tipo Saque</th>
                     <th scope="col" class="text-center">Status</th>
                   </tr>
                 </thead>
                  <tbody>
                  <?php
                     $qry = "SELECT * FROM solicitacao_saques WHERE id_user='".intval($_SESSION['data_user']['id'])."' ORDER BY id DESC";
                     $res = mysqli_query($mysqli,$qry );
                     if(mysqli_num_rows($res)>0){
                        while($data = mysqli_fetch_assoc($res)){
                           if($data['status'] == 0){
                              $status = '<span class="badge badge-warning"><i class="fa fa-spinner fa-spin fa-fw"></i> Pendente</span> ';
                           }else{
                              $status = '<span class="badge badge-success"><i class="fa fa-check-circle-o"></i> Pago</span> ';
                           }
                            if($data['tipo_saque'] == 0){
                              $tipo_saque = '<span class="badge badge-success"><i class="fa fa-gamepad"></i> Saque Cassino</span> ';
                           }else{
                              $tipo_saque = '<span class="badge badge-success"><i class="fa fa-users"></i> Saque Afiliados</span> ';
                           }
                  ?>
                    <tr>
                      <th class="text-center"><?=ver_data_hoje($data['data_cad'],$data['data_hora']);?></th>
                      <th class="text-center"><?=$data['transacao_id'];?></th>
                      <td class="text-center"><strong>R$ <?=Reais2($data['valor']);?></strong></td>
                      <td class="text-center"><?=$tipo_saque;?></td>
                      <td class="text-center"><?=$status;?></td>
                    </tr>
                  <?php }}else{?>
                     <tr>
                      <th scope="row"><i class="fa fa-spinner fa-spin fa-fw"></i> Sem dados no momento.</th>
                      <td class="text-center"></td>
                      <td class="text-center"></td>
                      <td class="text-center"></td>
                    </tr>
                  <?php } ?>
                  </tbody>
               </table>
            </div>
      
           
        </p>
    </div>
</div>
<?php include_once('footer.php');?>