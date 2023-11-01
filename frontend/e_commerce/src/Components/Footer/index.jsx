import React from "react";
import "./index.css";

const Footer = () => {
  return (
    <footer className="footer-distributed">
      <div className="footer-container">
        <div className="footer-section">
          <h3>
            About<span> C-Enterprise</span>
          </h3>
          <p className="footer-links">
            <a href="#">Home</a>
            <span> | </span>
            <a href="#">Blog</a>
            <span> | </span>
            <a href="#">Pricing</a>
            <span> | </span>
            <a href="#">About</a>
            <span> | </span>
            <a href="#">Faq</a>
            <span> | </span>
            <a href="#">Contact</a>
          </p>
          <p className="footer-company-name">C-enterprise © 2023</p>
        </div>

        <div className="footer-section">
          <div>
            <i className="fa fa-map-marker"></i>
            <p>
              <span>21 Revolution Street</span> Austin, Texas
            </p>
          </div>

          <div>
            <i className="fa fa-phone"></i>
            <p>+1 555 123456</p>
          </div>

          <div>
            <i className="fa fa-envelope"></i>
            <p>
              <a href="mailto:support@company.com">support@centerprise.com</a>
            </p>
          </div>
        </div>

        <div className="footer-section">
          <p className="footer-company-about">
            <span>About: </span>
            C-Enterprise is the next step for the well-established Texan
            retailer, C, as it leverages technology to stay competitive in the
            era of Amazon.
          </p>

          <div className="footer-icons">
            <a href="#">
              <i className="fa fa-facebook"></i>
            </a>
            <a href="#">
              <i className="fa fa-twitter"></i>
            </a>
            <a href="#">
              <i className="fa fa-linkedin"></i>
            </a>
          </div>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
