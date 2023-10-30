import React, { useState } from "react";
import { Bar } from 'react-chartjs-2';
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";

function MostOrderedCategories() {
    const [startDate, setStartDate] = useState(new Date());
    const [endDate, setEndDate] = useState(new Date());

    const categories = ['Electronics', 'Clothing', 'Home Appliances', 'Books'];
    const orderCounts = [150, 90, 65, 120];  // Dummy data for number of orders

    const maxOrders = Math.max(...orderCounts);

    const chartData = {
        labels: categories,
        datasets: [{
            data: orderCounts,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)'
            ],
            borderWidth: 1
        } 
    ]
    };

    return (
        <div style={{ width: '80%', margin: '0 auto', padding: '20px' }}>
            <h2>Product Category with Most Orders</h2>


            <div className="row">
                <div className="col-md-4">
                    <label>Start Date:</label>
                        <DatePicker selected={startDate} onChange={date => setStartDate(date)} />
                </div>
                <div className="col-md-4">
                    <label>End Date:</label>
                    <DatePicker selected={endDate} onChange={date => setEndDate(date)} />
                </div>
                
               

            </div>


            <table border="1" className="sales-table">
                <thead>
                    <tr>
                        <th>Product Category</th>
                        <th>Number of Orders</th>
                    </tr>
                </thead>
                <tbody>
                    {categories.map((category, index) => (
                        <tr key={category} style={orderCounts[index] === maxOrders ? { backgroundColor: '#e6ffe6' } : {}}>
                            <td>{category}</td>
                            <td>{orderCounts[index]}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
            <Bar data={chartData} options={{ 
                plugins: {
                    legend: {
                        display: false
                    },
                    datalabels: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                } 
            }} />

        </div>
    );
}

export default MostOrderedCategories;
