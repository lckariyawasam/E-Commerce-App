import React ,{useEffect, useState} from "react";
import { Bar } from 'react-chartjs-2';
import "./index.css";
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";

import axios from 'axios'

    // const sampelSalesData = [
	// 	{
	// 		"product_id": 35,
	// 		"title": "Dyson Vacuum Cleaner",
	// 		"sku": "APPLIANCE-005-Cordless-Red",
	// 		"total_sales": 7
	// 	},
	// 	{
	// 		"product_id": 20,
	// 		"title": "JBL Free X",
	// 		"sku": "HP-005-Wireless-White",
	// 		"total_sales": 7
	// 	},
	// 	{
	// 		"product_id": 5,
	// 		"title": "Xiaomi Mi 11",
	// 		"sku": "Mi11-001-128GB-Blue",
	// 		"total_sales": 7
	// 	},
	// 	{
	// 		"product_id": 15,
	// 		"title": "Asus ROG Zephyrus G14",
	// 		"sku": "LAP512-005-16GB-512GB",
	// 		"total_sales": 6
	// 	},
	// 	{
	// 		"product_id": 16,
	// 		"title": "Sony WH-1000XM4",
	// 		"sku": "HP-001-ANC-Black",
	// 		"total_sales": 4
	// 	},
	// 	{
	// 		"product_id": 40,
	// 		"title": "Xbox One X",
	// 		"sku": "CONSOLE-005-512GB-RobotWhite",
	// 		"total_sales": 4
	// 	},
	// 	{
	// 		"product_id": 25,
	// 		"title": "Fujifilm X-T4",
	// 		"sku": "CAM-005-30MP-Prime",
	// 		"total_sales": 3
	// 	},
	// 	{
	// 		"product_id": 10,
	// 		"title": "Hisense 43\" 1080p TV",
	// 		"sku": "TV55-001-55-1080p",
	// 		"total_sales": 3
	// 	},
	// 	{
	// 		"product_id": 27,
	// 		"title": "Samsung Galaxy Watch 3",
	// 		"sku": "WATCH-002-45mm-Black",
	// 		"total_sales": 2
	// 	},
	// 	{
	// 		"product_id": 3,
	// 		"title": "Google Pixel 5",
	// 		"sku": "Pixel5-001-64GB-White",
	// 		"total_sales": 2
	// 	}
	// ]

	function MostSales() {
		const [productNames, setProductNames] = useState([])
		const [totalSales, setTotalSales] = useState([])

		const [endDate, setEndDate] = useState(new Date());
		const oneWeekAgo = new Date();
		oneWeekAgo.setDate(oneWeekAgo.getDate() - 7);
		const [startDate, setStartDate] = useState(oneWeekAgo);

		const [salesData, setSalesData] = useState([])
	
		const chartData = {
			labels: productNames,
			datasets: [{
				data: totalSales,
				backgroundColor: 'rgba(75,192,192,0.6)',
				borderColor: 'rgba(75,192,192,1)',
				borderWidth: 1,
			}]
		};
	
		const options = {
			plugins: {
				title: {
					display: true,
					text: 'Most Sales by Product'
				},
				legend: {
					display: false
				}
			},
			scales: {
				y: {
					beginAtZero: true
				}
			}
		};

		const loadData = () => {
			axios.post("http://localhost:5000/admin/most_sales",
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
				console.log(res)
				setSalesData(res.data)
			})
			.catch(err => {
				console.log(err)
			})
		}

		useEffect(loadData, [])

		useEffect(loadData, [startDate, endDate])

		useEffect(() => {
			setProductNames(salesData.map(product => product.title))
			setTotalSales(salesData.map(product => product.total_sales))
		}, [salesData])
	
		return (
			<div className="most-sales-container">
			<h2>Most Sold Items</h2>
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
			<table className="sales-table">
					<thead>
						<tr>
							<th>Title</th>
							{/* <th>SKU</th> */}
							<th>Total Sales</th>
						</tr>
					</thead>
					<tbody>
						{salesData.map((product) => (
							<tr key={product.product_id}>
								<td>{product.title}</td>
								{/* <td>{product.sku}</td> */}
								<td>{product.total_sales}</td>
							</tr>
						))}
					</tbody>
				</table>
				<Bar data={chartData} options={options} />
	

			</div>
		);
	}
	
	export default MostSales;