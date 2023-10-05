import React from 'react';
import './index.css';

import { Link } from 'react-router-dom';

const HomePage = () => {
    return (
        <div className='home-page'>
            <h1>This is the HomePage</h1>
            <Link to={"/register"}>Register</Link>
            <Link to={"/login"}>Login</Link>
        </div>
    );
};

export default HomePage;
