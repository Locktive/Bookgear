const express = require('express');
var router = express.Router();
const path = require('path');
var app = express();
app.use(express.static('../public'))

/* GET home page. */
router.get('/', function(req, res, next) {
  let principal = path.join(__dirname, "../views/Tela-principal_BookGear.html")
  res.sendFile(principal)
});

router.get('/Login', function(req,res,next){
  let login = path.join(__dirname, "../views/Login-bookgear.html");
  res.sendFile(login);
})

router.get('/cadastro', function(req,res,next){
  let cadastro = path.join(__dirname, "../views/cadastro.html");
  res.sendFile(cadastro);
})

app.use(app.router);

// Since this is the last non-error-handling
// middleware use()d, we assume 404, as nothing else
// responded.

// $ curl http://localhost:3000/notfound
// $ curl http://localhost:3000/notfound -H "Accept: application/json"
// $ curl http://localhost:3000/notfound -H "Accept: text/plain"

app.use(function(req, res, next) {
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
