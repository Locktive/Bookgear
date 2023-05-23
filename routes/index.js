const express = require('express');
var router = express.Router();
const path = require('path')
app.use('/static', express.static(path.join(__dirname, 'public')))

/* GET home page. */
router.get('/', function(req, res, next) {
  let principal = path.join(__dirname, "../views/Tela-principal_BookGear.html")
  res.sendFile(principal)
});

module.exports = router;
