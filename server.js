// get the client
const mysql = require('mysql2');

// create the connection to database
const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: 'root',
  database: 'universidade'
});

connection.connect(function(err){
    console.log("conexão realizada com sucesso!")
});

// simple query
connection.query(
  'SELECT * FROM `aluno`',
  function(err, rows, fields) {
    if(!err){
        console.log("Resultado:", rows);
    }
    else{
        console.log("Erro: Consulta não realizada",err);
    }
  });
