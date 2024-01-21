<?php
   session_start();
   include_once("../sys/conexao.php");
   include_once("../sys/funcao.php");
   include_once("../sys/crud.php");
   include_once("../sys/CSRF_Protect.php");
   $csrf = new CSRF_Protect();
   #======================================#
   include_once('../sys/checa_login_user.php');
   #expulsa user
   checa_login_user();
   $saldo_data = saldo_user($_SESSION['data_user']['id']);
   #======================================#
   if(isset($_POST['query']) AND !empty($_POST['query'])){
      $buscar = PHP_SEGURO($_POST['query']);
      $sql = "SELECT * FROM games WHERE game_name LIKE '%$buscar%'";
      $res = mysqli_query($mysqli,$sql);
      if(mysqli_num_rows($res)>0){?>
         <section id="best" class="main_slots-wrapper">
         <div class="eng-title mb-8">
            <div class="left-title">
               <h4 class="txt-yellow"><i class="fas fa-check-circle fa-lg"></i></h4>
               <h4 class="white">Games Encontrados</h4>
            </div>
         </div>
         <div class="w-dyn-list">
            <div fs-cmsfilter-duration="50" fs-cmsload-mode="infinite" class="eng-slots-int _6 w-dyn-items" fs-cmsfilter-tagformat="category" fs-cmsfilter-element="list" role="list" fs-cmssort-element="list" fs-cmsload-element="list" fs-cmsfilter-showquery="true">
               <?php while($data = mysqli_fetch_assoc($res)){ ?>
                  <div role="listitem" class="item-game w-dyn-item">
                     <?php if($saldo_data['saldo'] < 1){?>
                        <a href="#" class="link-game w-inline-block" data-ix="hover-play-game" data-toggle="modal" data-target="#saldobaixo">
                     <?php }else{ ?>
                        <a href="<?=$painel_afiliado_ver.$data['provider'].'/'.$data['game_code'];?>" class="link-game w-inline-block" data-ix="hover-play-game">
                      <?php } ?>
                        <img loading="eager" img-slot-game="" src="<?=$data['banner'];?>" alt="" class="slot-game" width="200" height="175">
                        <div fs-cmsfilter-field="name" fs-cmssort-field="name" class="name-game"><?=$data['game_name'];?></div>
                        <div fs-cmsfilter-field="name" fs-cmssort-field="name" class="name-game"><?=$data['provider'];?></div>
                     </a>
                  </div>
               <?php } ?>
            </div>
            <div role="navigation" aria-label="List" class="w-pagination-wrapper pagination"></div>
         </div>
      </section>
   <?php  }else{
          echo '<section id="best" class="main_slots-wrapper"><div class="alert alert-warning " role="alert"><i class="fas fa-exclamation-circle"></i> Nenhum game foi encontrado.
            </div>';
      }
   }
   
   
   
   
   
?>