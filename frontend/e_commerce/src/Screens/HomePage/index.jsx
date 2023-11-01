import React, { useState, useEffect, } from 'react';
import axios from 'axios';
import "./index.css";

import BannerCarousel from '../../Components/BannerCarousel';
import ProductsGrid from '../../Components/ProductsGrid';

const HomePage = () => {
    const [allProducts, setAllProducts] = useState({});

    const loadProducts = () => {
      axios.get('http://localhost:5000/products/sorted', {
          withCredentials: true,
          headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json'
          }
      })
      .then(res => {
          console.log(res.data)
          setAllProducts(res.data)
      })
      .catch(err => console.log(err))
  }

    useEffect(() => {
        loadProducts()
    }, [])

    useEffect(() => {
      console.log(Object.keys(allProducts))
    }, [allProducts])

      //   useEffect(() => {
      //     const fetchProduct = async () => {
      //       try {
      
      //     const response = await axios.get(
      //       `http://localhost:5000/products/${productId}`
      //     );
      //     setProduct(response.data);
      //     const varients = await axios.get(`http://localhost:5000/products/${productId}`);
      //     setVarients(varients.data);
          
      //     setProducts(
      //       [
      //           {
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
      //           },
      //           {
      //               "id":"3",
      //               "price": "789",
      //             "product_name": "Google Pixel 5",
      //             "url": "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed"
                
      //           },
      //           {
      //               "id":"4",
      //               "price": "7559",
      //             "product_name": "OnePlus 9",
      //             "url": "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed"
      //           }
      //           ,
      //           {
      //               "id":"1",
      //               "price": "799",
      //               "product_name": "iPhone 12",
      //               "url": "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed"
      //             },
      //             {
      //                 "id":"2",
      //                 "price": "79",
      //               "product_name": "Samsung Galaxy S21",
      //               "url": "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed"
      //             }
      //         ]
              
              
      //   )


      
      //     } catch (error) {
      //       console.error("Error fetching product:", error);
      //     }
      //   };
      //   fetchProduct();
      // }, []);

    return (
        <div>
            
            <BannerCarousel />
            <div className="card text-center">
              {
                Object.keys(allProducts).length > 0 ? Object.keys(allProducts).map((item, index) => (
                  <div key={item}>
                    <div className="card-header">
                      <h2>{allProducts[item][0].category}</h2>
                    </div>
                    <div className="card-body">
                      <ProductsGrid products={allProducts[item]} />
                    </div>
                  </div>
                ))
                : <></>
              }
              {/* <div className="card-header">
                <h2>Electronics</h2>
              </div>
              <div className="card-body">
                <ProductsGrid products={electronics} />
              </div>
              <div className="card-header">
                <h2>Toys</h2>
              </div>
              <div className="card-body">
                <ProductsGrid products={toys} />
              </div> */}
            </div>
                  
        </div>
    );
};

export default HomePage;
