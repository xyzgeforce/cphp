<?php
   session_start();
   include_once("sys/conexao.php");
   include_once("sys/funcao.php");
   include_once("sys/crud.php");
   include_once("sys/CSRF_Protect.php");
   include_once("sys/pega-ip.php");
   $csrf = new CSRF_Protect();
   #captura refer =========================================================#
   if(isset($_GET['ref']) && !empty($_GET['ref'])){
      $refer = PHP_SEGURO($_GET['ref']);
      if(pegar_refer($refer) == 1){
         $_SESSION['CAP_REFER'] = $refer;
      }else{
         $_SESSION['CAP_REFER'] = $refer_padrao;  // conta master
      }
   }else{
       $_SESSION['CAP_REFER'] = $refer_padrao;  // conta master 
   }
   #==================================================================#
   $url_atual =(isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
   #==================================================================#
   //INSERT DE VISITAS NAS LPS
	$data_hoje = date("Y-m-d");
    $hora_hoje = date("H:i:s");
	if(isset($_SERVER['HTTP_REFERER'])){
      $ref =  $_SERVER['HTTP_REFERER'];
	}else{
      $ref = $url_atual;
	} 
	if($browser != "Unknown Browser	" AND $os != "Unknown OS Platform"){
        include_once("sys/ip-crawler.php");
        $data_us = ip_F($ip);
        $id_user_ret = busca_id_por_refer($_SESSION['CAP_REFER']);
        
		$sql0 = $mysqli->prepare("SELECT ip_visita FROM visita_site WHERE data_cad=? AND ip_visita=?");
		$sql0->bind_param("ss", $data_hoje,$ip);
		$sql0->execute();
		$sql0->store_result();
		if($sql0->num_rows) {//JÁ EXISTE CAD 
		}else{
			$sql = $mysqli->prepare("INSERT INTO visita_site (nav_os,mac_os,ip_visita,refer_visita,data_cad,hora_cad,id_user,pais,cidade,estado) VALUES (?,?,?,?,?,?,?,?,?,?)");
			$sql->bind_param("ssssssssss",$browser,$os,$ip,$ref,$data_hoje,$hora_hoje,$id_user_ret,$data_us['pais'],$data_us['cidade'],$data_us['regiao']);
			$sql->execute(); 
		}
   }
   #===============================================================================#  
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
      <meta charset="utf-8"/>
      <title><?=$dataconfig['nome_site'];?></title>
      <meta content="<?=$dataconfig['nome_site'];?>" property="og:title"/>
      <meta content="<?=$dataconfig['nome_site'];?>" property="twitter:title"/>
      <meta property="og:description" content="<?=$dataconfig['descricao'];?>">
      <meta property="twitter:description" content="<?=$dataconfig['descricao'];?>">
      <meta content="width=device-width, initial-scale=1" name="viewport"/>
      <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests" />
      
      <link rel="manifest" href="<?=$url_base;?>manifest.json">
      <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
      <link href="<?=$docs_uploads.$dataconfig['favicon'];?>" rel="shortcut icon" type="image/x-icon"/>
      <link href="<?=$docs_uploads.$dataconfig['favicon'];?>" rel="apple-touch-icon"/>
      <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
      <meta name="theme-color" content="#141417" />
      
      <link rel="stylesheet" href="<?=$docs_site;?>css/webflow-style-head-v2.css">
      <script async src="<?=$docs_site;?>js/cmsfilter.js"></script>
      <script async src="<?=$docs_site;?>js/cmssort.js"></script>
      <script async src="<?=$docs_site;?>js/cmsload.js"></script>
      <script defer src="<?=$docs_site;?>js/scrolldisable.js"></script>
      <script type="text/javascript" src="<?=$docs_site;?>js/jquery-3.5.0.min.js"></script>
      <script src="https://kit.fontawesome.com/6728d0711b.js" crossorigin="anonymous"></script>
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
      <link href="<?=$docs_site;?>css/app-front.css" rel="stylesheet" type="text/css"/>  
      <link href="<?=$docs_site;?>css/app.css" rel="stylesheet" type="text/css"/>  
	  
      <style>
         :root{
            --default:<?=$dataconfig['cor_padrao'];?>;
            --black:#141417;
            --black-25:rgba(0,0,0,.25);
            --white-50:rgba(255,255,255,.3);
            --gray100:white;
            --yellow:<?=$dataconfig['cor_padrao'];?>;
            --white-5:rgba(218,209,177,.05);
            --white-10:rgba(218,209,177,.1);
            --orange:<?=$dataconfig['cor_padrao'];?>;
            --black-80:rgba(20,20,23,.9);
            --yellow10:rgba(227,45,71,.1);
            --slate-blue:rgba(227,45,71,.5);
            --white-2:rgba(218,209,177,.02);
            --black-50:rgba(0,0,0,.5);
            --green-yellow:#6cab36;
            --211b38:#1b1b1f;
            --yellow25:rgba(227,45,71,.25);
            --olive-drab:#3f7f41;
            --lime:rgba(227,45,71,.25)
        }
        .notify-popup {
             padding: 0 10px;
             display: flex;
             flex-direction: row;
             align-items: center;
             justify-content: space-between;
             z-index: 9999;
             position: absolute;
             top: 0;
             left: 0;
             min-height: 40px;
             max-height: 40px;
             width: 100%;
             background-color: <?=$dataconfig['cor_topheader'];?>;
             color: #242e22;
         }
         @media (max-width: 767.98px)
         .notify-popup span {
             font-size: 12px;
         }
         
         .notify-popup button {
             padding: 2px 20px;
             background-color: #fff;
             color: #5f6af2;
             border: 2px solid transparent;
             text-decoration: none;
             transition: all 0.5s ease;
             font-size: 14px;
             font-weight: 600;
             border-radius: 4px;
             cursor: pointer;
             margin-left: 10px;
         }
        
      </style>
      <!-- META TAGS CP SOCIAL -->
      <meta property="og:title" content="<?=$dataconfig['nome_site'];?>" />
      <meta property="og:type" content="website" />
      <meta property="og:url" content="<?=$url_base;?>" />
      <meta property="og:image" content="<?=$docs_uploads.$dataconfig['img_seo'];?>" />
      <meta property="og:description" content="<?=$dataconfig['descricao'];?>" />

      
      <meta name="twitter:card" content="summary" />
      <meta name="twitter:creator" content="CODECASSINOS" />
      <meta name="twitter:title" content="<?=$dataconfig['nome_site'];?>" />
      <meta name="twitter:image" content="<?=$docs_uploads.$dataconfig['img_seo'];?>" /> 
      <meta name="twitter:description" content="<?=$dataconfig['descricao'];?>" />
      
   </head>
   <body>
   
      <div id="<?=$url_base;?>" class="base_url"></div>
      <section id="page-wrapper" class="page-wrapper">
         <?php if($dataconfig['status_topheader'] == 1){ ?>
          <div class="d-flex"><!---->
             <div class="notify-popup visible-popup">
               <div></div> 
               <div style="display: flex; flex-direction: row; align-items: center;">
                  <span>Convide um amigo e ganhe R$<?=Reais2($data_afiliados_cpa_rev['cpaLvl1']);?> por cada indicado!</span> <button data-toggle="modal" data-target="#cadastroModal">Convidar</button>
               </div> 
               <svg fill="none" height="20" viewBox="0 0 24 24" width="20" xmlns="http://www.w3.org/2000/svg"><path clip-rule="evenodd" d="m6.29289 6.29289c.39053-.39052 1.02369-.39052 1.41422 0l3.93929 3.93931c.1953.1953.5119.1953.7072 0l3.9393-3.93931c.3905-.39052 1.0237-.39052 1.4142 0 .3905.39053.3905 1.02369 0 1.41422l-3.9393 3.93929c-.1953.1953-.1953.5119 0 .7072l3.9393 3.9393c.3905.3905.3905 1.0237 0 1.4142s-1.0237.3905-1.4142 0l-3.9393-3.9393c-.1953-.1953-.5119-.1953-.7072 0l-3.93929 3.9393c-.39053.3905-1.02369.3905-1.41422 0-.39052-.3905-.39052-1.0237 0-1.4142l3.93931-3.9393c.1953-.1953.1953-.5119 0-.7072l-3.93931-3.93929c-.39052-.39053-.39052-1.02369 0-1.41422z" fill="#fff" fill-rule="evenodd"></path></svg>
            </div>
         </div>
         <br/><br/><br/>
         <?php } ?>
         <nav id="menu" class="content-navbar">
            <div class="navbar_wrapper">
               <div class="navbar-left">
                  <div class="w-dyn-list">
                     <div role="list" class="w-dyn-items">
                        <div role="listitem" class="w-dyn-item">
                           <a href="<?=$url_base;?>" class="navbar_brand w-inline-block">
                              <div class="brand_type-wrapper"><img loading="lazy" alt="" src="<?=$docs_uploads.$dataconfig['logo'];?>" class="ico-brand-type header"/></div>
                           </a>
                           <link rel="prerender" href="<?=$url_base;?>"/>
                        </div>
                     </div>
                  </div>
               </div>
			 
                <div class="navbar-buttons-login-wrapper">
					<a fs-scrolldisable-element="disable" href00="#" class="btn-small w-button" data-toggle="modal" data-target="#entrarModal">Entrar</a>
				  	<a fs-scrolldisable-element="disable" href="#" class="btn-small btn-color-1 w-button" data-toggle="modal" data-target="#cadastroModal">Cadastrar</a>
				</div>
            </div>
         </nav>
        
        <div class="main-wrapper">
            <div class="left-side-bar" id="left-side-bar">
               <div class="left-side-bar_page-padding">
                  <div class="left-side_sticky-wrapper">
                     <div class="eng-superior-menu">
                        <div class="left-side-bar_navigation-wrapper">
                           <div class="eng-sublinks-nav">
                              <a href="#" class="btn-small btn-color-1 mobile w-inline-block" data-ix="window-deposit"  data-toggle="modal" data-target="#entrarModal">
                                 <div class="content-btn">
                                    <div class="icon-20">+</div>
                                    <div>Depositar</div>
                                 </div>
                              </a>
                              <a href="<?=$url_base;?>" class="sublink-nav w-inline-block">
                                 <div class="content-sublink-menu">
                                    <div class="icon-20 fixed-width"></div>
                                    <div>Início</div>
                                 </div>
                              </a>
                              
                              <a href="<?=$indique;?>" class="sublink-nav w-inline-block">
                                 <div class="content-sublink-menu">
                                    <div class="icon-20 fixed-width"></div>
                                    <div>Indique e Ganhe</div>
                                 </div>
                              </a>
                              <a href="<?=$page_cassino;?>" class="sublink-nav w-inline-block">
                                 <div class="content-sublink-menu">
                                    <div class="icon-20 fixed-width"></div>
                                    <div>Todos os jogos</div>
                                 </div>
                              </a>
                              
                           </div>
                           <div class="line-divisor-nav"></div>
                           <div class="eng-sublinks-nav">
                              <div data-hover="false" data-delay="0" class="dropdown-menu w-dropdown">
                                 <div class="dropdown-toogle-menu w-dropdown-toggle" data-ix="dropdown-menu">
                                    <a href="#" class="sublink-nav with-arrow btn-color-1 w-inline-block">
                                       <div class="content-sublink-menu space-between">
                                          <div class="eng-left-sublink-menu">
                                             <div class="icon-20 fixed-width"></div>
                                             <div>Populares</div>
                                          </div>
                                          <div class="arrow-drop-menu active"></div>
                                       </div>
                                    </a>
                                 </div>
                                 <nav class="dropdown-list-menu w-dropdown-list" data-ix="initiate-dropdown-list">
                                    <div class="w-dyn-list">
                                       <div role="list" class="list-links-menu mt-8 w-dyn-items">
                                          <div role="listitem" class="w-dyn-item">
                                             <a href="#" class="link-menu w-inline-block" data-toggle="modal" data-target="#entrarModal">
                                                <div class="content-sublink-menu">
                                                   <img src="https://static.springbuilder.site/fs/userFiles-v2/moovbet-18748220/images/4977-fortune-ox-16934358641096.webp" loading="lazy" alt="" class="icon-sublink-game"/>
                                                   <div class="text-size-small short">Fortune Ox</div>
                                                </div>
                                             </a>
                                          </div>
                                          <div role="listitem" class="w-dyn-item">
                                             <a href="#" class="link-menu w-inline-block" data-toggle="modal" data-target="#entrarModal">
                                                <div class="content-sublink-menu">
                                                   <img src="https://assets.website-files.com/6483631a773f6af2b4edabee/64891b10c0a2086ed39a2db2_6489193dd93afd96335f9202_6483d7003cbfcd23c72d4095_648357caafb883b2444bd689_fortune_tiger_icon.webp" loading="lazy" alt="" class="icon-sublink-game"/>
                                                   <div class="text-size-small short">Fortune Tiger</div>
                                                </div>
                                             </a>
                                          </div>
                                             <div role="listitem" class="w-dyn-item">
                                             <a href="#" class="link-menu w-inline-block" data-toggle="modal" data-target="#entrarModal">
                                                <div class="content-sublink-menu">
                                                   <img src="https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11354.png" loading="lazy" alt="" class="icon-sublink-game"/>
                                                   <div class="text-size-small short">Fortune Rabbit</div>
                                                </div>
                                             </a>
                                          </div>
                                       
                                       </div>
                                    </div>
                                    <div class="list-links-menu mt-8">
                                       <a href="<?=$popular;?>" class="link-menu w-inline-block">
                                          <div class="content-sublink-menu space-between">
                                             <div>Ver todos</div>
                                             <div class="icon-12 txt-yellow"></div>
                                          </div>
                                       </a>
                                    </div>
                                 </nav>
                              </div>
                              <a href="<?=$cassino_aovivo;?>" class="sublink-nav btn-color-1 w-inline-block">
                                 <div class="content-sublink-menu">
                                    <div class="icon-20 fixed-width"></div>
                                    <div>Roletas</div>
                                 </div>
                              </a>
                              <a href="<?=$page_cassino;?>" aria-current="page" class="sublink-nav btn-color-1 w-inline-block w--current">
                                 <div class="content-sublink-menu">
                                    <div class="icon-20 fixed-width"></div>
                                    <div>Cassino</div>
                                 </div>
                              </a>
                              <a href="<?=$cassino_aovivo;?>" class="sublink-nav btn-color-1 w-inline-block">
                                 <div class="content-sublink-menu">
                                    <div class="icon-20 fixed-width"></div>
                                    <div>Cassino Ao vivo</div>
                                 </div>
                              </a>
                           </div>
                           <div class="line-divisor-nav"></div>
                           <div class="eng-sublinks-nav">
                              <a open-support-btn="" href=" " class="sublink-nav w-inline-block">
                                 <div class="content-sublink-menu">
                                    <div class="icon-20 fixed-width"></div>
                                    <div>Suporte</div>
                                 </div>
                              </a>
                           </div>
                           <div class="eng-copyright-menu mt-16">
                              <div class="eng-support-menu">
                                 <div class="eng-social-menu">
                                   
                                  
                                  
                                  
                                  
                                   
                                    
                                 </div>
                              </div>
                              <div class="txt-label copyright"><?=$dataconfig['descricao'];?>  © <?=date('Y');?>. Todos os direitos reservados.</div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>

            <div class="navbar-mobile custom-navbar">
               <a href="#" class="link-menu-mobile w-inline-block" data-toggle="modal" data-target="#exampleModal">
                  <div class="icon-16 mb-2"></div>
                  <div class="white">Menu</div>
               </a>
               <a href="<?=$cassino_aovivo;?>" class="link-menu-mobile w-inline-block">
                  <div class="icon-16 mb-2"></div>
                  <div class="white">Ao vivo</div>
               </a>

               <a href="<?=$page_cassino;?>" class="link-menu-mobile w-inline-block">
                  <div class="icon-16 mb-2"></div>
                  <div class="white">Cassino</div>
               </a>
            </div>

            <style>
               #logo {
                  max-width: 350px; /* Defina o tamanho da sua logo */
               }
            </style>
       