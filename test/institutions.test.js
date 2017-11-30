const chai = require('chai');
const request = require('supertest');
const assert = require('chai').assert;
const should = require('chai').should;
const expect = require('chai').expect;

const institution = require('../src/models/institution');

describe('Institution', () => {
  describe('DB test', () => {
    it('should connect to database', () => {
      const result = institution.getConnection();
      expect(result).to.equal('Connected to database');
    });

    it('should close the connection to database', () => {
      const result = institution.closeConnection();
      expect(result).to.equal('Disconnected from database');
    });
  });

  describe('GET /institutions', () => {
    it('respond with institutions', (done) => {
      request('http://localhost:3000')
        .get('/institutions')
        .expect(200)
        .expect('Content-Type', /json/)
        .end((err) => {
          if (err) throw err;
          done();
        });
    });
  });
});
