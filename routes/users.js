var express = require('express');
var router = express.Router();
var app = express();

/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log('respond with a resource');
});




module.exports = router;
