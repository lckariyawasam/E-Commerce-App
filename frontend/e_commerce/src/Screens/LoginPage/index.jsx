import React, { useRef, useState } from 'react';
import './index.css';

import { Link, useNavigate } from 'react-router-dom';
import axios from 'axios';

const LoginPage = ({ callback }) => {
    const usernameRef = useRef();
    const passwordRef = useRef();

    const navigate = useNavigate();

    const [loginFailed, setLoginFailed] = useState(false);

    console.log(callback)

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
                console.log(res.data)
                callback(res.data.user_type)
                if (res.data.user_type === "Admin") {
                    navigate('/admin')
                } else if (res.data.user_type === "Inventory Manager") {
                    navigate('/inventory')
                } else {
                    navigate('/')
                }
            }
        })
        .catch(err => {
            setLoginFailed(true)
            console.log(err)
        })
    
    }


    return (
        <div className='login-page'>
            <div className='login-form'>
                <h1 className='login-heading'>Login</h1>
                {loginFailed && <h3>Invalid Credentials, Try again</h3>}
                <input name='email' className='input-field' ref={usernameRef} placeholder='Email' type="email" />
                <input name='password' className='input-field' ref={passwordRef} placeholder='Password' type="password" />
                <button className='login-button' onClick={authenticate}>Sign In</button>
                <p></p>
                <p>Don't have an account? <Link to="/register">Register</Link> </p>
            </div>
        </div>
    );
};

export default LoginPage;
