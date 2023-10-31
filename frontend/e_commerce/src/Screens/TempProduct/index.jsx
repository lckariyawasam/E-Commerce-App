import React, { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { Link } from 'react-router-dom';
import axios from 'axios';

const TempProduct = () => {
    const navigate = useNavigate();
    const { id } = useParams();

    const [quantity, setQuantity] = useState(0);
    const [product, setProduct] = useState({});

    const [loading, setLoading] = useState(true);

    const handleInput1Change = (event) => {
        setQuantity(parseInt(event.target.value));
    };

    const loadProduct = () => {
        axios.get(`http://localhost:5000/product/${id}`, {
            withCredentials: true,
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
        .then(res => {
            setProduct(res.data)
            console.log(res.data)
            setLoading(false)
        })
        .catch(err => {
            console.log(err)
            setLoading(false)
        })
    }

    const addToCart = (variant_id) => {
        axios.post('http://localhost:5000/cart/add',
        {
            "variant_id": variant_id,
            "quantity": quantity
        },
        {
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            },
            withCredentials: true,
        })
        .then(res => {
            if (res.status === 200) {
                navigate('/cart')
            }
        })
        .catch(err => {
            console.log(err)
            console.log({
                "variant_id": variant_id,
                "quantity": quantity
            })
        })
    }


    useEffect(() => {
        loadProduct()
    }, [])



    return (
        <div>
            <Link to={'/products'}>Back to Products</Link>
            {loading && <h1>Loading...</h1>}
            {Object.keys(product).length !== 0 &&
                <div> 
                    <h1>{product.title}</h1>
                    <label>
                       Quantity:
                        <input type="number" value={quantity} onChange={handleInput1Change} />
                    </label>
                    {product.variants && product.variants.map((variant) => {
                        return (
                            <div key={variant.variant_id}>
                                <p>{product.Variant_attribute_type_1}: {variant.variant_attribute_value_1}</p>
                                <p>{product.Variant_attribute_type_2}: {variant.variant_attribute_value_2}</p>
                                <p> <b>Price: ${variant.price} </b></p>
                                <button disabled={quantity === 0} onClick={() => addToCart(variant.variant_id)} >Add to cart</button>
                                <br />
                            </div>
                        )
                    })}
                </div>
            }
            {
                !loading && Object.keys(product).length === 0 &&
                <h1>Product not found</h1>
            }
        </div>
    );
};

export default TempProduct;
