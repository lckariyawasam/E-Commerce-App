import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import axios from "axios";
import "./index.css";

function ProductView() {
  const [product, setProduct] = useState(null);
  const [quantity, setQuantity] = useState(1);

  const [selectedVariant1, setSelectedVariant1] = useState(null);
  const [selectedVariant2, setSelectedVariant2] = useState(null);

  const [varients, setVarients] = useState(null);
  const { productId } = useParams();

  useEffect(() => {
    const fetchProduct = async () => {
      try {
        const response = await axios.get(
          `http://localhost:5000/products/${productId}`
        );
        setProduct(response.data);
        // const varients = await axios.get(`http://localhost:5000/products/${productId}`);
        const image = "https://via.placeholder.com/300";
      } catch (error) {
        console.error("Error fetching product:", error);
      }
    };
    fetchProduct();
  }, [productId]);

  return (
    <div className="container d-flex justify-content-center align-items-center vh-100">
      <div className="card p-4 w-100 w-sm-75 w-md-50">
        {product && (
          <div className="row">
            {/* Product Image */}
            <div className="col-md-6 text-center">
              <img
                src="https://via.placeholder.com/300"
                alt={product.name}
                className="img-fluid"
                style={{
                  maxWidth: "400px",
                  objectFit: "cover",
                  borderRadius: "15px",
                }}
              />
            </div>

            {/* Product Details */}
            <div className="col-md-6 text-center text-md-left">
              <h1 className="card-title">{product.title}</h1>
              <p className="text-muted">SKU: {product.SKU}</p>
              <p className="text-muted">Brand: {product.brand}</p>
              <div className="mb-3">
                <label>{product.Variant_attribute_type_1}:</label>
                <button
                  className={`btn ${
                    selectedVariant1 === "128 GB"
                      ? "btn-primary"
                      : "btn-outline-secondary"
                  } ml-2`}
                  onClick={() => setSelectedVariant1("128 GB")}
                >
                  128 GB
                </button>
                <button
                  className={`btn ${
                    selectedVariant1 === "256 GB"
                      ? "btn-primary"
                      : "btn-outline-secondary"
                  } ml-2`}
                  onClick={() => setSelectedVariant1("256 GB")}
                >
                  256 GB
                </button>
              </div>
              <div className="mb-3">
                <label>{product.Variant_attribute_type_2}:</label>
                <button
                  className={`btn ${
                    selectedVariant2 === "Silver"
                      ? "btn-primary"
                      : "btn-outline-secondary"
                  } ml-2`}
                  onClick={() => setSelectedVariant2("Silver")}
                >
                  Silver
                </button>
                <button
                  className={`btn ${
                    selectedVariant2 === "Gold"
                      ? "btn-primary"
                      : "btn-outline-secondary"
                  } ml-2`}
                  onClick={() => setSelectedVariant2("Gold")}
                >
                  Gold
                </button>
              </div>
              <div className="mb-3">
                <label>Quantity:</label>
                <input
                  type="number"
                  value={quantity}
                  onChange={(e) => setQuantity(e.target.value)}
                  min="1"
                  className="form-control ml-2"
                  style={{ width: "80px", display: "inline-block" }}
                />
              </div>
              <button className="btn btn-primary">Add to the Cart</button>
              <p className="mt-3">
                "cdcdcdcdakkkkkkkkk nadnfaskd faknfk jdjajoncs nndnfdja
                fdajlnfad fajdfnafn fadnfakn"
              </p>
              {/* Other attributes and variants */}
            </div>
          </div>
        )}
      </div>
    </div>
  );
}

export default ProductView;
