import React from 'react';
import './index.css';

const Navbar = ({ isLoggedIn }) => {
    return (
        <nav className="navbar navbar-expand-lg navbar-light bg-light sticky-top">
            <a className="navbar-brand" href="/">Your Brand</a>

            <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span className="navbar-toggler-icon"></span>
            </button>

            <div className="collapse navbar-collapse" id="navbarNav">
                <ul className="navbar-nav mr-auto">
                    <li className="nav-item">
                        <a className="nav-link" href="/"><i className="fa fa-home"></i> Home</a>
                    </li>
                    <li className="nav-item">
                        <a className="nav-link" href="/cart"><i className="fa fa-shopping-cart"></i> Cart</a>
                    </li>
                    {isLoggedIn ? (
                        <li className="nav-item">
                            <a className="nav-link" href="/profile"><i className="fa fa-user"></i> Profile</a>
                        </li>
                    ) : (
                        <li className="nav-item">
                            <a className="nav-link" href="/login"><i className="fa fa-user"></i> Login/Register</a>
                        </li>
                    )}
                </ul>
                <form className="form-inline ml-auto">
                    <input className="form-control" type="search" placeholder="Search" aria-label="Search" />
                    <button className="btn btn-outline-success ml-2" type="submit"><i className="fa fa-search"></i></button>
                </form>
            </div>
        </nav>
    );
}

export default Navbar;
