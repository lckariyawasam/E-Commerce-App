import React, { useEffect, useState } from "react";
import "./index.css";
import axios from "axios";
import { useSearchParams, Link } from "react-router-dom";

function UserOrders() {
    const [orderItems, setOrderItems] = useState([]);
    const [deliveryDays, setDeliveryDays] = useState(0);

    const [searchParams] = useSearchParams();

    const orderId = searchParams.get("order");

    console.log("order id", orderId);

    const loadData = () => {
        axios.post('http://localhost:5000/user/order',
        {
            "order_id": orderId
        },
        {
        withCredentials: true,
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
            }
        })
        .then(res => {
            setOrderItems(res.data.cart_items);
            setDeliveryDays(res.data.estimated_delivery_date);
            console.log(res.data);
        })
        .catch(err => console.log(err));
    }

    useEffect(loadData, []);

    const calculateTotal = () => {
        return orderItems.reduce((acc, item) => acc + (parseFloat(item.price) * item.quantity), 0);
    };

    return (
        <div className="vh-100">
            {orderItems.length === 0 ? (
                <div className="no-data">Your order list is empty.</div>
                ) : (
                    <div>
                <div className="cart">
                    <h2>Order #{orderId}</h2>
                <span className="cart-item">Estimated Delivery Days: {deliveryDays} </span>
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
                <div className="cart-total">
                    <strong>Total: ${calculateTotal().toFixed(2)}</strong>
                </div>
                <Link to="/profile">Back to Orders</Link>
                </div>
                </div>
            )}
        </div>
    );
}

export default UserOrders;
