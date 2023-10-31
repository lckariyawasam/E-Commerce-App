import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const TempProducts = () => {
    const [products, setProducts] = useState([])
    const navigate = useNavigate();
    
    const loadProducts = () => {
        axios.get('http://localhost:5000/products', {
            withCredentials: true,
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
        .then(res => {
            console.log(res.data)
            setProducts(res.data)

        })
        .catch(err => console.log(err))
    }

    useEffect(() => {
        loadProducts()
    }, [])


    return (
        <div>
            {products.map((product, index) => (
                <div key={index} className="card">
                    <div className="card-body">
                        <h5 className="card-title">{product.title} <button onClick={() => navigate(`/product/${product.product_id}`)}>View Product</button> </h5>
                        <h6 className="card-subtitle mb-2 text-muted">{product.brand}</h6>
                        <p className="card-text">{product.description}</p>
                    </div>
                </div>
            ))}
        </div>
    );
};

export default TempProducts;
