var base_url = $(".base_url").attr("id");

async function fetchData() {
    try {
        // Limpar os dados antes de obter os novos dados
        limparDados("#balance");
        limparDados("#msg_payment");

        // Obter os novos dados
        await obterDados(`${base_url}/pegarSaldo`, "#balance", "o saldo");
        await obterDados(`${base_url}/status_payment`, "#msg_payment", "o status de pagamento");
        await obterDados(`${base_url}/status_pagstart_payment`, "#msg_payment", "o status de pagamento pagstart");
    } finally {
        // Agendando a próxima execução após 8 segundos
        setTimeout(fetchData, 8000);
    }
}

async function obterDados(url, elemento, mensagemErro) {
    try {
        const response = await fetch(url);
        if (!response.ok) {
            throw new Error(`Erro ao obter ${mensagemErro}`);
        }

        const data = await response.text();
        $(elemento).text(data).show();
    } catch (error) {
        console.error(error.message);
    }
}

function limparDados(elemento) {
    // Limpar o conteúdo do elemento
    $(elemento).empty();
}

// Inicia o processo pela primeira vez
fetchData();
