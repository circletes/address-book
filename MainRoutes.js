/*
This is the javascript file used to route the html pages to eachother
*/

var express = require('express');
var mainRouter = express.Router();
var path = require('path');

//The function used to get the html page when running the server:
mainRouter.get('/', function(req, res){
  res.sendfile('views/index.html');
  res.status(200);
});

//The function used to get the add new contact html page:
mainRouter.get('/addContacts', function(req, res){
  res.sendfile(path.join(__dirname, 'views','addContacts.html'));
  res.status(200);
});

//The function used to get the view contacts html page:
mainRouter.get('/viewContacts', function(req, res){
  res.sendfile(path.join(__dirname, 'views','viewContacts.html'));
  res.status(200);
});

//The function used to get the edit contacts html page:
mainRouter.get('/editContacts', function(req, res){
  res.sendfile(path.join(__dirname, 'views','editContacts.html'));
  res.status(200);
});
module.exports = mainRouter;
