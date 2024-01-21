<?php include_once('header.php');?>  
<!-- Começa Aqui -->
<div class="main-content home">
   <div class="container-medium">
	  <div class="main_banner-wrapper mb-24">
         <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                  <?php
                  $count =0;
                  $qry = "SELECT * FROM banner WHERE id ORDER BY id DESC";
                  $res = mysqli_query($mysqli,$qry);
                  if(mysqli_num_rows($res)>0){
                      while($data = mysqli_fetch_assoc($res)){
                        $count++;
                        if($count == 1){
                           $divcdd = "carousel-item active";
                        }else{
                           $divcdd = "carousel-item";
                        }
                  ?>
				  <div class="<?=$divcdd;?>"><img src="<?=$docs_uploads.$data['img'];?>" class="d-block w-100" alt="..."></div>
                  <?php }} ?>
                  </div>
			  <button class="carousel-control-prev" type="button" data-target="#carouselExampleControls" data-slide="prev">
				  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				  <span class="sr-only">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-target="#carouselExampleControls" data-slide="next">
				  <span class="carousel-control-next-icon" aria-hidden="true"></span>
				  <span class="sr-only">Next</span>
			  </button>
		  </div>
	  </div>





            

      <div class="main-sublinks-wrapper">
         <div class="eng-sublinks-2">
            <a href="<?=$cassino_aovivo;?>" class="sublink w-inline-block" data-ix="hover-stroke-sublink">
               <div class="eng-stroke-icon-sublink mb-8">
                  <div class="eng-icon-sublink">
                     <div class="icon-20"></div>
                  </div>
                  <div class="stroke-icon-sublink"></div>
               </div>
               <div class="white">Roletas ao vivo</div>
            </a>
            <a href="<?=$page_cassino;?>" class="sublink w-inline-block" data-ix="hover-stroke-sublink">
               <div class="eng-stroke-icon-sublink mb-8">
                  <div class="eng-icon-sublink">
                     <div class="icon-20"></div>
                  </div>
                  <div class="stroke-icon-sublink"></div>
               </div>
               <div class="white">Cassino</div>
            </a>
            <a href="<?=$cassino_aovivo;?>" class="sublink w-inline-block" data-ix="hover-stroke-sublink">
               <div class="eng-stroke-icon-sublink mb-8">
                  <div class="eng-icon-sublink">
                     <div class="icon-20"></div>
                  </div>
                  <div class="stroke-icon-sublink"></div>
               </div>
               <div class="white">Cassino ao vivo</div>
            </a>
            <a href="<?=$cassino_aovivo;?>" class="sublink w-inline-block" data-ix="hover-stroke-sublink">
               <div class="eng-stroke-icon-sublink mb-8">
                  <div class="eng-icon-sublink">
                     <div class="icon-20"></div>
                  </div>
                  <div class="stroke-icon-sublink"></div>
               </div>
               <div class="white">Blackjack</div>
            </a>
            <a href="<?=$page_cassino;?>" class="sublink w-inline-block" data-ix="hover-stroke-sublink">
               <div class="eng-stroke-icon-sublink mb-8">
                  <div class="eng-icon-sublink">
                     <div class="icon-20"></div>
                  </div>
                  <div class="stroke-icon-sublink"></div>
               </div>
               <div class="white">Bacará</div>
            </a>
            <a href="<?=$page_cassino;?>" class="sublink w-inline-block" data-ix="hover-stroke-sublink">
               <div class="eng-stroke-icon-sublink mb-8">
                  <div class="eng-icon-sublink">
                     <div class="icon-20"></div>
                  </div>
                  <div class="stroke-icon-sublink"></div>
               </div>
               <div class="white">Football Studio</div>
            </a>
            <a href="<?=$page_cassino;?>" class="sublink w-inline-block" data-ix="hover-stroke-sublink">
               <div class="eng-stroke-icon-sublink mb-8">
                  <div class="eng-icon-sublink">
                     <div class="icon-20"></div>
                  </div>
                  <div class="stroke-icon-sublink"></div>
               </div>
               <div class="white">Game Shows</div>
            </a>
            <a href="<?=$page_cassino;?>" class="sublink w-inline-block" data-ix="hover-stroke-sublink">
               <div class="eng-stroke-icon-sublink mb-8">
                  <div class="eng-icon-sublink">
                     <div class="icon-20"></div>
                  </div>
                  <div class="stroke-icon-sublink"></div>
               </div>
               <div class="white">Crash Games</div>
            </a>
         </div>
      </div>
      
        <section id="best" class="main_slots-wrapper">
         <div class="eng-title mb-8">
            <div class="left-title">
               <h4 class="txt-yellow"><i class="fa-solid fa-fire fa-lg"></i></h4>
               <h4 class="white">Populares</h4>
            </div>
            <a href="<?=$painel_afiliado_popular;?>" class="link-more-games w-inline-block">
               <div>Ver todos</div>
               <div class="icon-12 txt-yellow"></div>
            </a>
         </div>
         <div class="w-dyn-list">
            <div fs-cmsfilter-duration="50" fs-cmsload-mode="infinite" class="eng-slots-int _6 w-dyn-items" fs-cmsfilter-tagformat="category" fs-cmsfilter-element="list" role="list" fs-cmssort-element="list" fs-cmsload-element="list" fs-cmsfilter-showquery="true">
                <?php
                  $qry = "SELECT * FROM games WHERE popular=1 ORDER BY RAND() LIMIT 12";
                  $res = mysqli_query($mysqli,$qry);
                  if(mysqli_num_rows($res)>0){
                      while($data = mysqli_fetch_assoc($res)){
               ?>
            
                  <div role="listitem" class="item-game w-dyn-item">
                     <?php if($saldo_data['saldo'] < 1){?>
                        <a href="#" class="link-game w-inline-block" data-ix="hover-play-game" data-toggle="modal" data-target="#saldobaixo">
                     <?php }else{ ?>
                        <a href="<?=$painel_afiliado_ver.$data['provider'].'/'.$data['game_code'];?>" class="link-game w-inline-block" data-ix="hover-play-game">
                      <?php } ?>
                        <img 
                            loading="eager" 
                            img-slot-game="" 
                            src="<?=$data['banner'];?>" 
                            alt="" 
                            class="slot-game" 
                            style="max-width: 520px; max-height: 700px; width: 100%; height: auto;"
                        >
                        <div fs-cmsfilter-field="name" fs-cmssort-field="name" class="name-game"><?=$data['game_name'];?></div>
                        <div fs-cmsfilter-field="name" fs-cmssort-field="name" class="name-game"><?=$data['provider'];?></div>
                     </a>
                  </div>
               <?php }} ?>
            </div>
            <div role="navigation" aria-label="List" class="w-pagination-wrapper pagination"></div>
         </div>
      </section>
        <br><br><br><br><br>
      
        <section class="main_games-wrapper">
         <div class="eng-title mb-8">
            <div class="left-title">
               <h4 class="icon-20 txt-yellow"></h4>
               <h4 class="white">Cassino</h4>
            </div>
            <a href="<?=$painel_afiliado_cassino;?>" class="link-more-games w-inline-block">
               <div>Ver todos</div>
               <div class="icon-12 txt-yellow"></div>
            </a>
         </div>
         <div class="w-dyn-list" style="text-align: center; white-space: nowrap; overflow-x: auto;"> <!-- Defina a largura máxima desejada e permita a rolagem horizontal quando necessário -->
         <div fs-cmsfilter-duration="50" fs-cmsload-mode="infinite" class="eng-slots-int _6 w-dyn-items" fs-cmsfilter-tagformat="category" fs-cmsfilter-element="list" role="list" fs-cmssort-element="list" fs-cmsload-element="list" fs-cmsfilter-showquery="true">
              <?php
                // Selecionar os IDs dos jogos populares
                $qry_populares = "SELECT id FROM games WHERE popular = 1 ORDER BY RAND() LIMIT 12";
                $res_populares = mysqli_query($mysqli, $qry_populares);
                
                // Extrair os IDs dos jogos populares
                $ids_populares = [];
                while ($data_populares = mysqli_fetch_assoc($res_populares)) {
                    $ids_populares[] = $data_populares['id'];
                }
                
                // Selecionar os IDs dos jogos da qry3
                $qry3 = "SELECT id FROM games WHERE provider='Evolution' ORDER BY RAND() LIMIT 18";
                $res3 = mysqli_query($mysqli, $qry3);
                
                // Extrair os IDs dos jogos da qry3
                $ids_qry3 = [];
                while ($data_qry3 = mysqli_fetch_assoc($res3)) {
                    $ids_qry3[] = $data_qry3['id'];
                }
                
                // Unir os IDs dos jogos populares e da qry3
                $ids_excluir = array_merge($ids_populares, $ids_qry3);
                
                // Selecionar 36 jogos excluindo os jogos populares e da qry3
                $qry2 = "SELECT * FROM games WHERE id NOT IN (" . implode(',', $ids_excluir) . ") ORDER BY RAND() LIMIT 36";
                $res2 = mysqli_query($mysqli, $qry2);
                 if(mysqli_num_rows($res2)>0){
                     while($data2 = mysqli_fetch_assoc($res2)){
              ?>
                 <div role="listitem" class="item-game2 w-dyn-item" style="display: inline-block; margin-right: 10px;">
                    <?php if($saldo_data['saldo'] < 1){?>
                       <a href="#" class="link-game w-inline-block" data-ix="hover-play-game" data-toggle="modal" data-target="#saldobaixo">
                    <?php }else{ ?>
                       <a href="<?=$painel_afiliado_ver.$data2['provider'].'/'.$data2['game_code'];?>" class="link-game w-inline-block" data-ix="hover-play-game">
                    <?php } ?>
                       <img 
                            loading="eager" 
                            img-slot-game="" 
                            src="<?=$data2['banner'];?>" 
                            alt="" 
                            class="slot-game2"
                        >
                       <div fs-cmsfilter-field="name" fs-cmssort-field="name" class="name-game"><?=$data2['game_name'];?></div>
                       <div fs-cmsfilter-field="name" fs-cmssort-field="name" class="name-game"><?=$data2['provider'];?></div>
                    </a>
                 </div>
              <?php }} ?>
           </div>
        </div>

      </section>
        <br><br><br><br><br>
        
        <section id="casino" class="main_slots-wrapper">
         <div class="eng-title mb-8">
            <div class="left-title">
               <h4 class="icon-20 txt-yellow"></h4>
               <h4 class="white">Cassino ao vivo</h4>
            </div>
            <a href="<?=$painel_afiliado_aovivo;?>" class="link-more-games w-inline-block">
               <div>Ver todos</div>
               <div class="icon-12 txt-yellow"></div>
            </a>
         </div>
         <div class="w-dyn-list" style="text-align: center; white-space: nowrap; overflow-x: auto;"> <!-- Defina a largura máxima desejada e permita a rolagem horizontal quando necessário -->
         <div fs-cmsfilter-duration="50" fs-cmsload-mode="infinite" class="eng-slots-int _6 w-dyn-items" fs-cmsfilter-tagformat="category" fs-cmsfilter-element="list" role="list" fs-cmssort-element="list" fs-cmsload-element="list" fs-cmsfilter-showquery="true">
              <?php
              
                 $qry2 = "SELECT * FROM games WHERE provider='Evolution' ORDER BY RAND() LIMIT 18";
                 $res2 = mysqli_query($mysqli,$qry2);
                 if(mysqli_num_rows($res2)>0){
                     while($data2 = mysqli_fetch_assoc($res2)){
              ?>
                 <div role="listitem" class="item-game w-dyn-item">
                    <?php if($saldo_data['saldo'] < 1){?>
                       <a href="#" class="link-game w-inline-block" data-ix="hover-play-game" data-toggle="modal" data-target="#saldobaixo">
                    <?php }else{ ?>
                       <a href="<?=$painel_afiliado_ver.$data2['provider'].'/'.$data2['game_code'];?>" class="link-game w-inline-block" data-ix="hover-play-game">
                    <?php } ?>
                       <img 
                           loading="eager" 
                           img-slot-game="" 
                           src="<?=$data2['banner'];?>" 
                           alt="" 
                           class="slot-game" 
                           style="max-width: 410px; max-height: 410px; width: 100%; height: auto;"
                       >
                       <div fs-cmsfilter-field="name" fs-cmssort-field="name" class="name-game"><?=$data2['game_name'];?></div>
                       <div fs-cmsfilter-field="name" fs-cmssort-field="name" class="name-game"><?=$data2['provider'];?></div>
                    </a>
                 </div>
              <?php }} ?>
           </div>
        </div>

      </section>
        <br><br><br><br><br>
     
     
     <div class="main_providers-wrapper mb-32">
         <div class="eng-title">
            <div class="left-title">
               <h4 class="icon-20 txt-yellow"></h4>
               <h4 class="white">Provedores</h4>
            </div>
            <a href="<?=$page_cassino;?>" class="link-more-games w-inline-block">
               <div>Ver todos</div>
               <div class="icon-12 txt-yellow"></div>
            </a>
         </div>
         <div class="providers_marquee-animate">
            <div class="providers_marquee-wrapper">
               <div class="w-dyn-list" data-ix="slide-providers" style="transition: transform 45000ms linear 0s; transform: translateX(-100%) translateY(0px);">
                  <div role="list" class="slide_providers-wrapper w-dyn-items">
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/64d0f7c4aa7b77d2dafad666_hacksaw_logo.webp" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/64c2a7062d9b857b8b922c90_originale-logo%2010.19.05.svg" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e1a3dcf2053b25ce86_6467c127e7ec8a63d5fe8fc0_6462efc30b20c32f44268638_64306dda92ccec2bad06c2cf_smartsoft_logo.webp" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e15324ef534b53be9c_6467c1282e70575069ff92dc_6462efc30b20c32f44268658_64305dad5c31585f86bde61e_spribe-logo.svg" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#s" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e1d2d5dd77dbd85fcd_6467c129c29c3a41815fc13a_6464ff293c2fce9b02765c54_turbo_games_logo.webp" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e06bff1a3a6f0c4142_6483573cb9f4c96d173ae194_pgsoft_logo.webp" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e03bdb661f627e3a69_6467c128c29c3a41815fc059_6462efc30b20c32f4426868e_64304b388d4e76c1ec12f4b6_pragmaticplay.webp" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e0841d2b143a9b25c5_6467c127511e8adc134ba77b_6462efc30b20c32f442686b4_onlyplay_logo.webp" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e0cc8b3453297680ab_6467c1274f92cff27285e5c0_6462efc30b20c32f44268691_64306dce9b3f2e5b1f274168_belatra_logo.webp" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e0841d2b143a9b2513_6467c12720bde25bd0b5676f_6462efc30b20c32f44268616_64306dee11af0d16597fa258_ezugi_logo.webp" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e06bff1a3a6f0c4050_6467c12770ea9fec4cefad60_6462efc30b20c32f442686b3_64306de1141c5b7d71f7013e_bgaming_logo.webp" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e06bff1a3a6f0c404d_6467c12761aea91fe8104131_6462efc30b20c32f4426868f_evolution_logo.webp" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e08dbd81f644609f61_6467c127c29c3a41815fbf0c_64668b5673c1e16f3017f61f_caleta_logo.webp" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e0d2d5dd77dbd85f05_6467c1275a178810791a07a4_6462efc30b20c32f44268690_64306dc511af0d5c527f9bc8_evoplay_logo.webp" class="logo-provider"></a></div>
                  </div>
               </div>
               <div class="w-dyn-list" data-ix="slide-providers" style="transition: transform 45000ms linear 0s; transform: translateX(-100%) translateY(0px);">
                  <div role="list" class="slide_providers-wrapper w-dyn-items">
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/64d0f7c4aa7b77d2dafad666_hacksaw_logo.webp" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/64c2a7062d9b857b8b922c90_originale-logo%2010.19.05.svg" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e1a3dcf2053b25ce86_6467c127e7ec8a63d5fe8fc0_6462efc30b20c32f44268638_64306dda92ccec2bad06c2cf_smartsoft_logo.webp" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e15324ef534b53be9c_6467c1282e70575069ff92dc_6462efc30b20c32f44268658_64305dad5c31585f86bde61e_spribe-logo.svg" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e1d2d5dd77dbd85fcd_6467c129c29c3a41815fc13a_6464ff293c2fce9b02765c54_turbo_games_logo.webp" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e06bff1a3a6f0c4142_6483573cb9f4c96d173ae194_pgsoft_logo.webp" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e03bdb661f627e3a69_6467c128c29c3a41815fc059_6462efc30b20c32f4426868e_64304b388d4e76c1ec12f4b6_pragmaticplay.webp" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e0841d2b143a9b25c5_6467c127511e8adc134ba77b_6462efc30b20c32f442686b4_onlyplay_logo.webp" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e0cc8b3453297680ab_6467c1274f92cff27285e5c0_6462efc30b20c32f44268691_64306dce9b3f2e5b1f274168_belatra_logo.webp" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e0841d2b143a9b2513_6467c12720bde25bd0b5676f_6462efc30b20c32f44268616_64306dee11af0d16597fa258_ezugi_logo.webp" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e06bff1a3a6f0c4050_6467c12770ea9fec4cefad60_6462efc30b20c32f442686b3_64306de1141c5b7d71f7013e_bgaming_logo.webp" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e06bff1a3a6f0c404d_6467c12761aea91fe8104131_6462efc30b20c32f4426868f_evolution_logo.webp" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e08dbd81f644609f61_6467c127c29c3a41815fbf0c_64668b5673c1e16f3017f61f_caleta_logo.webp" class="logo-provider"></a></div>
                     <div role="listitem" class="w-dyn-item"><a href="#" class="eng-item-provider w-inline-block"><img loading="eager" alt="" src="https://assets.website-files.com/6483631a773f6af2b4edabee/648482e0d2d5dd77dbd85f05_6467c1275a178810791a07a4_6462efc30b20c32f44268690_64306dc511af0d5c527f9bc8_evoplay_logo.webp" class="logo-provider"></a></div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

    <style>
        .eng-slots-int {
            justify-content: center; /* Adicionando a propriedade para centralizar */
        }
    
        .item-game2 {
            margin: 5px;
        }
    
        .slot-game2 {
            width: 100%;
            height: auto;
            max-width: 300px;
            max-height: 200px;
        }
   </style>
   <script>
        window.addEventListener('load', function () {
            var preloader = document.getElementById('preloader');
            var content = document.getElementById('content');

            setTimeout(function() {
                preloader.style.display = 'none';
                content.style.display = 'block';
            }, 5000);
        });
    </script>
	


<?php include_once('footer.php');?>