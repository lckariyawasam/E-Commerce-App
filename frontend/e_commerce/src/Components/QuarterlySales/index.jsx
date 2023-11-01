import React, { useState, useEffect } from "react";
import { Bar } from 'react-chartjs-2';
import "./index.css";

import { useNavigate } from 'react-router-dom';

import axios from 'axios'

// const salesData =  [
//     {
//         "Quarter": "Q1",
//         "Total Sales": 57379.31
//     },
//     {
//         "Quarter": "Q2",
//         "Total Sales": 3447.31
//     },
//     {
//         "Quarter": "Q3",
//         "Total Sales": 379989.31
//     },
//     {
//         "Quarter": "Q4",
//         "Total Sales": 14779.31
//     }
// ];


function QuarterlySales() {
    const [salesData, setSalesData] = useState([])
    const [quarters, setQuarters] = useState([])
    const [totalSales, setTotalSales] = useState([])

    const [year, setYear] = useState(2023)

    const navigate = useNavigate()

    
    const chartData = {
        labels: quarters,
        datasets: [{
            data: totalSales,
            backgroundColor: 'rgba(255, 159, 64, 0.6)',
            borderColor: 'rgba(255, 159, 64, 1)',
            borderWidth: 1,
        }]
    };
    
    const options = {
        plugins: {
            title: {
                display: false,
                text: 'Quarterly Sales'
            },
            legend: {
                display: false
            }
        },
        scales: {
            y: {
                beginAtZero: true,
                ticks: {
                    callback: (value) => '$' + value.toLocaleString('en-US')
                }
            }
        }
    };

    const loadData = () => {
        axios.post("http://localhost:5000/admin/quarterly_report",
        {
            "year": year
        },
        {
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            },
            withCredentials: true,
        })
        .then(res => {
            console.log(res)
            setSalesData(res.data)
        })
        .catch(err => {
            console.log(err)
            if (err.response.status === 401) {
                navigate('/?redirect=true')
            }
        })
    }
    
    useEffect(() => {
        loadData()
    }, [])

    useEffect(() => {
        setQuarters(salesData.map(item => item.Quarter))
        setTotalSales(salesData.map(item => parseFloat(item["Total Sales"])))
        console.log("Sales data: ", salesData)
    }, [salesData])

    useEffect(() => {
        loadData()
    }, [year])


    return (
        <div className="quarterly-sales-container">
            <h2>Quarterly Sales</h2>
            <span><label htmlFor="year">Select Year</label></span>
            <select className="year-field" name="year" id="" value={year} onChange={e => setYear(e.target.value)}>
                <option value="2021">2021</option>
                <option value="2022">2022</option>
                <option value="2023">2023</option>
            </select>


            <table className="sales-table">
                <thead>
                    <tr>
                        <th>Quarter</th>
                        <th>Total Sales ($)</th>
                    </tr>
                </thead>
                <tbody>
                    {salesData.map((item, index) => (
                        <tr key={index}>
                            <td>{item.Quarter}</td>
                            <td>{item["Total Sales"].toLocaleString('en-US', { style: 'currency', currency: 'USD' })}</td>
                        </tr>
                    ))}
                </tbody>
            </table>

            <Bar style={{marginTop:100}} data={chartData} options={options} />
        </div>
    );
}

export default QuarterlySales;
