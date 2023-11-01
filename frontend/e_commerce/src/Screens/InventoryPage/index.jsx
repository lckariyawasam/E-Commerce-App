import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import "./index.css";
import axios from "axios";

function InventoryPage() {
    const [variants, setVariants] = useState([])
    
    const navigate = useNavigate()

    const loadData = () => {
        axios.get('http://localhost:5000/admin/inventory', {
            withCredentials: true,
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
        .then(res => {
            console.log("orders", res.data);
            setVariants(res.data);
        })
        .catch(err => {
            console.log(err)
            if (err.response.status === 401) {
                navigate('/?redirect=true')
            }
        });
    }

    useEffect(loadData, []);
    
    return (
        <div className="" style={{marginTop: '20px', marginLeft: '50px'}}>
            {variants.length === 0 ? 
                <div className="no-data">No data available</div>
                : <h2>Inventory</h2>
            }
            <table className="sales-table">
                <thead>
                    <tr>
                        <th>SKU</th>
                        <th>Product</th>
                        <th>Variant ID</th>
                        <th>Qunatity</th>
                    </tr>
                </thead>
                <tbody>
                    {variants.map((item) => (
                        <tr key={item.sku}>
                            <td>{item.sku}</td>
                            <td>{item.title}</td>
                            <td>{item.variant_id}</td>
                            <td>{item.quantity}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}
    
export default InventoryPage;
