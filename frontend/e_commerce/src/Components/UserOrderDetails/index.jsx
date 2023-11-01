import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import "./index.css";
import axios from "axios";

function UserOrderDetails() {
    const [orders, setOrders] = useState([]);

    const loadData = () => {
        axios.get('http://localhost:5000/user/orders', {
            withCredentials: true,
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
        .then(res => {
            console.log("orders", res.data);
            setOrders(res.data);
        })
        .catch(err => console.log(err));
    }

    useEffect(loadData, []);
    
    return (
        <div className="">
            {orders.length === 0 ? 
                <div className="no-data">No data available</div>
                : <h2>My Orders</h2>
            }
            <table className="sales-table">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Payment Type</th>
                        <th>Order Date</th>
                        <th>Status</th>
                        <th>View More</th>
                    </tr>
                </thead>
                <tbody>
                    {orders.map((order) => (
                        <tr key={order.order_id}>
                            <td>{order.order_id}</td>
                            <td>{order.payment_type}</td>
                            <td>{order.order_date}</td>
                            <td>{order.status}</td>
                            <td><Link className="link-button" to={`/userorder?order=${order.order_id}`} >Details</Link></td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}
    
export default UserOrderDetails;
