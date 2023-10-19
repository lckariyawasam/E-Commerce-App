import React from 'react';
import './index.css';
import { Link } from 'react-router-dom';

const RegisterPage = () => {
    return (
        <div className='register-page'>
            <div className='login-form'>
                <h1 className='login-heading'>Register</h1>
                <div className='name-fields'>
                    <input className='input-field name-field ' placeholder='First Name' type="text" />
                    <input className='input-field name-field' placeholder='Last Name' type="text" />
                </div>
                <input className='input-field' placeholder='Email' type="email" />
                <input className='input-field' placeholder='Password' type="password" />
                <input className='input-field' placeholder='Phone Number' type="tel" />
                <div className='name-fields'>
                    <input className='input-field name-field ' placeholder='Address Line 01' type="text" />
                    <input className='input-field name-field' placeholder='City' type="text" />
                </div>
                <div className='name-fields'>
                    <input className='input-field name-field ' placeholder='State' type="text" />
                    <input className='input-field name-field' placeholder='Country' type="text" />
                </div>
                <button className='login-button'>Sign Up</button>
            </div>
            <div className='login-links'>
                <Link to="/">Home</Link>
                <Link to="/login">Login</Link>
            </div>
        </div>
    );
};

export default RegisterPage;
