var cadastro = document.getElementById("cadastro");
        cadastro.addEventListener("submit", (e) => {
            var name = document.getElementById("username").value
            var pw = document.getElementById("senha").value;
            var confirm = document.getElementById("confirmar").value;
            var email = document.getElementById("email").value;
            var address = document.getElementById("address").value;
            //check empty password field  
            if (pw === "" || email === "" || address === "" || name === "") {
                event.preventDefault();
                document.getElementById("message").innerHTML = "**Preencha todos os dados";
                // document.getElementById("message").innerHTML = pw + " " + confirm;
            } else {
                if (pw === confirm) {
                    event.preventDefault();
                    if (pw.length >= 8) {
                        event.preventDefault();
                        if (pw.length <= 15) {
                            return document.getElementById("cadastro").submit();
                        } else {
                            event.preventDefault();
                            document.getElementById("message").innerHTML = "Tamanho da senha não deve ser maior que 15 caracteres";
                        }
                    }
                    else {
                        event.preventDefault();
                        document.getElementById("message").innerHTML = "Senha necessita ter mais de 8 caracteres";
                    }
                } else {
                    document.getElementById("message").innerHTML = "Senhas não coincidem";
                    event.preventDefault();
                }
            }
        });