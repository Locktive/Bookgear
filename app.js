var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var session = require('express-session');
var expressLayouts = require('express-ejs-layouts');
var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var mysql = require('mysql2');
//conexão ao banco
const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: 'root',
  database: 'bookgear',
  port: '3306'
});
connection.on("error", (error) => console.log(error));
connection.once("open", () => console.log("Conectado ao banco"));
var app = express();

// view engine setup
app.set('views', path.join(__dirname, './views'));
app.set('view engine', 'ejs');

app.use(expressLayouts);
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(
  session({
    secret: 'livrosn1c3y3b0y@',
    resave: false,
    saveUninitialized: true,
    cookie: { maxAge: 60000 }
  })
)
app.use(express.static('../public'))
app.use('/', indexRouter);
app.use('/users', usersRouter);

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

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app, connection;
