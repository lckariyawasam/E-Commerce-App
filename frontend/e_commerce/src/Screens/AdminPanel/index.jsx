import React, { useState } from "react";
import "./index.css";

import QuarterlySales from "../../Components/QuarterlySales";
import MostSales from "../../Components/MostSales";
import MostSalesCategory from "../../Components/MostSalesCategory";
import MostSalesMonth from "../../Components/MostSalesMonth";
import CustomerSalesReport from "../../Components/CustomerSalesReport";


function CategoryView() {
  const [activeTab, setActiveTab] = useState("quarterlySales")

  const renderContent = () => {
    switch (activeTab) {
      case "quarterlySales":
        return <QuarterlySales />;
      case "mostSales":
        return <MostSales />;
      case "mostSalesCategory":
        return <MostSalesCategory />;
      case "mostSalesMonth":
        return <MostSalesMonth />;
      case "customerSalesReport":
        return <CustomerSalesReport />;
      default:
        return <></>;
    }
  }

  return (
    <div className="admin-panel">
      <aside className="side-menu">
        <button className={activeTab === "quarterlySales" ? "active" : ""} onClick={() => setActiveTab("quarterlySales")}>
          Quarterly Sales
        </button>
        <button className={activeTab === "mostSales" ? "active" : ""} onClick={() => setActiveTab("mostSales")}>
          Most Sales
        </button>
        <button className={activeTab === "mostSalesCategory" ? "active" : ""} onClick={() => setActiveTab("mostSalesCategory")}>
          Most Sales Category
        </button>
        <button className={activeTab === "mostSalesMonth" ? "active" : ""} onClick={() => setActiveTab("mostSalesMonth")}>
          Most Sales Month
        </button>
        <button className={activeTab === "customerSalesReport" ? "active" : ""} onClick={() => setActiveTab("customerSalesReport")}>
          Customer Sales Report
        </button>
      </aside>
      <main className="content">{renderContent()}</main>
    </div>
  );
}

export default CategoryView;
