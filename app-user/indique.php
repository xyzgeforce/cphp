<?php include_once('header.php');?>  
<!-- Começa Aqui -->
<div class="main-content home">
   <div class="container-medium">
    <h3 class="mb-20">Programa de Afiliação  (CPA/REVSHARE)</h3>
    <div class="card">
        <p class="gray">
           <h3>🤑 Convide amigos para ganhar até 3 níveis de bônus de indicação 🤑</h3><br/>
           Esta será sua renda a longo prazo e você receberá uma porcentagem de comissão cada vez que um jogador que você convidar e efetuar um depósito minimo ou fizer uma aposta em nosso site.
           Convide seus amigos e ganhe recompensas em três níveis de afiliação, descritos abaixo:<br/><br/>
           <h4>Comissão por CPA  (Indicação)</h4> <br />
           <div>- Nível 1：Receba <span style="color:gold">R$ <?=Reais2($data_afiliados_cpa_rev['cpaLvl1']);?></span> dos depósitos efetuados.</div>
           <div>- Nível 2：Receba <span style="color:gold">R$ <?=Reais2($data_afiliados_cpa_rev['cpaLvl2']);?></span>  dos depósitos efetuados.</div>
           <div>- Nível 3：Receba <span style="color:gold">R$ <?=Reais2($data_afiliados_cpa_rev['cpaLvl3']);?></span>  dos depósitos efetuados.</div>
           <br />
           <h4>Comissão por Revshare (Apostas)</h4> <br />
           <div>- Nível 1：Receba <span style="color:gold"><?=$data_afiliados_cpa_rev['revShareLvl1'];?>%</span> dos lucros da plataforma.</div>
           <div>- Nível 2：Receba <span style="color:gold"><?=$data_afiliados_cpa_rev['revShareLvl2'];?>%</span> dos lucros da plataforma.</div>
           <div>- Nível 3：Receba <span style="color:gold"><?=$data_afiliados_cpa_rev['revShareLvl3'];?>%</span> dos lucros da plataforma.</div>
            <br/>
            <img src="<?=$docs_site.'images/afiliados.png';?>" alt="" srcset="" width="100%">
          
        </p>
    </div>
</div>
<?php include_once('footer.php');?>