format = 1;
            function id(el) {
                return document.getElementById(el);
            }
            window.onload = function () {
                id('mais').onclick = function () {
                    id('format').value = parseInt(id('format').value) + 1;
                    // Preco do produto
                    id('total').value = 90 * id('format').value;
                }
                id('menos').onclick = function () {
                    if (id('format').value > 0)
                        id('format').value = parseInt(id('format').value) - 1;

                    id('total').value = 90 * id('format').value;
                }
            }