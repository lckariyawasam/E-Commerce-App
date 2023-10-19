import React from 'react';
import './index.css';
import { Link } from 'react-router-dom';

const LoginPage = () => {
    return (
        <div className='login-page'>
            <div className='login-form'>
                <h1 className='login-heading'>Login</h1>
                <input className='input-field' placeholder='Email' type="email" />
                <input className='input-field' placeholder='Password' type="password" />
                <button className='login-button'>Sign In</button>
            </div>
            <div className='login-links'>
                <Link to="/">Home</Link>
                <Link to="/register">Register</Link>
            </div>
        </div>
    );
};

export default LoginPage;
