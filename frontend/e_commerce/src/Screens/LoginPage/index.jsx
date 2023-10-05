import React from 'react';
import './index.css';

import { Link } from 'react-router-dom';


const LoginPage = () => {
    return (
        <div className='login-page'>
            <input placeholder='username' type="text" />
            <input placeholder='password' type="text" />
            <button>Login</button>
            <h1>This is the Login Page</h1>
            <Link to={"/"}>Home</Link>
            <Link to={"/register"}>Register</Link>
        </div>
    );
};

export default LoginPage;
