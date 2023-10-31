import React from 'react';
import './index.css';
import { Link } from 'react-router-dom';

const RegisterPage = () => {
    return (
        <div className='register-page'>
            <div className='login-form'>
                <h1 className='login-heading'>Register</h1>
                <div className='name-fields'>
                    <input className='input-field' placeholder='First Name' type="text" />
                    <input className='input-field' placeholder='Last Name' type="text" />
                </div>
                <input className='input-field' placeholder='Email' type="email" />
                <input className='input-field' placeholder='Password' type="password" />
                <input className='input-field' placeholder='Phone Number' type="tel" />
                <input className='input-field' placeholder='Address Line 01' type="text" />
                <div className='name-fields'>
                    <input className='input-field' placeholder='City' type="text" />
                    <input className='input-field' placeholder='Zip-Code' type="text" />
                </div>
                <div className='name-fields'>
                    <input className='input-field' placeholder='State/Province' type="text" />
                    <input className='input-field' placeholder='Country' type="text" />
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
