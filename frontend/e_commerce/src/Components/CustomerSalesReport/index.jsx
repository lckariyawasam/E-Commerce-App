import React, {useState} from "react";
import SearchBar from "../SearchBar";
import "./index.css";


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
        const [selectedOrder, setSelectedOrder] = useState(null);
    
        const handleOrderSelection = (userId) => {
            const order = salesData.find(o => o.user_id.toString() === userId);
            setSelectedOrder(order);
        };
    
        return (
            <div>
                <SearchBar isStrictSelection={true} onProductSelected={handleOrderSelection} dataBase={"users"} />
                
                {selectedOrder ? (
                    <table className="sales-table">
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
                            <tr>
                                <td>{selectedOrder.order_id}</td>
                                <td>{selectedOrder.cart_id}</td>
                                <td>{selectedOrder.user_id}</td>
                                <td>{selectedOrder.payment_type}</td>
                                <td>{selectedOrder.user_type}</td>
                                <td>{selectedOrder.order_date}</td>
                                <td>{selectedOrder.status}</td>
                            </tr>
                        </tbody>
                    </table>
                ) : (
                    <p>Select a customer to view their orders.</p>
                )}
            </div>
        );
    }
    
    export default CustomerSalesReport;