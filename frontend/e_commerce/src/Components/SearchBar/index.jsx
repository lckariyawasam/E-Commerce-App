import React, { useState, useRef, useEffect, StrictMode } from "react";
import { useNavigate } from "react-router-dom";
import { Link } from "react-router-dom";


import "./index.css";
// const dummyData = [
    
//         {
//           "id":"1",
//           "price": "799",
//           "product_name": "iPhone 12",
//           "url": "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed"
//         },
//         {
//             "id":"2",
//             "price": "79",
//           "product_name": "Samsung Galaxy S21",
//           "url": "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed"
//         },
//         {
//             "id":"3",
//             "price": "789",
//           "product_name": "Google Pixel 5",
//           "url": "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed"
        
//         },
//         {
//             "id":"4",
//             "price": "7559",
//           "product_name": "OnePlus 9",
//           "url": "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed"
//         }
//         ,
//         {
//             "id":"1",
//             "price": "799",
//             "product_name": "iPhone 12",
//             "url": "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed"
//           },
//           {
//               "id":"2",
//               "price": "79",
//             "product_name": "Samsung Galaxy S21",
//             "url": "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed"
//           }
      
// ];

function SearchBar({ isStrictSelection,onProductSelected , dataBase}) {
    const [query, setQuery] = useState("");
    const [products, setProducts] = useState([]);
    const [filteredProducts, setFilteredProducts] = useState([]);
    const navigate = useNavigate();

    useEffect(() => {
        let apiUrl = "/api/products";
        if (dataBase == "users") {
            apiUrl = "/api/users";
        }

        fetch(apiUrl)
        .then(response => response.json())
        .then(data => {
            setProducts(data);
        })
        .catch(error => {
            console.error("Error fetching data:", error);
        });
    }, [dataBase]); 

    const handleInputChange = (e) => {
        const value = e.target.value;
        setQuery(value);
    
        if (value.trim() === "") {
            setFilteredProducts([]);
            return;
        }
    
        const matchedProducts = products.filter(product => 
            product.product_name.toLowerCase().includes(value.toLowerCase())
        );
    
        setFilteredProducts(matchedProducts);
    };

    const handleProductClick = (product) => {
        setQuery(product.product_name);
        // setSelectedProductId(product.id);
        setFilteredProducts([]); // Collapse the dropdown

        if (onProductSelected) {
            onProductSelected(product.id); // Pass the product ID to the parent component
        }
    
        if (!isStrictSelection) {
            navigate(`/ProductView/${product.id}`);
        }
    };

    const handleSubmit = (e) => {
        e.preventDefault();

        if (!isStrictSelection) {

            navigate(`/search?query=${query}`);
        }
    };

    

    return (
        <form className="form-inline ml-auto" onSubmit={handleSubmit}>
            <div style={{ position: 'relative' }}>
                <input
                    className="form-control"
                    type="search"
                    placeholder="Search"
                    aria-label="Search"
                    value={query}
                    onChange={handleInputChange}
                />
                {filteredProducts.length > 0 && (
                    <ul className="autocomplete-dropdown" style={
                        {
                            position: 'absolute',
                        }
                    }>
                    {filteredProducts.map(product => (
                        <li key={product.id} onClick={() => handleProductClick(product)}>
                            {product.product_name}
                        </li>
                    ))}
                </ul>
                )}
            </div>
            {!isStrictSelection && (
            <button className="btn btn-outline-dark ml-2" type="submit">
                <i className="fa fa-search"></i>
            </button>)}
        </form>
    );
}

export default SearchBar;