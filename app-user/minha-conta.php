<?php include_once('header.php');
$saldototal = $saldo_data['saldo']+$saldo_data['saldo_afiliado'];
?>  
<!-- Começa Aqui -->
<div class="main-content home">
<div class="container-medium">
   <div class="main-sublinks-wrapper">
      <div data-w-tab="geral" class="tab-pane w-tab-pane w--tab-active" id="w-tabs-0-data-w-pane-0" role="tabpanel" aria-labelledby="w-tabs-0-data-w-tab-0">
         <div class="card">
            <div class="div-block-2">
               <div class="div-block">
                  <div class="icon-24 color-1"></div>
                  <div>
                     <h4 user-username="" class="white"><?=$_SESSION['data_user']['nome'];?></h4>
                     <div user-email=""><?=$_SESSION['data_user']['email'];?></div>
                  </div>
               </div>
            </div>
         </div>
         <div class="w-layout-grid grid-4 mt-24">
            
            <div id="w-node-_0ea1822e-c190-6053-e5ab-02b116f0917d-b4edabe8" class="card degrade">
               <div class="icon-24 mb-20 color-3"></div>
               <div>Saldo Cassino</div>
               <h3 class="white"><?=Reais2($saldo_data['saldo']);?></h3>
            </div>
            <div id="w-node-_0ea1822e-c190-6053-e5ab-02b116f09186-b4edabe8" class="card degrade">
               <div class="icon-24 mb-20 color-4"></div>
               <div>Afiliados (Cpa/Rev)</div>
               <h3 class="white"><?=Reais2($saldo_data['saldo_afiliado']);?></h3>
            </div>
            <div id="w-node-_0ea1822e-c190-6053-e5ab-02b116f0916b-b4edabe8" class="card degrade">
               <div class="icon-24 mb-20 color-1"></div>
               <div>Saldo total</div>
               <h3 class="white">R$ <span><?=Reais2($saldototal);?></span></h3>
            </div>
         </div>
      </div>
   </div>
   <!-- Fechando a div com a classe main-sublinks-wrapper -->
</div>
<?php include_once('footer.php');?>