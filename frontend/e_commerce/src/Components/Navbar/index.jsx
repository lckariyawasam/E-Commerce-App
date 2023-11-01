import React from 'react';
import './index.css';

import axios from 'axios';
import { useNavigate, Link } from 'react-router-dom';

import SearchBar from '../SearchBar';

const Navbar = ({ userType, callback }) => {

    const isLoggedIn = userType !== "Guest"

    const navigate = useNavigate();

    const logout = () => {
        axios.get('http://localhost:5000/logout', {
            withCredentials: true,
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
        .then(res => console.log(res))

        // Set the user type to guest when logging out 
        callback("Guest")
        navigate('/login')

    }

   return (
    <nav className="navbar navbar-expand-lg navbar-light bg-light sticky-top">
        <Link className="navbar-brand" href="/">Your Brand</Link>

        <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span className="navbar-toggler-icon"></span>
        </button>

        <div className="collapse navbar-collapse" id="navbarNav">
            <ul className="navbar-nav mr-auto">
                <li className="nav-item">
                    <Link className="nav-link" to="/"><i className="fa fa-home"></i> Home</Link>
                </li>
                {
                    userType === "Admin" ? (
                        <li className="nav-item">
                            <Link className="nav-link" to="/admin"><i className="fa fa-tachometer"></i> Admin Panel </Link>
                        </li>
                    ) : (
                        <li className="nav-item">
                            <Link className="nav-link" to="/cart"><i className="fa fa-shopping-cart"></i> Cart </Link>
                        </li>
                    )
                }
                {isLoggedIn ? (
                    <>
                    <li className="nav-item">
                        <Link className="nav-link" to="/profile"><i className="fa fa-user"></i> Profile</Link>
                    </li>
                    <li className="nav-item">
                        <a className="nav-link" onClick={logout}><i className="fa fa-sign-out"></i> Logout </a>
                    </li>
                    </>
                    
                ) : (
                    <li className="nav-item">
                        <Link className="nav-link" to="/login"><i className="fa fa-user"></i> Login/Register</Link>
                    </li>
                )}
            </ul>
        <SearchBar isStrictSelection={false} endpoint={"products"}/>
        </div>
    </nav>
   );
}

export default Navbar;
