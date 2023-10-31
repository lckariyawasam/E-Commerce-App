import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useNavigate, useSearchParams } from 'react-router-dom';

import './index.css';

const Cart = () => {
  const [cartItems, setCartItems] = useState([])

  const navigate = useNavigate()
  const [searchParams, setSearchParams] = useSearchParams();

  const outOfStock = searchParams.get('outOfStock');
  const outOfStockVariant = searchParams.get('outOfStockVariant');

  console.log(outOfStock, outOfStockVariant)

  const loadCart =() => {
    axios.get('http://localhost:5000/cart', {
      withCredentials: true,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }
    }
    )
    .then(res => {
      setCartItems(res.data)
      console.log(res.data)
    }
    )
  }

  const removeItem = (cart_item_id) => {
    const updatedCart = cartItems.filter((item) => item.cart_item_id !== cart_item_id);
    setCartItems(updatedCart);

    axios.post('http://localhost:5000/cart/remove',
    {
      "cart_item_id": cart_item_id,
    },
    {
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      withCredentials: true,
    })
    .then(res => {
      if (res.data.status === 'success') {
        loadCart()
      }
    })

  };

  // const handleCheckout = () => {

  //   console.log('handleCheckout')

  //   axios.post('http://localhost:5000/cart/checkout',
  //   {},
  //   {
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json'
  //     },
  //     withCredentials: true,
  //   })
  //   .then(res => {
  //     console.log(res)
  //     if (res.status === 200) {
  //       loadCart()
  //     }
  //   }
  //   )
  //   .catch(err => {
  //     console.log(err)
  //   }
  //   )
  // }

  const calculateTotal = () => {
    return cartItems.reduce((total, item) => total + item.price * item.quantity, 0);
  };


  useEffect(() => {
    loadCart()
  }, [])


  return (
    <div className="cart">
      <h2>Your Cart</h2>
      {cartItems.length === 0 ? (
        <p>Your cart is empty.</p>
      ) : (
        <ul className="cart-items">
          {cartItems.map((item) => (
            <li key={item.cart_item_id} className="cart-item">
              <div className="item-details">
                <span>{item.title}</span>
                <span>${parseFloat(item.price).toFixed(2)}</span>
                <span>Quantity: {item.quantity}</span>
              </div>
              <div className="remove-out-of-stock"> 
                <button onClick={() => removeItem(item.cart_item_id)} className="remove-button">
                  Remove
                </button>
                {outOfStock && parseInt(outOfStockVariant) == item.variant_id && (
                  <span>Out of Stock </span>
                )}
              </div>
            </li>
          ))}
        </ul>
      )}
      <div className="cart-total">
        <strong>Total: ${calculateTotal().toFixed(2)}</strong>
      </div>
      <button onClick={() => navigate("/billing")} disabled={cartItems.length === 0} className="checkout-button">
                Proceed to Checkout
      </button>
    </div>
  );
};

export default Cart;
