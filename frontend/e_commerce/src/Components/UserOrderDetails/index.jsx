import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import "./index.css";
import axios from "axios";

function UserOrderDetails() {
    const [orders, setOrders] = useState([]);

    const loadData = () => {
        axios.get('http://localhost:5000/admin/orders', {
            withCredentials: true,
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
        .then(res => {
            console.log(res.data);
            setOrders(res.data);
        })
        .catch(err => console.log(err));
    }

    useEffect(loadData, []);
    
    return (
        <div className="vh-100">
            {orders.length === 0 ? 
                <div className="no-data">No data available</div>
                : <h2>User Order Details</h2>
            }
            <table className="sales-table">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Payment Type</th>
                        <th>Order Date</th>
                        <th>Status</th>
                        <th>Price</th>
                        <th>Link</th>
                    </tr>
                </thead>
                <tbody>
                    {orders.map((order) => (
                        <tr key={order.order_id}>
                            <td>{order.order_id}</td>
                            <td>{order.payment_type}</td>
                            <td>{order.order_date}</td>
                            <td>{order.status}</td>
                            <td>{order.cart_id}</td>
                            <td><button className="btn btn-outline-dark"><Link className="link-button" to={`http://localhost:5000/user/something`} >Details</Link></button></td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}
    
export default UserOrderDetails;
