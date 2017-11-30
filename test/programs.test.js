const chai = require('chai');
const request = require('supertest');
const assert = require('chai').assert;
const should = require('chai').should;
const expect = require('chai').expect;

const program = require('../src/models/program');

describe('Program', () => {
  describe('DB test', () => {
    it('should connect to database', () => {
      const result = program.getConnection();
      expect(result).to.equal('Connected to database');
    });

    it('should close the connection to database', () => {
      const result = program.closeConnection();
      expect(result).to.equal('Disconnected from database');
    });
  });

  describe('GET /programs', () => {
    it('respond with programs', (done) => {
      request('http://localhost:3000')
        .get('/programs')
        .expect(200)
        .expect('Content-Type', /json/)
        .end((err) => {
          if (err) throw err;
          done();
        });
    });
  });
});
