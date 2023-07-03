// ------------------------------------------------------ Idioma ------------------------------------------------------
// Carrega o valor da página
function changeLanguage(lang) {
    location.hash = lang;
    writeExpiresDateCookie("lang", lang, 100)
    location.reload();
}
    
// Define as traduções
var language = {
    br: {
        lang_pedido:"Pedido",
        lang_editar:"Editar Pedido",
        lang_gerar:"Gerar Pedido",
        lang_andar:"Andar",
        lang_cores:"Cores das Lâminas",
        lang_padroes:"Padrões das Lâminas",
        lang_preto:"Preto",
        lang_vermelho:"Vermelho",
        lang_azul:"Azul",
        lang_amarelo:"Amarelo",
        lang_verde:"Verde",
        lang_branco:"Branco",
        lang_casa:"Casa",
        lang_barco:"Barco",
        lang_estrela:"Estrela",
        lang_texto:"Texto",
    },
    es: {
        lang_pedido:"El Pedido",
        lang_editar:"Editar Orden",
        lang_gerar:"Generar Orden",
        lang_andar:"Nivel",
        lang_cores:"Colores Laterales",
        lang_padroes:"Patrones Laterales",
        lang_preto:"Negro",
        lang_vermelho:"Rojo",
        lang_azul:"Azul",
        lang_amarelo:"Amarillo",
        lang_verde:"Verde",
        lang_branco:"Blanco",
        lang_casa:"Casa",
        lang_barco:"Barco",
        lang_estrela:"Estrella",
        lang_texto:"Texto",
    },
    uk: {
        lang_pedido:"Order",
        lang_editar:"Edit Order",
        lang_gerar:"Generate Order",
        lang_andar:"Level",
        lang_cores:"Side Colors",
        lang_padroes:"Side Patterns",
        lang_preto:"Black",
        lang_vermelho:"Red",
        lang_azul:"Blue",
        lang_amarelo:"Yellow",
        lang_verde:"Green",
        lang_branco:"White",
        lang_casa:"House",
        lang_barco:"Ship",
        lang_estrela:"Star",
        lang_texto:"Text",
    }
};
    
    // Checa se a hash existe na URL e configura o conteúdo de acordo com a hash
    if (getCookie("lang")) {

        document.getElementById("lang_pedido").innerText = language[getCookie("lang")].lang_pedido
        document.getElementById("lang_editar").value = language[getCookie("lang")].lang_editar
        document.getElementById("lang_gerar").value = language[getCookie("lang")].lang_gerar

        for (let x=1; x<=3; x++){

            document.getElementById("lang_andar_" + x).innerText = language[getCookie("lang")].lang_andar + " " + x
            document.getElementById("lang_cores_" + x).innerText = language[getCookie("lang")].lang_cores
            document.getElementById("lang_padroes_" + x).innerText = language[getCookie("lang")].lang_padroes
            
            for (let y=1; y<=3; y++) {

                if (getCookie("NomeCorBloco" + x + "Lamina" + y) == 'Vermelho') {
                    document.getElementById("andar" + x + "Lamina" + y).innerText = language[getCookie("lang")].lang_vermelho
                } else if (getCookie("NomeCorBloco" + x + "Lamina" + y) == 'Azul') {
                    document.getElementById("andar" + x + "Lamina" + y).innerText = language[getCookie("lang")].lang_azul
                } else if (getCookie("NomeCorBloco" + x + "Lamina" + y) == 'Amarelo') {
                    document.getElementById("andar" + x + "Lamina" + y).innerText = language[getCookie("lang")].lang_amarelo
                } else if (getCookie("NomeCorBloco" + x + "Lamina" + y) == 'Verde') {
                    document.getElementById("andar" + x + "Lamina" + y).innerText = language[getCookie("lang")].lang_verde
                } else if (getCookie("NomeCorBloco" + x + "Lamina" + y) == 'Preto') {
                    document.getElementById("andar" + x + "Lamina" + y).innerText = language[getCookie("lang")].lang_preto
                } else if (getCookie("NomeCorBloco" + x + "Lamina" + y) == 'Branco') {
                    document.getElementById("andar" + x + "Lamina" + y).innerText = language[getCookie("lang")].lang_branco
                } else {
                    document.getElementById("andar" + x + "Lamina" + y).innerText = "-----"
                }

                if (getCookie("NomeBloco" + x + "Padrao" + y) == 'Casa') {
                    document.getElementById("andar" + x + "Padrao" + y).innerText = language[getCookie("lang")].lang_casa
                } else if (getCookie("NomeBloco" + x + "Padrao" + y) == 'Barco') {
                    document.getElementById("andar" + x + "Padrao" + y).innerText = language[getCookie("lang")].lang_barco
                } else if (getCookie("NomeBloco" + x + "Padrao" + y) == 'Estrela') {
                    document.getElementById("andar" + x + "Padrao" + y).innerText = language[getCookie("lang")].lang_estrela
                } else {
                    document.getElementById("andar" + x + "Padrao" + y).innerText = "-----"
                }
            }
        }  
        writeExpiresDateCookie("lang",getCookie("lang"), 100)
    }

// -------------------------------------------------------------------------------------------------------------------