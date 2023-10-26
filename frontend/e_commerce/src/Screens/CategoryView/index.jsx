import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import "./index.css";

import ProductGrid from "../../Components/ProductsGrid";

function CategoryView() {
  const [category, setCategory] = useState(null);
  const { categoryName } = useParams();

  const sampleCategories = [
    { id: 1, name: 'Electronics', description: 'All about electronic items.' },
    { id: 2, name: 'Apparel', description: 'Fashion and clothing.' },
    { id: 3, name: 'Toys', description: 'Kids toys and games.' },
  ];

  const sampleProducts = 
    [
        {
          "id":"1",
          "price": "799",
          "product_name": "iPhone 12",
          "url": "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed"
        },
        {
            "id":"2",
            "price": "79",
          "product_name": "Samsung Galaxy S21",
          "url": "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed"
        },
        {
            "id":"3",
            "price": "789",
          "product_name": "Google Pixel 5",
          "url": "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed"
        
        },
        {
            "id":"4",
            "price": "7559",
          "product_name": "OnePlus 9",
          "url": "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed"
        }
        ,
        {
            "id":"1",
            "price": "799",
            "product_name": "iPhone 12",
            "url": "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed"
          },
          {
              "id":"2",
              "price": "79",
            "product_name": "Samsung Galaxy S21",
            "url": "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed"
          }
      ]
      
      


  useEffect(() => {
    // Find the category that matches the categoryName from the URL
    const foundCategory = sampleCategories.find(cat => cat.name === categoryName);
    setCategory(foundCategory);
  }, [categoryName]);

  return (
    <div>
      {category ? (
        <div>
          <h2>{category.name}</h2>
          <ProductGrid products={sampleProducts} />

        </div>
      ) : (
        <p>Loading...</p>
      )}
    </div>
  );
}

export default CategoryView;
