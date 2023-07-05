const express = require('express');
var router = express.Router();
var app = express();
const session = require('express-session');
var mysql = require('mysql2')
var session = require('express-session');
const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: 'root',
  database: 'bookgear',
  port: '3306'
});
connection.on("error", (error) => console.log(error));
connection.once("open", () => console.log("Conectado ao banco"));

app.use(
  session({
    secret: 'livrosn1c3y3b0y@',
    resave: false,
    saveUninitialized: true,
    cookie: { maxAge: 60000 }
  })
)

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render("layouts/Tela-principal_BookGear.ejs", { pageId: 'principal' })
});


router.get('/Login', function (req, res, next) {
  res.render("layouts/Login-bookgear.ejs", { pageId: 'login' })
});

router.post('/Login_auth', function (req, res) {
  var name = req.body.name;
  var password = req.body.senha;
  var sql = 'SELECT * FROM cliente WHERE nome = ?';
  connection.query(sql, [name], function (err, results, fields) {
    if (!err) {  
      console.log("Resultado:", results);
      if (results && results.length > 0) {
        var passCheck = results[0].senha;
        if (password === passCheck) {    
          req.session.user = results[0];
          var username = results[0].nome;
          console.log("Connected as " + username);
          res.render('layouts/Tela-principal_BookGear.ejs', { pageId: 'principal' , username: username , Userlogged: 'sim'});
        } else {
          res.render('layouts/Login-bookgear.ejs', { pageId: 'login' , errorMessage: 'Senha incorreta' });
          return;
        }
      } else {
        // Usuário não existe, definir a mensagem de erro e renderizar a página de login novamente
        res.render('layouts/Login-bookgear.ejs', { pageId: 'login' , errorMessage: 'Usuário não encontrado' });
        return;
      }
    } else {
      console.log("Consulta não realizada");
      return;
    }
  })
  console.log("Enviado ao servidor");
});

// Middleware para verificar a autenticação
function requireAuth(req, res, next) {
  if (req.session.user) {
    // O usuário está conectado, continue com a próxima rota
    next();
  } else {
    // O usuário não está conectado, redireciona para a página de login
    res.redirect('/login');
  }
}

router.get('/cadastro', function (req, res, next) {
  res.render("layouts/cadastro.ejs", { pageId: 'cadastro' });
});

router.post('/cadastro_user', function (req, res) {
  var name = req.body.username;
  var password = req.body.password;
  var confirm = req.body.confirm;
  var email = req.body.email;
  var address = req.body.address;

  // Verificar se algum campo está vazio
  if (!name || !password || !confirm || !email || !address) {
    res.render('layouts/cadastro.ejs', { pageId: 'cadastro', errorMessage: 'Por favor, preencha todos os campos' });
    return;
  }

  // Verificar se a senha tem menos de 8 caracteres ou mais de 15
  if (password.length < 8 || password.length > 15) {
    res.render('layouts/cadastro.ejs', { pageId: 'cadastro', errorMessage: 'A senha deve ter entre 8 e 15 caracteres' });
    return;
  }

  // Verificar se a senha e a confirmação de senha são iguais
  if (password !== confirm) {
    res.render('layouts/cadastro.ejs', { pageId: 'cadastro', errorMessage: 'A senha e a confirmação de senha não correspondem' });
    return;
  }

  var values = [[name, email, password, address]];
  var sql = 'INSERT INTO cliente (nome, email, senha, endereco) VALUES ?';

  connection.query(sql, [values], function (err, results, fields) {
    if (!err) {
      console.log("Resultado:", results);
      // Renderizar a página de cadastro novamente com a mensagem de confirmação e o título
      res.render('layouts/cadastro.ejs', { pageId: 'cadastro', confirmationMessage: 'Cadastro realizado com sucesso' });
    } else {
      console.log(err);
    }
  });
  console.log("Enviado ao servidor");
});


router.get('/compre', function (req, res, next) {
  res.render("layouts/book.ejs", { pageId: 'cadastro' })
});

router.get('/caixa', function (req, res, next) {
  res.render("layouts/caixa.ejs", { pageId: 'caixa' })
});

router.get('/carrinho', function (req, res, next) {
  res.render("layouts/carrinho.ejs", { pageId: 'carrinho' })
});

router.get('/user',requireAuth, function (req, res, next) {
  res.render("layouts/tela_usuario.ejs", { pageId: 'user' })
});

router.get('/pagamento', function (req, res, next) {
  res.render("layouts/book.ejs", { pageId: 'pagamento' })
});

router.get('/wishlist', function (req, res, next) {
  res.render("layouts/wishlist.ejs", { pageId: 'wishlist' })
});

router.get('/autores', function (req, res, next) {
  res.render("layouts/autores.ejs", { pageId: 'autor' })
});

router.get('/produto', function (req, res, next) {
  res.render('layouts/pagina-produto.ejs', { pageId: 'produto' })
});

router.get('/pedido', function(req , res, next){
  res.render('layouts/pedido.ejs', { pageId: 'pedido' })
});

app.use(router);

// Since this is the last non-error-handling
// middleware use()d, we assume 404, as nothing else
// responded.

// $ curl http://localhost:3000/notfound
// $ curl http://localhost:3000/notfound -H "Accept: application/json"
// $ curl http://localhost:3000/notfound -H "Accept: text/plain"

app.use(function (req, res) {
  res.status(404);

  // respond with html page
  if (req.accepts('ejs')) {
    res.render('error.ejs')
    return console.error();
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
