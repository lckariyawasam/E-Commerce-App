import React, { useState, useEffect, } from 'react';
import axios from 'axios';
import "./index.css";

import BannerCarousel from '../../Components/BannerCarousel';
import ProductsGrid from '../../Components/ProductsGrid';

const CategoryPage = () => {
    const [allProducts, setAllProducts] = useState({});
    const [category, setCategory] = useState('')

    const loadProducts = () => {
      axios.get('http://localhost:5000/products/sorted_full', {
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
      setCategory(Object.keys(allProducts)[0])
    }, [allProducts])



    return (
        <div>
          <div className='category-selector'>
            <label htmlFor="category"> Category </label>
           <select className='input-field' name="category" id="category-selector" onChange={e => setCategory(e.target.value)} value={category}>
            { category !== "" && Object.keys(allProducts)?.length > 0 ? Object.keys(allProducts)?.map((item, index) => (
                  <option key={item} value={item}>{item}</option>
                ))
                : <></>
              }
            </select>
          </div>
            <div className="card text-center">
                {/* <div className="card-header">
                  <h2>{category}</h2>
                </div> */}
                {
                  allProducts[category] && 
                <div className="card-body">
                  <ProductsGrid products={allProducts[category]} />
                </div>
                }
            </div>
                  
        </div>
    );
};

export default CategoryPage;
