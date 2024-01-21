<?php include_once('header.php');?>  
<!-- Começa Aqui -->
<div class="main-content">
   <div class="container-medium mb-24">
      <div class="mb-24-2">
         <h3 class="white">Indique e Ganhe</h3>
      </div>
      <div class="card-affiliate horizontal mb-16">
         <div class="item-card-affiliate">
            <img src="https://assets-global.website-files.com/6483631a773f6af2b4edabab/651ff9c472a75899e996ef0a_users.svg" loading="lazy" alt="" class="icon-medium">
            <div class="content-card-affiliates">
               <h4>Referências Diretas</h4>
               <h4><?=count_refer_direto($_SESSION['data_user']['token_refer']);?></h4>
            </div>
         </div>
         <div class="item-card-affiliate">
            <img src="https://assets-global.website-files.com/6483631a773f6af2b4edabab/651ff9c472a75899e996ef0b_USD.svg" loading="lazy" alt="" class="icon-medium">
            <div class="content-card-affiliates">
               <h4>Total retirado (BRL)</h4>
               <h4>R$ <?=Reais2(total_saques_id($_SESSION['data_user']['id']));?></h4>
            </div>
         </div>
         <div class="item-card-affiliate">
            <img src="https://assets-global.website-files.com/6483631a773f6af2b4edabab/651ff9c472a75899e996ef0b_USD.svg" loading="lazy" alt="" class="icon-medium">
            <div class="content-card-affiliates">
               <h4>Total ganho (CPA/REV)</h4>
               <h4>R$ <?=Reais2(total_CPA_REV_id($_SESSION['data_user']['id']));?></h4>
            </div>
         </div>
      </div>
      <div class="card-affiliate horizontal mb-16">
         <div class="item-card-affiliate">
            <img src="https://assets-global.website-files.com/6483631a773f6af2b4edabab/651ff9c472a75899e996ef0a_users.svg" loading="lazy" alt="" class="icon-medium">
            <div class="content-card-affiliates">
               <h4>Afiliados Nv1</h4>
               <h4 invited-users-quantity=""><?=count_refer_direto($_SESSION['data_user']['token_refer']);?></h4>
            </div>
         </div>
         <div class="item-card-affiliate">
            <img src="https://assets-global.website-files.com/6483631a773f6af2b4edabab/651ff9c472a75899e996ef0a_users.svg" loading="lazy" alt="" class="icon-medium">
            <div class="content-card-affiliates">
               <h4>Afiliados Nv2</h4>
               <h4 invited-active-users-quantity="">0</h4>
            </div>
         </div>
      </div>
      
      
      
      
      <div class="eng-cards-afiliates">
         <div class="card-affiliate">
            <div class="item-card-affiliate">
               <div class="content-card-affiliates">
                  <h4 class="mb-16-2">Meu link de referência</h4>
                  <div class="gray-4 mb-16">Aproveite essa oportunidade para ganhar dinheiro extra enquanto compartilha a diversão da plataforma com seus amigos.</div>
                  <div class="form-rocket w-form">
                
                     <div class="content-select-field mt-24">
                        <div class="eng-select-field full">
                              <input type="text" class="input w-input" id="textoParaCopiar2" value="<?=$url_base; ?>?ref=<?=$_SESSION['data_user']['token_refer'];?>" >
                        </div>
                        <button class="btn-small w-inline-block" onclick="copiarTexto2()">Copiar</button><br/>
                     
                     
                     </div>
                     <div id="mensagem2"></div>
                     
                     
                     
                     
                     
                  </div>
               </div>
            </div>
         </div>
         <div class="card-affiliate">
            <div class="item-card-affiliate">
               <div class="eng-step">
                  <h3>1</h3>
               </div>
               <div class="content-card-affiliates">
                  <h4 class="mb-16-2"><span class="white">Compartilhe</span> com amigos</h4>
                  <div class="gray-4">Compartilhe seu link ou código de referência com seus amigos</div>
               </div>
            </div>
            <div class="item-card-affiliate">
               <div class="eng-step">
                  <h3>2</h3>
               </div>
               <div class="content-card-affiliates">
                  <h4 class="mb-16-2">Ganhe <span class="white">R$ <?=Reais2($data_afiliados_cpa_rev['cpaLvl1']);?></span></h4>
                  <div class="gray-4">Você recebe quando o depósito for no minimo de R$ <?=Reais2($data_afiliados_cpa_rev['minDepForCpa']);?>.</div>
               </div>
            </div>
            <div class="item-card-affiliate">
               <div class="eng-step">
                  <h3>3</h3>
               </div>
               <div class="content-card-affiliates">
                  <h4 class="mb-16-2">Suba de nível e receba!</h4>
                  <div class="gray-4">Aumente seus ganhos a cada novo cadastro no seu link</div>
               </div>
            </div>
         </div>
      </div>
   </div>
   



<?php include_once('footer.php');?>
   <script>
      function exibirMensagem2(texto) {
         var mensagemDiv2 = document.getElementById('mensagem2');
            mensagemDiv2.innerHTML = texto; 
            mensagemDiv2.style.display = 'block';
            setTimeout(function () {
               mensagemDiv2.style.display = 'none';
            }, 10000);
      }
      function copiarTexto2() {
         var campoTexto2 = document.getElementById('textoParaCopiar2');
         navigator.clipboard.writeText(campoTexto2.value)
               .then(function() {
                  var mensagemHtml = '<div class="content-select-field mt-24"><div class="alert alert-success" role="alert" style="color:white;">✔️ Link de afiliação copiado com sucesso.</div></div>';
                  exibirMensagem2(mensagemHtml);
               })
               .catch(function(err) {
                  console.error('Erro ao copiar texto: ', err);
               });
      }
   </script>
  