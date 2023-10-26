import React from 'react';
import './index.css';

const Footer = () => {
    return (
        <footer className="bg-light text-center text-lg-start mt-auto">
            <div className="text-center p-3" style={{
                backgroundColor: 'rgba(0, 0, 0, 0.01)',
                color: 'black'
            }}>
                <p>© 2020 Copyright:</p>
                <a className="text-dark" href="https://brand.com/">Brand</a>
            </div>
        </footer>
    );
}

export default Footer;

