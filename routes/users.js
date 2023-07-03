var express = require('express');
var router = express.Router();
var app = express();
const session = require('express-session');
/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log('respond with a resource');
});

// Rota para finalizar a sessão
app.get('/logout', function(req, res) {
  // Utilize o método 'destroy()' para finalizar a sessão
  req.session.destroy(function(err) {
    if (err) {
      console.log(err);
    } else {
      // Redirecione para a página de login ou outra página após finalizar a sessão
      res.redirect('/login');
    }
  });
});


module.exports = router;
