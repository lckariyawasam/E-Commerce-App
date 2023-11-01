import React from "react";
import "./index.css";

const Navbar = ({ isLoggedIn }) => {
  return (
    <nav className="navbar navbar-expand-lg navbar-custom sticky-top">
      <a className="navbar-brand" href="/">
        C-Enterprise
      </a>

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

      <div className="collapse navbar-collapse" id="navbarNav">
        <ul className="navbar-nav mr-auto">
          <li className="nav-item">
            <a className="nav-link" href="/">
              <i className="fa fa-home"></i> Home
            </a>
          </li>
          <li className="nav-item">
            <a className="nav-link" href="/cart">
              <i className="fa fa-shopping-cart"></i> Cart
            </a>
          </li>
          {isLoggedIn ? (
            <li className="nav-item">
              <a className="nav-link" href="/profile">
                <i className="fa fa-user"></i> Profile
              </a>
            </li>
          ) : (
            <li className="nav-item">
              <a className="nav-link" href="/login">
                <i className="fa fa-user"></i> Login/Register
              </a>
            </li>
          )}
        </ul>
        <SearchBar isStrictSelection={false} endpoint={"products"} />
      </div>
    </nav>
  );
};

export default Navbar;
