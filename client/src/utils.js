/* eslint-disable import/prefer-default-export */
export const checkValidity = (value, rules) => {
  let isValid = true;

  if (rules.required) {
    isValid = value.trim() !== '' && isValid;
  }

  if (rules.minLength) {
    isValid = value.length >= rules.minLength && isValid;
  }

  if (rules.maxLength) {
    isValid = value.length <= rules.maxLength && isValid;
  }

  if (rules.isEmail) {
    // eslint-disable-next-line
    const pattern = /([\w\.\-_]+)?\w+@[\w-_]+(\.\w+){1,}/gi;
    isValid = pattern.test(value) && isValid;
  }

  return isValid;
};

export const validate = values => {
  const errors = {};

  if (!values.email) {
    errors.email = 'Введите адрес электронной почты';
  } else if (!/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i.test(values.email)) {
    errors.email = 'Invalid email address';
  }

  if (!values.password) {
    errors.password = 'Введите пароль';
  } else if (values.password.length < 6) {
    errors.password = 'Password too short (minimum 6 characters)';
  }

  return errors;
};
