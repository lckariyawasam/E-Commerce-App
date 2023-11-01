import React, { useEffect, useState } from "react";
import "./index.css";
import { Bar } from 'react-chartjs-2';
import SearchBar from "../SearchBar";
import Chart from 'chart.js/auto';
import axios from "axios";


// const dummyData =[
//     {
//       "id":"1",
//       "price": "799",
//       "product_name": "iPhone 12",
//       "url": "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed"
//     },
//     {
//         "id":"2",
//         "price": "79",
//       "product_name": "Samsung Galaxy S21",
//       "url": "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed"
//     },
//     {
//         "id":"3",
//         "price": "789",
//       "product_name": "Google Pixel 5",
//       "url": "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed"
    
//     },
//     {
//         "id":"4",
//         "price": "7559",
//       "product_name": "OnePlus 9",
//       "url": "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed"
//     }
//     ,
//     {
//         "id":"1",
//         "price": "799",
//         "product_name": "iPhone 12",
//         "url": "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed"
//       },
//       {
//           "id":"2",
//           "price": "79",
//         "product_name": "Samsung Galaxy S21",
//         "url": "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed"
//       }
//   ]


  function MostSalesMonth() {
    const [selectedProduct, setSelectedProduct] = useState(null)
    const [month, setMonth] = useState(null)

    const monthlySalesData = {
        '1': ['October', 'September'], // Example for product with ID '1'
        // ... Add other products here
    };

    const chartData = {
        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
        datasets: [{
            label: 'Sales',
            data: [12, 19, 3, 5, 2, 3, 7, 8, 9, 15, 1, 4], // Dummy data for sales count
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1
        }]
    };

    const handleProductSelection = (product) => {
        // const product = dummyData.find(p => p.product_id === productId);
        setSelectedProduct(product);
    }

    useEffect(() => {
        if (selectedProduct) {
            // Fetch monthly sales data for selected product
            axios.post("http://localhost:5000/admin/monthly_orders", 
            {
                product_id: selectedProduct.product_id
            },
            {
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                },
                withCredentials: true
            })
            .then(res => {
                console.log(res.data.month)
                setMonth(res.data.month)
            })
            .catch(err => console.log(err))
        }
    }, [selectedProduct])

    return (
        <div className="most-sales-container">
            <h2>Month with most sales for the product</h2>
            {
                !selectedProduct && <p>Select product to view details</p>
            }
            <SearchBar isStrictSelection={true} onProductSelected={handleProductSelection} endpoint={"products"} />

            
            {selectedProduct && (
                <>
                    <table className="sales-table">
                        <thead>
                            <tr>
                                <th>Product Name</th>
                                <th>Month with Most Sales</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>{selectedProduct.title}</td>
                                <td>{month ? month : "Data not available"}</td>
                            </tr>
                        </tbody>
                    </table>
                    {/* <Bar data={chartData} /> */}
                </>
            )}
        </div>
    );
}

export default MostSalesMonth;