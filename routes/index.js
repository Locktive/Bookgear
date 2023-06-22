const express = require('express');
var router = express.Router();
const path = require('path');
var bodyParser = require('body-parser');
var mysql = require('mysql2');
const { set } = require('../app');
var app = express();
app.use(express.static('../public'))

const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: 'root',
  database: 'bookgear',
  port: '3306'
});


/* GET home page. */
router.get('/', function (req, res, next) {
  let principal = path.join(__dirname, "../views/Tela-principal_BookGear.html")
  res.sendFile(principal)
});

router.get('/Login', function (req, res, next) {
  let login = path.join(__dirname, "../views/Login-bookgear.html");
  res.sendFile(login);
})

router.post('/Login', function (req, res) {
  var name = req.body.name;
  var password = req.body.senha;
  var sql = 'SELECT * FROM cliente WHERE nome = ?';
  connection.query(sql, [name], function (err, results, fields) {
    if (!err) {
      console.log("Resultado:", results);
      console.log(name)
      console.log(password)
      if (results && results.length > 0) {
        var passCheck = results[0].senha;
        if (password === passCheck) {
          res.send("Bem vindo " + name)
          console.log("deu bom")
        } else {
          res.send("Senha errada")
          console.log("nao deu bom")
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

router.get('/cadastro', function (req, res, next) {
  let cadastro = path.join(__dirname, "../views/cadastro.html");
  res.sendFile(cadastro);
})

router.post('/cadastro', function (req, res) {
  var name = req.body.username;
  var password = req.body.password;
  var email = req.body.email;
  var address = req.body.address;
  var values = [
    [name, email, password, address]
  ];
  var sql = 'INSERT INTO cliente (nome,email,senha,endereco) VALUES ?';
    connection.query(sql, [values], function (err, results, fields) {
      if (!err) {
        console.log("Resultado:", results);
      } else {
        console.log(err);
      }

    })
  console.log("Enviado ao servidor");
});

router.get('/compre', function (req, res, next) {
  let login = path.join(__dirname, "../views/book.html");
  res.sendFile(login);
})

router.get('/carrinho', function (req, res, next) {
  let carrinho = path.join(__dirname, "../views/carrinho.html");
  res.sendFile(carrinho);
})

router.get('/user', function (req, res, next) {
  let principal = path.join(__dirname, "../views/tela_usuario.html")
  res.sendFile(principal)
});

router.get('/pagamento', function (req, res, next) {
  let principal = path.join(__dirname, "../views/book.html")
  res.sendFile(principal)
});

app.use(router);

// Since this is the last non-error-handling
// middleware use()d, we assume 404, as nothing else
// responded.

// $ curl http://localhost:3000/notfound
// $ curl http://localhost:3000/notfound -H "Accept: application/json"
// $ curl http://localhost:3000/notfound -H "Accept: text/plain"

app.use(function (req, res, next) {
  res.status(404);

  // respond with html page
  if (req.accepts('html')) {
    res.sendFile(__dirname, '../views/error.html')
    return;
  }

  // // respond with json
  // if (req.accepts('json')) {
  //   res.json({ error: 'Not found' });
  //   return;
  // }

  // // default to plain-text. send()
  // res.type('txt').send('Not found');
});

module.exports = router;
