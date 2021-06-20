'use strict';

const Module = require('module');

const hacks = [
  'eslint-config-airbnb-base',
  '@babel/eslint-parser',
  '@babel/plugin-syntax-top-level-await',
  '@babel/plugin-syntax-class-properties',
  '@babel/preset-react',
  '@babel/eslint-plugin',

  'eslint-plugin-import', // dep of airbnb-base
];

const NPM_PREFIX = process.env.NPM_CONFIG_PREFIX || '/usr/local';

const ModuleFindPath = Module._findPath;
Module._findPath = (request, paths, isMain) => {
  const r = ModuleFindPath(request, paths, isMain);
  if (!r && hacks.includes(request)) {
    return require.resolve(`${NPM_PREFIX}/lib/node_modules/${request}`);
  }
  return r;
};

const babelTLA = require('@babel/plugin-syntax-top-level-await');
const babelPrivate = require('@babel/plugin-syntax-class-properties');
const presetReact = require('@babel/preset-react');

module.exports = {
  extends: 'airbnb-base',
  parser: '@babel/eslint-parser',
  plugins: ['@babel'],
  parserOptions: {
    ecmaVersion: 2021,
    sourceType: 'script',
    requireConfigFile: false,
    babelOptions: {
      plugins: [
        babelTLA.default,
        babelPrivate.default,
      ],
      presets: [
        presetReact.default,
      ],
    },
  },
  env: {
    es6: true,
    node: true,
  },
  overrides: [
    {
      files: ['*.jsx'],
      parserOptions: {
        sourceType: 'module',
        ecmaFeatures: { jsx: true },
      },
    },
    {
      files: ['*.mjs'],
      parserOptions: { sourceType: 'module' },
      env: {
        node: true,
      },
      rules: {
        'no-restricted-globals': ['error', 'require'],
      },
    },
    {
      files: ['*.web.js'],
      env: { browser: true },
    },
  ],
  rules: {
    'strict': ['error', 'global'],
    'indent': ['error', 2, {
      SwitchCase: 1,
      FunctionDeclaration: {
        parameters: 'first',
      },
      FunctionExpression: {
        parameters: 'first',
      },
      CallExpression: {
        arguments: 'first',
      },
    }],
    'no-bitwise': 'off',
    'no-iterator': 'off',
    'global-require': 'off',
    'quote-props': ['error', 'consistent-as-needed'],
    'brace-style': ['error', '1tbs', { allowSingleLine: false }],
    'curly': ['error', 'all'],
    'no-param-reassign': 'off',
    'arrow-parens': ['error', 'always'],
    'no-multi-assign': 'off',
    'no-underscore-dangle': 'off',
    'no-restricted-syntax': 'off',
    'object-curly-newline': 'off',
    'prefer-const': ['error', { destructuring: 'all' }],
    'class-methods-use-this': 'off',
    'implicit-arrow-linebreak': 'off',
    'lines-between-class-members': 'off',
    'import/no-dynamic-require': 'off',
    'import/no-extraneous-dependencies': ['error', {
      devDependencies: true,
    }],
    'import/extensions': 'off',
    'import/prefer-default-export': 'off',
    'max-classes-per-file': 'off',
    'no-unused-expressions': 'off',
    '@babel/no-unused-expressions': 'error',
  },
  globals: {
    WebAssembly: false,
    BigInt: false,
    BigInt64Array: false,
    BigUint64Array: false,
    URL: false,
    Atomics: false,
    SharedArrayBuffer: false,
    globalThis: false,
    FinalizationRegistry: false,
    WeakRef: false,
    queueMicrotask: false,
  },
};
