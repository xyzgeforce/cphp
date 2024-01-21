<?php include_once('header.php');?>  
<!-- Começa Aqui -->
<div class="main-content home">
   <div class="container-medium">
      <section class="main_slots-wrapper">
         <div class="eng-title mb-8">
            <div class="left-title">
               <h4 class="icon-20 txt-yellow"></h4>
               <h4 class="white">Cassino</h4>
            </div>
         </div>
         <div class="w-dyn-list">
            <div fs-cmsfilter-duration="50" fs-cmsload-mode="infinite" class="eng-slots-int _6 w-dyn-items" fs-cmsfilter-tagformat="category" fs-cmsfilter-element="list" role="list" fs-cmssort-element="list" fs-cmsload-element="list" fs-cmsfilter-showquery="true">
               <?php
                  $qry = "SELECT * FROM games WHERE id ORDER BY RAND() LIMIT 150";
                  $res = mysqli_query($mysqli,$qry);
                  if(mysqli_num_rows($res)>0){
                      while($data = mysqli_fetch_assoc($res)){
               ?>
            
                  <div role="listitem" class="item-game w-dyn-item">
                     <a href="#" class="link-game w-inline-block" data-ix="hover-play-game" data-toggle="modal" data-target="#entrarModal"> 
                        <img 
                           loading="eager" 
                           img-slot-game="" 
                           src="<?=$data['banner'];?>" 
                           alt="" 
                           class="slot-game" 
                           style="max-width: 410px; max-height: 410px; width: 100%; height: auto;"
                        >
                        <div fs-cmsfilter-field="name" fs-cmssort-field="name" class="name-game"><?=$data['game_name'];?></div>
                        <div fs-cmsfilter-field="name" fs-cmssort-field="name" class="name-game"><?=$data['provider'];?></div>
                     </a>
                  </div>
               <?php }} ?>
            </div>
         </div>
      </section>
      
   </div>
<?php include_once('footer.php');?>