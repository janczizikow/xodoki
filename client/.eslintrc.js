module.exports = {
  'parser': 'babel-eslint',
  'env': {
    'browser': true,
    'jest': true,
    'es6': true,
    'node': true,
  },
  'extends': [
    'airbnb',
    'prettier',
  ],
  'plugins': [
    'prettier',
  ],
  'rules': {
    'strict': 0,
    'react/jsx-filename-extension': 0,
    'prettier/prettier': 'error',
    'jsx-a11y/label-has-associated-control': [ 'error', {
      'components': [ 'Label' ],
      'required': {
          'some': [ 'nesting', 'id' ]
      },
    }],
    'jsx-a11y/label-has-for': [ 2, {
      'components': [ 'Label' ],
      'required': {
          'some': [ 'nesting', 'id' ]
      },
      'allowChildren': false
    }],
  },
}