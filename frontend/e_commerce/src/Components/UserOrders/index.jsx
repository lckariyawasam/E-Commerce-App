import React, { useEffect, useState } from "react";
import "./index.css";
import axios from "axios";

function UserOrders() {
    const [orderItems, setOrderItems] = useState([]);

    const loadData = () => {
        axios.get('http://localhost:5000/user/orders', { // Update this to your actual endpoint
            withCredentials: true,
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
        .then(res => {
            setOrderItems(res.data);
        })
        .catch(err => console.log(err));
    }

    useEffect(loadData, []);

    const calculateTotal = () => {
        return orderItems.reduce((acc, item) => acc + (parseFloat(item.price) * item.quantity), 0);
    };

    return (
        <div className="vh-100">
            <h2>User Order List</h2>
            {orderItems.length === 0 ? (
                <div className="no-data">Your order list is empty.</div>
            ) : (
                <div>
                <span>Estimated De;livery Time: </span>
                <ul className="cart-items">
                    {orderItems.map((item) => (
                        <li key={item.cart_item_id} className="cart-item">
                            <div className="item-details">
                                <span>{item.title}</span>
                                <span>Quantity: {item.quantity}</span>
                                <span>Unit Price: ${parseFloat(item.price).toFixed(2)}</span>
                            </div>
                            <span>${(parseFloat(item.price) * item.quantity).toFixed(2)}</span>
                        </li>
                    ))}
                </ul>
                </div>
            )}
            <div className="cart-total">
                <strong>Total: ${calculateTotal().toFixed(2)}</strong>
            </div>
        </div>
    );
}

export default UserOrderList;
