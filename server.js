const http = require('http');
const fs = require('fs');
const url = require('url');
const express = require('express');
const app = express();
var bodyParser = require('body-parser');
var mysql = require('mysql2')

app.use(bodyParser.urlencoded({
    extended: false
}));

app.use(bodyParser.json());


const connection = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: '',
    database: 'bookgear',
    port: '3306'
});


connection.connect(function (err) {
    if (!err) {
        console.log("conexão realizada com sucesso!");
    } else {
        console.log("Conexão ERRO:", err);
    }
});

app.post('/Login', function (req, res) {
    var name = req.body.name;
    var password = req.body.senha;
    var sql = 'SELECT * FROM cliente WHERE nome = ?';
    connection.query(sql, [name], function (err, results, fields) {
        if (!err) {
            console.log("Resultado:", results);

            if (results  && results.length > 0) {
                var passCheck = results[0].senha;
                if (password === passCheck) {
                    res.send("Bem vindo " + name)
                } else {
                    res.send("Senha errada")
                }
            } else {
                res.send("Usuario nao encontrado")
            }
        } else {
            console.log("Consulta não realizada");
        }

    })
    console.log("Enviado ao servidor");
});

app.use((err, req, res, next) => {
    res.status(400).send(err.message)
})

//create a server object:
app.listen(3005); //the server object listens on port 8080

