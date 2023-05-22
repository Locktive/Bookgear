const express = require('express');
var router = express.Router();
var path = require('path')

/* GET home page. */
router.get('/', function(req, res, next) {
  let principal = path.join(__dirname, "../public/html/Tela-principal_BookGear.html")
  res.sendFile(principal)
});


module.exports = router;
