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
   #======================================#
   $saldo_data = saldo_user($_SESSION['data_user']['id']);
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
      <meta charset="utf-8"/>
      <meta name="theme-color" content="#0003c6">
      <title><?=$dataconfig['nome_site'];?></title>
      <meta content="<?=$dataconfig['nome_site'];?>" property="og:title"/>
      <meta content="<?=$dataconfig['nome_site'];?>" property="twitter:title"/>
      <meta property="og:description" content="<?=$dataconfig['descricao'];?>">
      <meta property="twitter:description" content="<?=$dataconfig['descricao'];?>">
      <meta content="width=device-width, initial-scale=1" name="viewport"/>
      
      <link rel="manifest" href="<?=$url_base;?>manifest.json">
      <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
      <link href="<?=$docs_uploads.$dataconfig['favicon'];?>" rel="shortcut icon" type="image/x-icon"/>
      <link href="<?=$docs_uploads.$dataconfig['favicon'];?>" rel="apple-touch-icon"/>
      <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
      <meta name="theme-color" content="#141417" />
      
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
             color: #fff;
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
      <style>
        #mensagem {
            margin-top: 10px;
            padding: 10px;
            font-size: 14px;
            text-color: #5f6af2;
            display: none;
        }
    </style>
      <style>
         @keyframes fa-pisca {
              0% { opacity: 1; }
              50% { opacity: 0.5; }
              100% { opacity: 0; }
          }
         .fa-pisca {
            -webkit-animation: fa-pisca .75s linear infinite;
            -moz-animation: fa-pisca .75s linear infinite;
            -ms-animation: fa-pisca .75s linear infinite;
            -o-animation: fa-pisca .75s linear infinite;
            animation: fa-pisca .75s linear infinite;
         }
      </style>
   
   
   </head>
   <body>
      <div id="<?=$painel_user;?>" class="base_url"></div>
      <section id="page-wrapper" class="page-wrapper">
         <nav id="menu" class="content-navbar">
         
            <div class="navbar_wrapper">
               <div class="navbar-left">
                  <div class="w-dyn-list">
                     <div role="list" class="w-dyn-items">
                        <div role="listitem" class="w-dyn-item">
                           <a href="<?=$painel_user;?>" class="navbar_brand w-inline-block">
                              <div class="brand_type-wrapper"><img loading="lazy" alt="" src="<?=$docs_uploads.$dataconfig['logo'];?>" class="ico-brand-type header"/></div>
                           </a>
                           <link rel="prerender" href="<?=$painel_user;?>"/>
                        </div>
                     </div>
                  </div>
               </div>
                  <div class="navbar-buttons-balance-wrapper">
                  <div data-hover="true" data-delay="0" class="w-dropdown">
                     <div class="balance-info w-dropdown-toggle" id="w-dropdown-toggle-0" aria-controls="w-dropdown-list-0" aria-haspopup="menu" aria-expanded="false" role="button" tabindex="0">
                        <div class="gray txt-label">Saldo Atual</div>
                        <div class="txt-balance-original">
                           <div class="flex-horizontal white">
                              <h4 class="green mr-8">R$</h4>
                              <h4 id="balance"><?=Reais2($saldo_data['saldo']);?></h4>
                           </div>
                        </div>
                     </div>
                  </div>
                  <a href="#" class="btn-small btn-color-1 w-button" data-toggle="modal" data-target="#modalDeposito"><span class="icon-20 no-mobile">+</span> <span>Depositar</span></a>
                  <div class="dropdown">
                     <button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
                     <div class="eng-letter-name no-mobile">
                        <div class="letter-name"></div>
                     </div>
                     </button>
                     <div class="dropdown-menu">
                     <nav class="drop-list-menu w-dropdown-list w--open" id="w-dropdown-list-1" aria-labelledby="w-dropdown-toggle-1">
                        <a href="<?=$painel_minhaconta;?>" aria-current="page" class="eng-info-account w-inline-block w--current" tabindex="0">
                           <div class="icon-16 fixed-width-24"></div>
                           <div class="info-account">
                              <div class="txt-label white no-wrap"><?=$_SESSION['data_user']['nome'];?></div>
                              <div class="txt-label no-wrap"><?=$_SESSION['data_user']['email'];?></div>
                           </div>
                        </a>
                        <a fs-scrolldisable-element="disable" href="#" class="link-drop w-inline-block" data-toggle="modal" data-target="#modalDeposito" tabindex="0">
                           <div class="icon-16 fixed-width-24"></div>
                           <div>Depositar</div>
                        </a>
                        <a fs-scrolldisable-element="disable" href="#" class="link-drop w-inline-block" data-toggle="modal" data-target="#modalSaque" tabindex="0">
                           <div class="icon-16 fixed-width-24"></div>
                           <div>Sacar</div>
                        </a>
                         <a fs-scrolldisable-element="disable" href="#" class="link-drop w-inline-block" data-toggle="modal" data-target="#modalSaque-afiliados" tabindex="0">
                           <div class="fa fa-users fixed-width-24"></div>
                           <div>Sacar Afiliados</div>
                        </a>
                        <a id="logout-btn" href="<?=$painel_sair;?>" class="link-drop color-1 w-inline-block" tabindex="0">
                           <div class="icon-16 fixed-width-24"></div>
                           <div>Sair</div>
                        </a>
                     </nav>
                     </div>
                     </div>
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
                              <a href="#" class="btn-small btn-color-1 mobile w-inline-block" data-ix="window-deposit">
                                 <div class="content-btn">
                                    <div class="icon-20">+</div>
                                    <div>Depositar</div>
                                 </div>
                              </a>
                              <a href="<?=$painel_user;?>" class="sublink-nav w-inline-block">
                                 <div class="content-sublink-menu">
                                    <div class="icon-20 fixed-width"></div>
                                    <div>Início</div>
                                 </div>
                              </a>
                              <a href="<?=$painel_minhaconta;?>" class="sublink-nav w-inline-block">
                                 <div class="content-sublink-menu">
                                    <div class="icon-20 fixed-width"></div>
                                    <div>Minha Conta</div>
                                 </div>
                              </a>
                              <a href="<?=$painel_afiliado;?>" class="sublink-nav w-inline-block">
                                 <div class="content-sublink-menu">
                                    <div class="icon-20 fixed-width"></div>
                                    <div>Indique e Ganhe</div>
                                 </div>
                              </a>   

                              <a href="<?=$painel_afiliado_historico_de_saque;?>" class="sublink-nav w-inline-block">
                                 <div class="content-sublink-menu">
                                    <div class="icon-20 fixed-width"></div>
                                    <div>Histórico de Saques</div>
                                 </div>
                              </a> 
                              <a href="<?=$painel_afiliado_bonus_historico;?>" class="sublink-nav w-inline-block">
                                 <div class="content-sublink-menu">
                                    <div class="icon-20 fixed-width"></div>
                                    <div>Histórico de Bônus</div>
                                 </div>
                              </a> 
                              <a href="<?=$painel_afiliado_hist_depositos;?>" class="sublink-nav w-inline-block">
                                 <div class="content-sublink-menu">
                                    <div class="icon-20 fixed-width"></div>
                                    <div>Histórico de Depósitos</div>
                                 </div>
                              </a> 
                              <a href="<?=$painel_afiliado_all_games;?>" class="sublink-nav w-inline-block">
                                 <div class="content-sublink-menu">
                                    <div class="icon-20 fixed-width"></div>
                                    <div>Todos os jogos</div>
                                 </div>
                              </a>
                               <a href="<?=$painel_sair;?>" class="sublink-nav w-inline-block">
                                 <div class="content-sublink-menu">
                                    <div class="icon-16 fixed-width-24"></div>
                                    <div>Sair</div>
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
                                             <a href="#" class="link-menu w-inline-block">
                                                <div class="content-sublink-menu">
                                                   <img src="https://static.springbuilder.site/fs/userFiles-v2/moovbet-18748220/images/4977-fortune-ox-16934358641096.webp" loading="lazy" alt="" class="icon-sublink-game"/>
                                                   <div class="text-size-small short">Fortune Ox</div>
                                                </div>
                                             </a>
                                          </div>
                                          <div role="listitem" class="w-dyn-item">
                                             <a href="#" class="link-menu w-inline-block">
                                                <div class="content-sublink-menu">
                                                   <img src="https://assets.website-files.com/6483631a773f6af2b4edabee/64891b10c0a2086ed39a2db2_6489193dd93afd96335f9202_6483d7003cbfcd23c72d4095_648357caafb883b2444bd689_fortune_tiger_icon.webp" loading="lazy" alt="" class="icon-sublink-game"/>
                                                   <div class="text-size-small short">Fortune Tiger</div>
                                                </div>
                                             </a>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="list-links-menu mt-8">
                                       <a href="<?=$painel_afiliado_popular;?>" class="link-menu w-inline-block">
                                          <div class="content-sublink-menu space-between">
                                             <div>Ver todos</div>
                                             <div class="icon-12 txt-yellow"></div>
                                          </div>
                                       </a>
                                    </div>
                                 </nav>
                              </div>
                              <a href="<?=$painel_afiliado_aovivo;?>" class="sublink-nav btn-color-1 w-inline-block">
                                 <div class="content-sublink-menu">
                                    <div class="icon-20 fixed-width"></div>
                                    <div>Roletas</div>
                                 </div>
                              </a>
                              <a href="<?=$painel_afiliado_cassino;?>" aria-current="page" class="sublink-nav btn-color-1 w-inline-block w--current">
                                 <div class="content-sublink-menu">
                                    <div class="icon-20 fixed-width"></div>
                                    <div>Cassino</div>
                                 </div>
                              </a>
                              <a href="<?=$painel_afiliado_aovivo;?>" class="sublink-nav btn-color-1 w-inline-block">
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
            <!-- MENU MOBILE -->
            <div class="navbar-mobile custom-navbar">
               <a href="#" class="link-menu-mobile w-inline-block" data-toggle="modal" data-target="#exampleModal">
                  <div class="fa fa-bars fa-2x"></div>
                  <div class="white">Menu</div>
               </a>
               <a href="<?=$painel_afiliado_aovivo;?>" class="link-menu-mobile w-inline-block">
                  <div class="fa fa-bullseye fa-2x fa-pisca"></div>
                  <div class="white">Ao vivo</div>
               </a>

               <a href="<?=$painel_afiliado_cassino;?>" class="link-menu-mobile w-inline-block">
                  <i class="fa fa-gamepad fa-2x"></i>
                  <div class="white">Cassino</div>
               </a>
               
                <a href="<?=$painel_afiliado;?>" class="link-menu-mobile w-inline-block">
                  <i class="fa fa-users fa-2x"></i>
                  <div class="white">Afiliados</div>
               </a>
            </div>

            <style>
               #logo {
                  max-width: 350px; /* Defina o tamanho da sua logo */
               }
            </style>