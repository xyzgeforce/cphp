<?php include_once('header.php');
if (isset($_GET['param1']) && isset($_GET['param2'])) {
    // Acesse os parâmetros
    $provedor = PHP_SEGURO($_GET['param1']);
    $game_code = PHP_SEGURO($_GET['param2']);
    //montar url game
    $urlLinkPlay = pegarLinkJogo($provedor,$game_code,$_SESSION['data_user']['email']);
}else{
    echo "<script>  setTimeout('window.location.href=\"".$painel_user."\";', 0); </script>";
    exit();
}
?> 
<style>
   .GameFrame{
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      border-radius: 15px; 
      border: 1px; 
      margin-bottom: 10px;
   }

   #scroll-wrapper {
       -webkit-overflow-scrolling: touch;
       overflow-y: scroll;
   }
</style>

<style>
   /* Estilo para tornar o iframe responsivo */
   .responsive-iframe-container {
      position: relative;
      overflow: hidden;
      padding-top: 56.25%; /* Proporção de 16:9 (altere conforme necessário) */
   }

   .responsive-iframe-container iframe {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
   }
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Começa Aqui -->
<div class="main-content home">
   <div class="container-medium">
    <div class="card">
        <p class="gray">
           <div class="eng-iframe-slot">
               <div iframe-wrapper="" class="iframe-slot">
                  <iframe class="GameFrame scroll-wrapper" data-hj-allow-iframe="true" width="100%" height="100%" style="width: 100% !important; height: 665px !important;" id="gameFrame" src="<?=$urlLinkPlay['gameURL'];?>"></iframe>
               </div>
                  <div class="eng-loading-slot">
                  <div class="w-dyn-list">
                     <div role="list" class="w-dyn-items">
                        <div role="listitem" class="eng-logo-anim w-dyn-item"><img loading="eager" src="<?=$docs_uploads.$dataconfig['logo'];?>" alt="" class="logo-anim"/></div>
                     </div>
                  </div>
               </div>
            </div>
         </p>
    </div>
</div>
<?php include_once('footer.php');?>