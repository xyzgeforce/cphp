var base_url = $(".base_url").attr("id");
function fetchDataPAYMENT() {
    $.get(base_url + "/status_payment", function (data) {
        $('#msg_payment').html(data).show();
        // Processar a resposta ou realizar outras ações necessárias
        //console.log("Status de pagamento:", data);
    }).fail(function () {
        //console.error("Erro ao obter o status de pagamento");
    });
}
setInterval(fetchDataPAYMENT, 8000);