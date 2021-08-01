"use strict";

var chai = require("chai");
let chaiHttp = require('chai-http');
let app = require('../app');
chai.should();
var expect = chai.expect;
chai.expect();
chai.use(chaiHttp);
var io = require('socket.io').listen(8080);//(http);
var socket = io.sockets;

describe('Open server', () => {
///////////////////////////////////////////////////Status Code tests///////////////////////////////////////////////////
    it('Should return status code 200 ok when server opens', (done) => {
      chai.request(app)
          .get('/')
          .end((err, res) => {
              res.should.have.status(200);
              chai.assert.equal(err, null);
            done();
          });
    });

    it('Should return status code 200 ok when addContacts page opens', (done) => {
      chai.request(app)
          .get('/addContacts')
          .end((err, res) => {
              res.should.have.status(200);
              chai.assert.equal(err, null);
            done();
          });
    });

    it('Should return status code 200 ok when viewContacts page opens', (done) => {
      chai.request(app)
          .get('/viewContacts')
          .end((err, res) => {
              res.should.have.status(200);
              chai.assert.equal(err, null);
            done();
          });
    });

    it('Should return status code 200 ok when editContacts page opens', (done) => {
      chai.request(app)
          .get('/editContacts')
          .end((err, res) => {
              res.should.have.status(200);
              chai.assert.equal(err, null);
            done();
          });
    });

    it('Should return status code 404 when a random page is requested',
    function testPath(done) {
      chai.request(app)
      .get('/foo')
      .end((err, res) => {
        res.should.have.status(404);
        chai.expect(err).to.not.equal(null);
        done();
      });
   });

////////////////////////////////////////////////////////Socket tests////////////////////////////////////////////////////////
  it('Should add new contacts to the app', function(){

    var contact = {
      name: 'Evan',
      surname: 'Rubin',
      cellNum: '072',
      homeNum: '011',
      email: 'evan@rubin'
    }
    socket.emit('add', contact);
    socket.on('addSuccess', function(status){
      expect(status).to.be.true;
    });
  });

  it('Should return requested contact list', function(){
    var contact = {
      name: 'Evan',
      surname: 'Rubin',
      cellNum: '072',
      homeNum: '011',
      email: 'evan@rubin'
    }
    socket.emit('add', contact);
    socket.on('addSuccess', function(status){
      expect(status).to.be.true;
    });

    socket.emit('fetchContactList');
    socket.on('getContactList', function(contacts){
      assert.equal(contacts.name, contact.name)
      assert.equal(contacts.surname, contact.surname)
      assert.equal(contacts.cellNum, contact.cellNum)
      assert.equal(contacts.homeNum, contact.homeNum)
      assert.equal(contacts.email, contact.email)
    });
  });

  it('Should return requested contact', function(){
    var contact = {
      name: 'Evan',
      surname: 'Rubin',
      cellNum: '072',
      homeNum: '011',
      email: 'evan@rubin'
    }
    socket.emit('add', contact);
    socket.on('addSuccess', function(status){
      expect(status).to.be.true;
    });
    socket.emit('getContact', 0);
    socket.on('recvContact', function(contacts){
      assert.equal(contacts.name, contact.name)
      assert.equal(contacts.surname, contact.surname)
      assert.equal(contacts.cellNum, contact.cellNum)
      assert.equal(contacts.homeNum, contact.homeNum)
      assert.equal(contacts.email, contact.email)
    });
  });

  it('Should update contact', function(){
    var contact = {
      name: 'Evan',
      surname: 'Rubin',
      cellNum: '072',
      homeNum: '011',
      email: 'evan@rubin'
    }
    var contactNew = {
      name: 'Ev',
      surname: 'Rubin',
      cellNum: '072',
      homeNum: '011',
      email: 'evan@rubin',
      pos: 0
    }
    socket.emit('add', contact);
    socket.on('addSuccess', function(status){
      expect(status).to.be.true;
    });
    socket.emit('updateContact', contactNew);
    socket.on('updateSuccess', function(contacts){
      assert.equal(contacts.name, contactNew.name)
    });
  });

  it('Should delete contact', function(){
    var contact = {
      name: 'Evan',
      surname: 'Rubin',
      cellNum: '072',
      homeNum: '011',
      email: 'evan@rubin'
    }
    socket.emit('add', contact);
    socket.on('addSuccess', function(status){
      expect(status).to.be.true;
    });
    socket.emit('deleteContact', 0);
    socket.on('deleteSuccess', function(status){
      expect(status).to.be.true;
    });
  });

  it('Should sort contacts by first name', function(){
    var contact = {
      name: 'Evan',
      surname: 'Rubin',
      cellNum: '072',
      homeNum: '011',
      email: 'evan@rubin'
    }
    var contact2 = {
      name: 'Aaa',
      surname: 'Zzz',
      cellNum: '072',
      homeNum: '011',
      email: 'evan@rubin'
    }

    //Add contacts
    socket.emit('add', contact);
    socket.on('addSuccess', function(status){
      expect(status).to.be.true;
    });

    socket.emit('add', contact2);
    socket.on('addSuccess', function(status){
      expect(status).to.be.true;
    });
    //Sort Contacts
    socket.emit('sort', 'name');
    socket.on('deleteSuccess', function(status){
      expect(status).to.be.true;
    });
    //Check sorted
    socket.emit('fetchContactList');
    socket.on('getContactList', function(contacts){
      console.log(contacts[0].name);
      assert.equal(contacts[0].name, contact.name)
    });
  });

  it('Should sort contacts by surname', function(){
    var contact2 = {
      name: 'Evan',
      surname: 'Rubin',
      cellNum: '072',
      homeNum: '011',
      email: 'evan@rubin'
    }
    var contact = {
      name: 'Aaa',
      surname: 'Zzz',
      cellNum: '072',
      homeNum: '011',
      email: 'evan@rubin'
    }

    //Add contacts
    socket.emit('add', contact);
    socket.on('addSuccess', function(status){
      expect(status).to.be.true;
    });

    socket.emit('add', contact2);
    socket.on('addSuccess', function(status){
      expect(status).to.be.true;
    });
    //Sort Contacts
    socket.emit('sort', 'surname');
    socket.on('deleteSuccess', function(status){
      expect(status).to.be.true;
    });
    //Check sorted
    socket.emit('fetchContactList');
    socket.on('getContactList', function(contacts){
      console.log(contacts[0].name);
      assert.equal(contacts[0].name, contact.name)
    });
  });
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
});
