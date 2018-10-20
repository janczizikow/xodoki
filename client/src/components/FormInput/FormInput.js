import React from 'react';
import Label from '../Label';
import Input from '../Input';
import classes from './FormInput.module.scss';

const FormInput = ({ input, label, type, rows, meta: { touched, error } }) => (
  <div className={classes.FormInput}>
    <Label invalid={touched && error} htmlFor={input.name}>
      {label}
    </Label>
    <Input {...input} rows={rows} invalid={touched && error} type={type} />
    {error &&
      touched && <span className={classes.FormInput__errorMsg}>{error}</span>}
  </div>
);

export default FormInput;
