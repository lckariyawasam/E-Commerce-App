import React from "react";
import { Bar } from 'react-chartjs-2';
import "./index.css";

const salesData =  [
    {
        "Quarter": "Q1",
        "Total Sales": 57379.31
    },
    {
        "Quarter": "Q2",
        "Total Sales": 3447.31
    },
    {
        "Quarter": "Q3",
        "Total Sales": 379989.31
    },
    {
        "Quarter": "Q4",
        "Total Sales": 14779.31
    }
];

function QuarterlySales() {
    const quarters = salesData.map(item => item.Quarter);
    const totalSales = salesData.map(item => item["Total Sales"]);

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
                display: true,
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

    return (
        <div className="quarterly-sales-container">


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

            <Bar data={chartData} options={options} />
        </div>
    );
}

export default QuarterlySales;
