import React from "react";
import "./index.css";
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
    <nav className="navbar navbar-expand-lg navbar-custom sticky-top">
      <Link className="navbar-brand" to="/">
        C-Enterprise
      </Link>

      <button
        className="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarNav"
        aria-controls="navbarNav"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span className="navbar-toggler-icon"></span>
      </button>
{/* 
   return (
    <nav className="navbar navbar-expand-lg navbar-light bg-light sticky-top">
        <Link className="navbar-brand" to="/">Your Brand</Link> */}

      <div className="collapse navbar-collapse" id="navbarNav">
        <ul className="navbar-nav">
          <li className="nav-item">
            <Link className="nav-link" to="/">
              <i className="fa fa-home"></i> Home
            </Link>
          </li>
          {
            userType === "Admin" ? (
                <li className="nav-item">
                    <Link className="nav-link" to="/admin">
                    <i className="fa fa-tachometer"></i> Admin Panel
                    </Link>
                </li>
                ) : (
                <li className="nav-item">
                    <Link className="nav-link" to="/cart">
                    <i className="fa fa-shopping-cart"></i> Cart
                    </Link>
                </li>
                )
          }
          {/* <li className="nav-item">
            <Link className="nav-link" to="/cart">
              <i className="fa fa-shopping-cart"></i> Cart
            </Link>
          </li> */}

          {isLoggedIn ? (
            <>
              <li className="nav-item">
                <Link className="nav-link" to="/profile">
                  <i className="fa fa-user"></i> Profile
                </Link>
              </li>
              <li className="nav-item">
                <a className="nav-link" onClick={logout}>
                  <i className="fa fa-sign-out"></i> Sign Out
                </a>
              </li>
              {/* <li className="nav-item greeting">
                <span className="nav-link">Hello, </span>
              </li> */}
            </>
          ) : (
            <li className="nav-item">
              <Link className="nav-link" to="/login">
                <i className="fa fa-user"></i> Login/Register
              </Link>
            </li>
          )}
        </ul>
        <form className="form-inline">
          {/* <input
            className="form-control mr-sm-2"
            type="search"
            placeholder="Search"
            aria-label="Search"
          /> */}
            <SearchBar isStrictSelection={false} endpoint={"products"}/>
          {/* <button className="btn btn-outline-light my-2 my-sm-0" type="submit">
            <i className="fa fa-search"></i>
          </button> */}
        </form>
      </div>
        {/* <div className="collapse navbar-collapse" id="navbarNav">
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
                        <Link className="nav-link" onClick={logout}><i className="fa fa-sign-out"></i> Logout </Link>
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
        </div> */}
    </nav>
  );
};

export default Navbar;
