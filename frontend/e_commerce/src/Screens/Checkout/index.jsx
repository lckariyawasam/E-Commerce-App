import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

import './index.css';

const Checkout = () => {
  const [cartItems, setCartItems] = useState([])
  const [paymentMethod, setPaymentMethod] = useState('')
  const [outOfStockItems, setOutOfStockItems] = useState(false)
  const [force_checkout, setForceCheckout] = useState(false)

  const navigate = useNavigate()

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
    }
    )
  }

  const handleCheckout = () => {

    if (paymentMethod === '') {
      alert('Please select a payment option')
      return
    } 

    axios.post('http://localhost:5000/cart/checkout',
    {
        "payment_method": paymentMethod,
        "force_checkout": force_checkout
    },
    {
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      withCredentials: true,
    })
    .then(res => {
      console.log(res)
      if (res.status === 200) {
        alert('Order Confirmed')
        navigate('/')
      }
    }
    )
    .catch(err => {
      console.log(err)
      if (err.response.status === 404) {
        setOutOfStockItems(true)
        if (window.confirm("Some items in your cart are out of stock. Do you want to proceed?")) {
          console.log("This bugger wants to continue")
          setForceCheckout(true)
        } else {
          navigate(`/cart?outOfStock=true&outOfStockVariant=${err.response.data.insufficient_stock_variant_id}`)
        }
      }
    }
    )
  }

  useEffect(() => {
    if (force_checkout) {
      handleCheckout()
    }
  }, [force_checkout])

  const calculateTotal = () => {
    return cartItems.reduce((total, item) => total + item.price * item.quantity, 0);
  };


  useEffect(() => {
    loadCart()
  }, [])


  return (
    <div className="checkout-page">
        <div className="cart">
        <h2>Order</h2>
        {cartItems.length === 0 ? (
            <p>Your cart is empty.</p>
        ) : (
            <ul className="cart-items">
            {cartItems.map((item) => (
                <li key={item.cart_item_id} className="cart-item">
                <div className="item-details">
                    <span>{item.title}</span>
                    <span>Quantity: {item.quantity}</span>
                    <span>Unit Price: ${parseFloat(item.price).toFixed(2)}</span>
                </div>
                    <span>${parseFloat(item.price).toFixed(2) * item.quantity}</span>
                </li>
            ))}
            </ul>
        )}
        <div className="cart-total">
            <strong>Total: ${calculateTotal().toFixed(2)}</strong>
        </div>
        {/* Add a dropdown menu to select payment option */}
        <div className="payment-method">    
            <label className=''>Payment Option</label>
            <select className='payment-input' disabled={outOfStockItems} onChange={(e) => setPaymentMethod(e.target.value)} value={paymentMethod}>
                <option value="" disabled>Select Payment Option</option>
                <option value="Cash">Cash</option>
                <option value="Credit Card">Credit Card</option>
                <option value="Debit Card">Debit Card</option>
            </select>
        </div>
        {
            !outOfStockItems ?
            <button onClick={handleCheckout} disabled={cartItems.length === 0} className="checkout-button">
                        Confirm & Checkout
            </button>
            :
            <p className="out-of-stock">Checking out with out of stock items ... Please Wait</p>
        }
        </div>
    </div>
  );
};

export default Checkout;
