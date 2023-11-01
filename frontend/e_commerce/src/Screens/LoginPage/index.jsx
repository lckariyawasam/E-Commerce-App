import React, { useRef, useState } from 'react';
import './index.css';

import { Link, useNavigate } from 'react-router-dom';
import axios from 'axios';

const LoginPage = () => {
    const usernameRef = useRef();
    const passwordRef = useRef();

    const navigate = useNavigate();

    const [loginFailed, setLoginFailed] = useState(false);

    const authenticate = async () => {
        axios.post('http://localhost:5000/login', 
        {
            "email" : usernameRef.current.value,
            "password" : passwordRef.current.value
        }, 
        {
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            },
            withCredentials: true,
        })
        .then(res => {
            if (res.status === 200) {
                navigate('/')
            }
            console.log(res)
        })
        .catch(err => setLoginFailed(true))
    
    }

    const logout = () => {
        axios.get('http://localhost:5000/logout', {
            withCredentials: true,
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
        .then(res => console.log(res))
    }


    return (
        <div className='login-page'>
            <div className='login-form'>
                <h1 className='login-heading'>Login</h1>
                {loginFailed && <h3>Invalid Credentials, Try again</h3>}
                <input name='email' className='input-field' ref={usernameRef} placeholder='Email' type="email" />
                <input name='password' className='input-field' ref={passwordRef} placeholder='Password' type="password" />
                <button className='login-button' onClick={authenticate}>Sign In</button>
            </div>
        </div>
    );
};

export default LoginPage;
