import React, { useState } from 'react';

import './index.css';

const Cart = () => {
  const [cartItems, setCartItems] = useState([
    {
      id: 1,
      name: 'Product 1',
      price: 19.99,
      quantity: 2,
    },
    {
      id: 2,
      name: 'Product 2',
      price: 29.99,
      quantity: 1,
    },
  ]);

  const removeItem = (itemId) => {
    const updatedCart = cartItems.filter((item) => item.id !== itemId);
    setCartItems(updatedCart);
  };

  const calculateTotal = () => {
    return cartItems.reduce((total, item) => total + item.price * item.quantity, 0);
  };

  return (
    <div className="cart">
      <h2>Your Cart</h2>
      {cartItems.length === 0 ? (
        <p>Your cart is empty.</p>
      ) : (
        <ul className="cart-items">
          {cartItems.map((item) => (
            <li key={item.id} className="cart-item">
              <div className="item-details">
                <span>{item.name}</span>
                <span>${item.price.toFixed(2)}</span>
                <span>Quantity: {item.quantity}</span>
              </div>
              <button onClick={() => removeItem(item.id)} className="remove-button">
                Remove
              </button>
            </li>
          ))}
        </ul>
      )}
      <div className="cart-total">
        <strong>Total: ${calculateTotal().toFixed(2)}</strong>
      </div>
    </div>
  );
};

export default Cart;
