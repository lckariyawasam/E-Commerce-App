import React, {useEffect, useState} from "react";
import "./index.css";
import axios from "axios";
import UserDetails from "../../Components/UserDetails";
import UserOrderDetails from "../../Components/UserOrderDetails";
// import { set } from "date-fns";


    // const salesData = 	[
	// 	{
	// 		"order_id": 2,
	// 		"cart_id": 2,
	// 		"user_id": 6,
	// 		"payment_type": "PayPal",
	// 		"user_type": "Guest",
	// 		"order_date": "2023-10-11",
	// 		"status": "Shipped"
	// 	},

	// 	{
	// 		"order_id": 1,
	// 		"cart_id": 1,
	// 		"user_id": 1,
	// 		"payment_type": "Credit Card",
	// 		"user_type": "Registered",
	// 		"order_date": "2023-10-12",
	// 		"status": "Processing"
	// 	}

	
    // ];

    function CustomerSalesReport() {
        const [selectedOrder, setSelectedOrder] = useState(null);
        const [salesData, setSalesData] = useState([]);
    
        // const handleOrderSelection = (userId) => {
        //     const order = salesData.find(o => o.user_id.toString() === userId);
        //     setSelectedOrder(order);
        // };

        const loadData = () => {
            axios.get('http://localhost:5000/user/orders', {
                withCredentials: true,
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                }
            })
            .then(res => {
                console.log(res.data)
                setSalesData(res.data)
            })
            .catch(err => console.log(err))
        }

        useEffect(loadData, [])

    
        return (
            <div className="vh-100">
                <UserOrderDetails id="2"/>
                {/* <UserDetails id="2"/> */}
            </div>
        );
    }
    
    export default CustomerSalesReport;