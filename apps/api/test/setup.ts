import { expect } from 'chai';

// Make chai expect available globally for all test files
declare global {
  // eslint-disable-next-line no-var
  var expect: Chai.ExpectStatic;
}

globalThis.expect = expect;
