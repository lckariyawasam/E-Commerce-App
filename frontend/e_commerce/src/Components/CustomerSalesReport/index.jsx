import React from "react";


    const salesData = 	[
		{
			"order_id": 2,
			"cart_id": 2,
			"user_id": 6,
			"payment_type": "PayPal",
			"user_type": "Guest",
			"order_date": "2023-10-11",
			"status": "Shipped"
		},

		{
			"order_id": 1,
			"cart_id": 1,
			"user_id": 1,
			"payment_type": "Credit Card",
			"user_type": "Registered",
			"order_date": "2023-10-12",
			"status": "Processing"
		}

	
    ];

function CustomerSalesReport() {
    return (
        <div>
            <table border="1" style={{ width: '80%', margin: '0 auto' }}>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Cart ID</th>
                        <th>User ID</th>
                        <th>Payment Type</th>
                        <th>User Type</th>
                        <th>Order Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    {salesData.map((order) => (
                        <tr key={order.order_id}>
                            <td>{order.order_id}</td>
                            <td>{order.cart_id}</td>
                            <td>{order.user_id}</td>
                            <td>{order.payment_type}</td>
                            <td>{order.user_type}</td>
                            <td>{order.order_date}</td>
                            <td>{order.status}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}

export default CustomerSalesReport;