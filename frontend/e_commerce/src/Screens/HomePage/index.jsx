import React, { useState, useEffect } from 'react';
import "./index.css";

import BannerCarousel from '../../Components/BannerCarousel';
import ProductsGrid from '../../Components/ProductsGrid';

const HomePage = () => {

    const [product, setProduct] = useState([]);
    const userIsLoggedIn = true;

        useEffect(() => {
          const fetchProduct = async () => {
            try {
      
              // const response = await axios.get(
              //   `http://localhost:5000/products/${productId}`
              // );
              // setProduct(response.data);
              // const varients = await axios.get(`http://localhost:5000/products/${productId}`);
              // setVarients(varients.data);
              
              setProduct(
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
                  
                  
            )
      
          } catch (error) {
            console.error("Error fetching product:", error);
          }
        };
        fetchProduct();
      }, []);

    return (
        <div>
            
            <BannerCarousel />
            <div className="card text-center">
              <div className="card-header">
                <h2>Recommendations</h2>
              </div>
              <div className="card-body">
                <ProductsGrid products={product} />
              </div>
            </div>
                  
        </div>
    );
};

export default HomePage;
