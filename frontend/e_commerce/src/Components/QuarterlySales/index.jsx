import React from "react";

const salesData = [
    {
        "Quarter": "Q1",
        "Total Sales": 57379.31
    },
    {
        "Quarter": "Q2",
        "Total Sales": 347.31
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
    return (
        <div>

            <table border="1" style={{ width: '50%', margin: '0 auto' }}>
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
        </div>
    );
}

export default QuarterlySales;
