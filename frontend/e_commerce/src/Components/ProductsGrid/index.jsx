import React from 'react';
import { Link, NavLink } from 'react-router-dom';
import "./index.css";

const FeaturedProducts = ({ products }) => {
    return (
<div className="container mt-5">


    <div className="row">
        {products.map((item, index) => (
            <div className="col-sm-12 col-md-4 mb-4" key={index}>
                <div className="card h-100 shadow-sm"> {/* Added shadow for a modern look */}
                    <Link to={`/product/${item.product_id}`}>
                        <img src={item.icon} className="card-img-top" alt={item.title} loading='lazy' style={{
                             width: '100%',
                              objectFit: 'cover',
                               height: '200px',
                               backgroundColor: "rgba(246, 246, 247, 0.99)",
                        }} />
                    </Link>
                    <div className="card-body d-flex flex-column justify-content-between"> {/* Flex column to push button to bottom */}
                        <div>
                            <h5 className="card-title">{item.title}</h5>
                            {/* <p className="card-text">${item.price}</p> */}
                        </div>
                        <Link to={`/product/${item.product_id}`} className="btn btn-outline-dark mt-2">View Product</Link>
                    </div>
                </div>
            </div>
        ))}
    </div>
</div>




    );
}

export default FeaturedProducts;


