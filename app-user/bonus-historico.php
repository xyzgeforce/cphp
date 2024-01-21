<?php include_once('header.php');?>  
<!-- Começa Aqui -->
<div class="main-content home">
   <div class="container-medium">
    <h3 class="mb-20">Histórico de Bônus (CPA/REV)</h3>
    <div class="card">
        <p class="gray">
            <div class="table-responsive">
               <table  class="table table-bordered table-dark">
                 <thead>
                   <tr>
                     <th scope="col" class="text-center">Data/Hora</th>
                     <th scope="col" class="text-center">Valor Recebido</th>
                     <th scope="col" class="text-center">Tipo</th>
                   </tr>
                 </thead>
                  <tbody>
                  <?php
                     $qry = "SELECT * FROM pay_valores_cassino WHERE id_user='".intval($_SESSION['data_user']['id'])."'";
                     $res = mysqli_query($mysqli,$qry );
                     if(mysqli_num_rows($res)>0){
                        while($data = mysqli_fetch_assoc($res)){
                           if($data['tipo'] == 0){
                              $status = '<span class="badge badge-info">CPA</span> ';
                           }else if($data['tipo'] == 1){
                              $status = '<span class="badge badge-success">REV</span> ';
                           }else{
                              $status = '<span class="badge badge-info">Bônus</span> ';
                           }
                  ?>
                    <tr>
                     <th class="text-center"><?=ver_data($data['data_time']);?></th>
                     <td class="text-center"><strong>R$ <?=Reais2($data['valor']);?></strong></td>
                     <td class="text-center"><?=$status;?></td>
                    </tr>
                  <?php }}else{?>
                     <tr>
                      <th scope="row"><i class="fa fa-spinner fa-spin fa-fw"></i> Sem dados no momento.</th>
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