import React from 'react';
import './index.css';

import { Link } from 'react-router-dom';


const RegisterPage = () => {
    return (
        <div className='register-page'>
            <input placeholder='name' type="text" />
            <input placeholder='username' type="text" />
            <input placeholder='password' type="text" />
            <button>Register</button>
            <h1>This is the Register Page</h1>
            <Link to={"/"}>Home</Link>
            <Link to={"/login"}>Login</Link>
        </div>
    );
};

export default RegisterPage;
