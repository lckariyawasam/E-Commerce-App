import React, { useEffect, useState } from 'react';
import "./index.css";

import electronics_banner from './images/electronics.png';
import toys_banner from './images/toys.png';
import food_banner from './images/food.png';
import cosmetics_banner from './images/cosmetics.png';
import furniture_banner from './images/furniture.png';
import pet_banner from './images/pet.png';

const BannerCarousel = () => {

    const [initialLoad, setInitialLoad] = useState(true);

    useEffect(() => {
        if (initialLoad) {
            const timer = setTimeout(() => {
                setInitialLoad(false);
            }, 1000);
    
            return () => clearTimeout(timer);
        }
    }, [initialLoad]);

    return (
        <div id="carouselExample" className="carousel slide" data-bs-ride="carousel">
            {/* Carousel Indicators */}
            <ol className="carousel-indicators">
                <li data-bs-target="#carouselExample" data-bs-slide-to="0" className="active"></li>
                <li data-bs-target="#carouselExample" data-bs-slide-to="1"></li>
                <li data-bs-target="#carouselExample" data-bs-slide-to="2"></li>
                <li data-bs-target="#carouselExample" data-bs-slide-to="3"></li>
                <li data-bs-target="#carouselExample" data-bs-slide-to="4"></li>
                <li data-bs-target="#carouselExample" data-bs-slide-to="5"></li>
            </ol>
            <div className="carousel-inner">
                <div className={`carousel-item active carousel-item-image-container ${initialLoad ? 'initial-load-animation' : ''}`}>
                    <img src={electronics_banner} className="carousel-image d-block w-100" alt="Electronics" />
                </div>
                <div className="carousel-item carousel-item-image-container">
                    <img src={toys_banner} className="carousel-image d-block w-100" alt="Toys" />
                </div>
                <div className="carousel-item carousel-item-image-container">
                    <img src={food_banner} className="carousel-image d-block w-100" alt="Food" />
                </div>
                <div className="carousel-item carousel-item-image-container">
                    <img src={cosmetics_banner} className="carousel-image d-block w-100" alt="Cosmetics" />
                </div>
                <div className="carousel-item carousel-item-image-container">
                    <img src={furniture_banner} className="carousel-image d-block w-100" alt="Furniture" />
                </div>
                <div className="carousel-item carousel-item-image-container">
                    <img src={pet_banner} className="carousel-image d-block w-100" alt="Pet" />
                </div>
            </div>
            <button className="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                <span className="carousel-control-prev-icon" aria-hidden="true"></span>
                <span className="visually-hidden">Previous</span>
            </button>
            <button className="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                <span className="carousel-control-next-icon" aria-hidden="true"></span>
                <span className="visually-hidden">Next</span>
            </button>
        </div>
    );
}

export default BannerCarousel;
