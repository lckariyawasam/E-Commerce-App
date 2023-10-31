import React, { useState, useEffect } from "react";
import { Bar } from 'react-chartjs-2';
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";

import axios from 'axios'
import { max } from "date-fns";

function MostOrderedCategories() {
    const [endDate, setEndDate] = useState(new Date());
    const oneWeekAgo = new Date();
    oneWeekAgo.setDate(oneWeekAgo.getDate() - 7);
    const [startDate, setStartDate] = useState(oneWeekAgo);


    const [salesData, setSalesData] = useState([])

    // const categories = ['Electronics', 'Clothing', 'Home Appliances', 'Books'];
    // const orderCounts = [150, 90, 65, 120];  // Dummy data for number of orders

    const [maxOrders, setMaxOrders] = useState(Math.max(salesData.map(sale => sale.orderCount)))

    const chartData = {
        labels: salesData.map(sale => sale.category),
        datasets: [{
            data: salesData.map(sale => sale.orderCount),
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


    const loadData = () => {
        axios.post("http://localhost:5000/admin/most_orders_category",
        {
            "start_date": startDate,
            "end_date": endDate
        },
        {
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            },
            withCredentials: true,
        })
        .then(res => {
            console.log(res.data)
            setSalesData(res.data)
        })
        .catch(err => {
            console.log(err)
        })
    }

    useEffect(loadData, [])

    useEffect(loadData, [startDate, endDate])

    useEffect(() => {
        setMaxOrders(Math.max(...salesData.map(sale => sale.orderCount)))
    }, [salesData])

    useEffect(() => console.log(maxOrders), [maxOrders])

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
                    {salesData.map((item, index) => (
                        <tr key={item.category} style={parseInt(item.orderCount) === maxOrders ? { backgroundColor: '#e6ffe6' } : {}}>
                            <td>{item.category}</td>
                            <td>{item.orderCount}</td>
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
