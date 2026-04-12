import { config as dotenvConfig } from 'dotenv';
import { resolve } from 'path';

// Load test environment before any other imports
dotenvConfig({ path: resolve(__dirname, '../.env.test') });

import { expect } from 'chai';

declare global {
  // eslint-disable-next-line no-var
  var expect: Chai.ExpectStatic;
}

globalThis.expect = expect;
