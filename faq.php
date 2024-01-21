<?php include_once('header.php');?>  
<!-- Começa Aqui -->
<div class="main-content home">
 <div class="container-medium">
     <h3 class="mb-20">Perguntas Frequentes</h3>
     <div class="container mt-5">
      <div class="accordion" id="collapseExample">
        <!-- Item 1 -->
        <div class="card">
          <div class="dropdown-toogle w-dropdown-toggle" id="headingOne">
            <h2 class="mb-0">
              <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                Item 1
              </button>
            </h2>
          </div>

          <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#collapseExample">
            <div class="card-body">
              Content for item 1.
            </div>
          </div>
        </div>

        <!-- Item 2 to 9 (Similar structure with different content) -->
        <!-- ... -->

        <!-- Item 10 -->
        <div class="card">
          <div class="card-header" id="headingTen">
            <h2 class="mb-0">
              <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseTen" aria-expanded="false" aria-controls="collapseTen">
                Item 10
              </button>
            </h2>
          </div>

          <div id="collapseTen" class="collapse" aria-labelledby="headingTen" data-parent="#collapseExample">
            <div class="card-body">
              Content for item 10.
            </div>
          </div>
        </div>
      </div>
    </div>
         
                     
                     
                     
     
     
     
     
     
     
     
     
     
     
     
     
     <div data-hover="false" data-delay="0" class="dropdown mt-8 w-dropdown" data-ix="drop-info">
         <div class="dropdown-toogle w-dropdown-toggle" id="w-dropdown-toggle-6" aria-controls="w-dropdown-list-6" aria-haspopup="menu" aria-expanded="false" role="button" tabindex="0">
             <div><span>Posso registrar mais de uma conta na </span><span tenant-name=""><?=$dataconfig['nome'];?></span><span>?</span></div>
         </div>
         <nav class="dropdown-list w-dropdown-list" id="w-dropdown-list-6" aria-labelledby="w-dropdown-toggle-6">
             <div class="eng-info-dropdown" data-ix="start-dropdown" style="height: 0px;">
                 <div class="gray mt-16 mb-24">Não. Os usuários estão limitados a 1 conta por CPF. Contas duplicadas serão identificadas e removidas automaticamente.</div>
             </div>
         </nav>
     </div>
     <div data-hover="false" data-delay="0" class="dropdown mt-8 w-dropdown" data-ix="drop-info">
         <div class="dropdown-toogle w-dropdown-toggle" id="w-dropdown-toggle-7" aria-controls="w-dropdown-list-7" aria-haspopup="menu" aria-expanded="false" role="button" tabindex="0">
             <div><span>Como faço para abrir uma conta na </span><span tenant-name=""><?=$dataconfig['nome'];?></span><span>?</span></div>
         </div>
         <nav class="dropdown-list w-dropdown-list" id="w-dropdown-list-7" aria-labelledby="w-dropdown-toggle-7">
             <div class="eng-info-dropdown" data-ix="start-dropdown" style="height: 0px;">
                 <div class="gray mt-16 mb-24">
                     O processo de registro na <span tenant-name=""><?=$dataconfig['nome'];?></span> é rápido e simples. Clique em "Cadastre-se" na nossa página principal ou <a href="#" data-ix="window-register" tabindex="0"><span>clique aqui</span></a> e
                     preencha os campos necessários para criar uma conta.
                 </div>
             </div>
         </nav>
     </div>
     <div data-hover="false" data-delay="0" class="dropdown mt-8 w-dropdown" data-ix="drop-info">
         <div class="dropdown-toogle w-dropdown-toggle" id="w-dropdown-toggle-8" aria-controls="w-dropdown-list-8" aria-haspopup="menu" aria-expanded="false" role="button" tabindex="0">
             <div><span>Eu sou menor de idade, posso jogar?</span></div>
         </div>
         <nav class="dropdown-list w-dropdown-list" id="w-dropdown-list-8" aria-labelledby="w-dropdown-toggle-8">
             <div class="eng-info-dropdown" data-ix="start-dropdown" style="height: 0px;">
                 <div class="gray mt-16 mb-24">
                     Não. Você deve esperar até ter idade legal para criar uma conta. <br />
                     Independentemente do contexto, as contas suspeitas de serem usadas por menores de idade serão fechadas permanentemente e seus ganhos anulados.
                 </div>
             </div>
         </nav>
     </div>
     <div data-hover="false" data-delay="0" class="dropdown mt-8 w-dropdown" data-ix="drop-info">
         <div class="dropdown-toogle w-dropdown-toggle" id="w-dropdown-toggle-9" aria-controls="w-dropdown-list-9" aria-haspopup="menu" aria-expanded="false" role="button" tabindex="0">
             <div><span>Quanto tempo leva para um depósito aparecer na minha conta da </span><span tenant-name=""><?=$dataconfig['nome'];?></span><span>?</span></div>
         </div>
         <nav class="dropdown-list w-dropdown-list" id="w-dropdown-list-9" aria-labelledby="w-dropdown-toggle-9">
             <div class="eng-info-dropdown" data-ix="start-dropdown" style="height: 0px;">
                 <div class="gray mt-16 mb-24">
                     A maioria dos pagamentos é creditada na sua conta instantaneamente.<br />
                     ATENÇÃO: As transações são intermediadas por instituições bancárias antes de ser validada. Todas as transações estão sujeitas a atrasos caso haja instabilidade no sistema geral do banco.
                 </div>
             </div>
         </nav>
     </div>
     <div data-hover="false" data-delay="0" class="dropdown mt-8 w-dropdown" data-ix="drop-info">
         <div class="dropdown-toogle w-dropdown-toggle" id="w-dropdown-toggle-10" aria-controls="w-dropdown-list-10" aria-haspopup="menu" aria-expanded="false" role="button" tabindex="0">
             <div><span>Qual é o mínimo ou o máximo que posso depositar?</span></div>
         </div>
         <nav class="dropdown-list w-dropdown-list" id="w-dropdown-list-10" aria-labelledby="w-dropdown-toggle-10">
             <div class="eng-info-dropdown" data-ix="start-dropdown" style="height: 0px;">
                 <div class="gray mt-16 mb-24">
                     O valor mínimo é de 40 reais.<br />
                     O valor máximo é de 20 mil reais.
                 </div>
             </div>
         </nav>
     </div>
     <div data-hover="false" data-delay="0" class="dropdown mt-8 w-dropdown" data-ix="drop-info">
         <div class="dropdown-toogle w-dropdown-toggle" id="w-dropdown-toggle-11" aria-controls="w-dropdown-list-11" aria-haspopup="menu" aria-expanded="false" role="button" tabindex="0">
             <div><span>Qual é o mínimo ou o máximo que posso retirar de uma só vez?</span></div>
         </div>
         <nav class="dropdown-list w-dropdown-list" id="w-dropdown-list-11" aria-labelledby="w-dropdown-toggle-11">
             <div class="eng-info-dropdown" data-ix="start-dropdown" style="height: 0px;">
                 <div class="gray mt-16 mb-24">
                     O valor mínimo de retirada é de R$ 150,00<br />
                     O valor máximo de retirada diária é de R$ 5.000,00
                 </div>
             </div>
         </nav>
     </div>
     <div data-hover="false" data-delay="0" class="dropdown mt-8 w-dropdown" data-ix="drop-info">
         <div class="dropdown-toogle w-dropdown-toggle" id="w-dropdown-toggle-12" aria-controls="w-dropdown-list-12" aria-haspopup="menu" aria-expanded="false" role="button" tabindex="0">
             <div><span>Fiz um saque na </span><span tenant-name=""><?=$dataconfig['nome'];?></span><span>, quando receberei meu dinheiro?</span></div>
         </div>
         <nav class="dropdown-list w-dropdown-list" id="w-dropdown-list-12" aria-labelledby="w-dropdown-toggle-12">
             <div class="eng-info-dropdown" data-ix="start-dropdown" style="height: 0px;"><div class="gray mt-16 mb-24">Todas as solicitações de saque podem levar até três dias para que os fundos sejam depositados.</div></div>
         </nav>
     </div>
     <div data-hover="false" data-delay="0" class="dropdown mt-8 w-dropdown" data-ix="drop-info">
         <div class="dropdown-toogle w-dropdown-toggle" id="w-dropdown-toggle-13" aria-controls="w-dropdown-list-13" aria-haspopup="menu" aria-expanded="false" role="button" tabindex="0">
             <div><span>Regras de Bônus</span></div>
         </div>
         <nav class="dropdown-list w-dropdown-list" id="w-dropdown-list-13" aria-labelledby="w-dropdown-toggle-13">
             <div class="eng-info-dropdown" data-ix="start-dropdown" style="height: 0px;">
                 <div class="gray mt-16 mb-24">
                     Ganhe um bônus de 100% sobre o valor depositado, válido somente no seu primeiro depósito.<br />
                     <br />
                     Exemplo: Depósito de R$100, você recebe mais R$ 100 de bônus. Será necessário movimentar em apostas o total de 35x o valor do bônus para sacar.
                 </div>
             </div>
         </nav>
     </div>
     <div data-hover="false" data-delay="0" class="dropdown mt-8 w-dropdown" data-ix="drop-info">
         <div class="dropdown-toogle w-dropdown-toggle" id="w-dropdown-toggle-14" aria-controls="w-dropdown-list-14" aria-haspopup="menu" aria-expanded="false" role="button" tabindex="0">
             <div><span>Como posso cancelar meu depósito?</span></div>
         </div>
         <nav class="dropdown-list w-dropdown-list" id="w-dropdown-list-14" aria-labelledby="w-dropdown-toggle-14">
             <div class="eng-info-dropdown" data-ix="start-dropdown" style="height: 0px;">
                 <div class="gray mt-16 mb-24">Uma vez criada a solicitação de depósito e o mesmo tenha sido creditado. Esta transação não poderá ser revertida.</div>
             </div>
         </nav>
     </div>
     <div data-hover="false" data-delay="0" class="dropdown mt-8 w-dropdown" data-ix="drop-info">
         <div class="dropdown-toogle w-dropdown-toggle" id="w-dropdown-toggle-15" aria-controls="w-dropdown-list-15" aria-haspopup="menu" aria-expanded="false" role="button" tabindex="0">
             <div><span>Como posso cancelar meu saque?</span></div>
         </div>
         <nav class="dropdown-list w-dropdown-list" id="w-dropdown-list-15" aria-labelledby="w-dropdown-toggle-15">
             <div class="eng-info-dropdown" data-ix="start-dropdown" style="height: 0px;">
                 <div class="gray mt-16 mb-24">
                     Após iniciar uma solicitação de saque, clique no seu saldo e clique no botão "Cancelar".<br />
                     A solicitação de cancelamento só é liberada por 5 minutos após o pedido de saque. Após o período de 5 minutos a solicitação de saque já terá sido processada e não poderá mais ser cancelada.
                 </div>
             </div>
         </nav>
     </div>
     <div data-hover="false" data-delay="0" class="dropdown mt-8 w-dropdown" data-ix="drop-info">
         <div class="dropdown-toogle w-dropdown-toggle" id="w-dropdown-toggle-16" aria-controls="w-dropdown-list-16" aria-haspopup="menu" aria-expanded="false" role="button" tabindex="0">
             <div>O que acontece se eu depositar com a conta ou cartão de terceiros?</div>
         </div>
         <nav class="dropdown-list w-dropdown-list" id="w-dropdown-list-16" aria-labelledby="w-dropdown-toggle-16">
             <div class="eng-info-dropdown" data-ix="start-dropdown" style="height: 0px;">
                 <div class="gray mt-16 mb-24">
                     So não é permitido depósitos via cartão de crédito/débito de terceiros.<br />
                     O método de depósito via PIX, pode ser feito por conta de terceiros.
                 </div>
             </div>
         </nav>
     </div>
     <div data-hover="false" data-delay="0" class="dropdown mt-8 w-dropdown" data-ix="drop-info">
         <div class="dropdown-toogle w-dropdown-toggle" id="w-dropdown-toggle-17" aria-controls="w-dropdown-list-17" aria-haspopup="menu" aria-expanded="false" role="button" tabindex="0">
             <div><span>Razões comuns para falhas de saque:</span></div>
         </div>
         <nav class="dropdown-list w-dropdown-list" id="w-dropdown-list-17" aria-labelledby="w-dropdown-toggle-17">
             <div class="eng-info-dropdown" data-ix="start-dropdown" style="height: 0px;">
                 <div class="gray mt-16 mb-24">
                     01) Solicitar saques sem realizar nenhuma aposta ou solicitar um saque abaixo do valor mínimo, não serão permitidos. Verifique os limites para depósitos e saques.<span></span><br />
                     <br />
                     02) Solicitar saques de saldo em bônus: Para abrir uma solicitação de saque com saldo de bônus, é necessário a conversão de saldo de bônus para saldo real. <span></span><br />
                     <br />
                     03) Fiz meu cadastro com dados incorretos: Entre em contato com o suporte no botão SUPORTE que esta no menu principal.<br />
                     <br />
                     04) Solicitar saque para conta de terceiros: &nbsp;Não é permitida a solicitação de saque para conta de terceiros, caso abra uma solicitação de saque para uma conta de terceiros o mesmo não será concluído e o saldo
                     retornará para o seu sistema.<br />
                     <br />
                     Para mais informações entre em contato conosco através do nosso suporte disponível no menu principal no botão SUPORTE.
                 </div>
             </div>
         </nav>
     </div>
 </div>


<?php include_once('footer.php');?>