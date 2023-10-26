import React from "react";


    const salesData = [
		{
			"product_id": 35,
			"title": "Dyson Vacuum Cleaner",
			"sku": "APPLIANCE-005-Cordless-Red",
			"total_sales": 7
		},
		{
			"product_id": 20,
			"title": "JBL Free X",
			"sku": "HP-005-Wireless-White",
			"total_sales": 7
		},
		{
			"product_id": 5,
			"title": "Xiaomi Mi 11",
			"sku": "Mi11-001-128GB-Blue",
			"total_sales": 7
		},
		{
			"product_id": 15,
			"title": "Asus ROG Zephyrus G14",
			"sku": "LAP512-005-16GB-512GB",
			"total_sales": 6
		},
		{
			"product_id": 16,
			"title": "Sony WH-1000XM4",
			"sku": "HP-001-ANC-Black",
			"total_sales": 4
		},
		{
			"product_id": 40,
			"title": "Xbox One X",
			"sku": "CONSOLE-005-512GB-RobotWhite",
			"total_sales": 4
		},
		{
			"product_id": 25,
			"title": "Fujifilm X-T4",
			"sku": "CAM-005-30MP-Prime",
			"total_sales": 3
		},
		{
			"product_id": 10,
			"title": "Hisense 43\" 1080p TV",
			"sku": "TV55-001-55-1080p",
			"total_sales": 3
		},
		{
			"product_id": 27,
			"title": "Samsung Galaxy Watch 3",
			"sku": "WATCH-002-45mm-Black",
			"total_sales": 2
		},
		{
			"product_id": 3,
			"title": "Google Pixel 5",
			"sku": "Pixel5-001-64GB-White",
			"total_sales": 2
		}
	]


function MostSales() {
    return (
        <div>
            <table border="1" style={{ width: '80%', margin: '0 auto' }}>
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>SKU</th>
                        <th>Total Sales</th>
                    </tr>
                </thead>
                <tbody>
                    {salesData.map((product) => (
                        <tr key={product.product_id}>
                            <td>{product.title}</td>
                            <td>{product.sku}</td>
                            <td>{product.total_sales}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}

export default MostSales;
