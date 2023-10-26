import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import "./index.css";

import QuarterlySales from "../../Components/QuarterlySales";
import MostSales from "../../Components/MostSales";
import MostSalesCategory from "../../Components/MostSalesCategory";
import MostSalesMonth from "../../Components/MostSalesMonth";
import CustomerSalesReport from "../../Components/CustomerSalesReport";

function CategoryView() {


  return (
    <div style={{minHeight: '100vh'}}>
      
        <div>
          <h2>quarterly sales</h2>
          <QuarterlySales />
        </div>
        <div>
          <h2>Most sales</h2>
          <MostSales />
        </div>

        <div>
          <h2>Most sales Catogory</h2>
          <MostSalesCategory />
        </div>
        <div>
          <h2>Most sales Month</h2>
          <MostSalesMonth />
        </div>
        <div>
          <h2>Customer Sales Report</h2>
          <CustomerSalesReport />
        </div>

    </div>
  );
}

export default CategoryView;