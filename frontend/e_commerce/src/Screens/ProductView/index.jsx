import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import "./index.css";
import "bootstrap/dist/css/bootstrap.min.css";

import ProductsGrid from "../../Components/ProductsGrid";

function ProductView() {
  const [product, setProduct] = useState(null);
  const [quantity, setQuantity] = useState(1);
  const [selectedAttributes, setSelectedAttributes] = useState([]);
  const [disabledAttributes, setDisabledAttributes] = useState([]);
  const [loading, setLoading] = useState(true);
  const [variants, setVariants] = useState(null);
  const { productId } = useParams();

  const navigate = useNavigate();

  const loadProduct = () => {
    axios.get(`http://localhost:5000/product/${productId}`, {
        withCredentials: true,
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        }
    })
    .then(res => {
        setProduct({...res.data})
        console.log(res.data)
        setLoading(false)
    })
    .catch(err => {
        console.log(err)
        setLoading(false)
    })
}

  const addToCart = (variant_id) => {
      axios.post('http://localhost:5000/cart/add',
      {
          "variant_id": variant_id,
          "quantity": quantity
      },
      {
          headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json'
          },
          withCredentials: true,
      })
      .then(res => {
          if (res.status === 200) {
              navigate('/cart')
          }
      })
      .catch(err => {
          console.log(err)
          console.log({
              "variant_id": variant_id,
              "quantity": quantity
          })
      })
  }


  useEffect(() => {
     if (productId !== null) {
        loadProduct()
     }
  }, [productId])

  const samplerecommendedProducts = [
    {
      id: "1",
      price: "799",
      product_name: "iPhone 12",
      url: "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed",
    },
    {
      id: "2",
      price: "79",
      product_name: "Samsung Galaxy S21",
      url: "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed",
    },
    {
      id: "3",
      price: "789",
      product_name: "Google Pixel 5",
      url: "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed",
    },
    {
      id: "4",
      price: "7559",
      product_name: "OnePlus 9",
      url: "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed",
    },
    {
      id: "1",
      price: "799",
      product_name: "iPhone 12",
      url: "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed",
    },
    {
      id: "2",
      price: "79",
      product_name: "Samsung Galaxy S21",
      url: "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed",
    },
  ];

  const sampleProduct = {
    product_id: 1,
    title: "iPhone 12",
    weight: "150g",
    brand: "Apple",
    description:
      "The iPhone 12 is a flagship smartphone from Apple, featuring a stunning Super Retina XDR display, A14 Bionic chip, and a dual-camera system. It comes in various storage capacities and colors, providing a premium user experience.",
    Variant_attribute_type_1: "Storage",
    Variant_attribute_type_2: "Color",
  };

  const sampleVarients = [
    {
      variant_id: 1,
      Product_id: 1,
      variant_attribute_value_1: "128GB",
      variant_attribute_value_2: "Silver",
      price: "699.99",
      sku: "IP12-001-128GB-Silver",
      icon: "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed",
    },

    {
      variant_id: 4,
      Product_id: 1,
      variant_attribute_value_1: "512GB",
      variant_attribute_value_2: "Silver",
      price: "699.99",
      sku: "IP12-001-512GB-Silver",
      icon: "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed",
    },
    {
      variant_id: 3,
      Product_id: 1,
      variant_attribute_value_1: "256GB",
      variant_attribute_value_2: "Silver",
      price: "699.99",
      sku: "IP12-001-256GB-Silver",
      icon: "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed",
    },
    {
      variant_id: 2,
      Product_id: 1,
      variant_attribute_value_1: "256GB",
      variant_attribute_value_2: "Gold",
      price: "699.99",
      sku: "IP12-001-128GB-Gold",
      icon: "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed",
    },

    {
      variant_id: 4,
      Product_id: 1,
      variant_attribute_value_1: "1045GB",
      variant_attribute_value_2: "llip",
      price: "699.99",
      sku: "IP12-001-512GB-Silver",
      icon: "https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed",
    },
  ];


  useEffect(() => {
    if (product !== null) {
      setVariants(product.variants)
    }
  }, [product])


  const handleAttributeSelection = (index, value) => {
    const newAttributes = [...selectedAttributes];
    newAttributes[index] = value;

    if (index === 0) {
      const validSecondAttributes = getValidValuesForAttribute(
        1,
        newAttributes,
        variants
      );
      newAttributes[1] = validSecondAttributes[0];
    }
    setSelectedAttributes(newAttributes);
  };

  useEffect(() => {
    if (variants && variants.length > 0) {
      let initialAttributes = []
      if (currentVariant != null) {
      initialAttributes = [
        currentVariant?.variant_attribute_value_1,
        currentVariant?.variant_attribute_value_2,
      ]
    }
      setSelectedAttributes(initialAttributes);
    }
  }, [variants]);

  const getValidValuesForAttribute = (
    attributeIndex,
    currentAttributes,
    varients
  ) => {
    if (attributeIndex === 0) {
      return [...new Set(varients.map((v) => v[`variant_attribute_value_1`]))];
    } else {
      return [
        ...new Set(
          varients
            .filter((v) => v.variant_attribute_value_1 === currentAttributes[0])
            .map((v) => v[`variant_attribute_value_2`])
        ),
      ];
    }
  };

  useEffect(() => {
    if (!variants) return;

    const disabledAttrs = [];

    const validValues = getValidValuesForAttribute(
      1,
      selectedAttributes,
      variants
    );
    const allValues = [
      ...new Set(variants.map((v) => v[`variant_attribute_value_2`])),
    ];
    const invalidValues = allValues.filter(
      (attr) => !validValues.includes(attr)
    );
    disabledAttrs.push(...invalidValues);

    setDisabledAttributes(disabledAttrs);

    console.log(selectedAttributes)
  }, [selectedAttributes, variants]);

  const currentVariant = variants?.find((v) =>
    selectedAttributes.every(
      (attr, index) => attr === v[`variant_attribute_value_${index + 1}`]
    )
  );

  return (
    <div>

      <div className="container d-flex justify-content-center align-items-center vh-100">
        {product && currentVariant ? (
          <div className="row">
            <div className="col-md-6 text-center">
              <img
                src={currentVariant.icon}
                alt={product.title}
                className="img-fluid"
                style={{
                  objectFit: "cover",
                  borderRadius: "15px",
                  maxHeight: "500px",
                  backgroundColor: "rgba(246, 246, 247, 0.99)",
                }}
              />
            </div>
            <div className="col-md-6 text-center text-md-left">
              <h1 className="card-title">{product.title}</h1>
              <h3 className="card-title">${currentVariant.price}</h3>
              <p className="text-muted">SKU: {currentVariant.sku}</p>
              <p className="text-muted">Brand: {product.brand}</p>

              {product &&
                Object.keys(product)
                  .filter((key) => key.startsWith("Variant_attribute_type_"))
                  .map((key, index) => (
                    <div className="mb-3" key={index}>
                      <label>{product[key]}:</label>
                      {[
                        ...new Set(
                          variants.map(
                            (v) => v[`variant_attribute_value_${index + 1}`]
                          )
                        ),
                      ].map((value, i) => (
                        <button
                          key={i}
                          className={`btn ${
                            selectedAttributes[index] === value
                              ? "btn-dark"
                              : "btn-outline-secondary"
                          } ml-2`}
                          onClick={() => handleAttributeSelection(index, value)}
                          disabled={disabledAttributes.includes(value)} // disable the button if it's in the disabledAttributes array
                        >
                          {value}
                        </button>
                      ))}
                    </div>
                  ))}

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
              <button
                type="button"
                className="btn btn-outline-dark btn-lg btn-block"
                onClick={() => addToCart(currentVariant.variant_id)}
              >
                Add to the Cart
              </button>
              <p className="mt-3">{product.description}</p>
            </div>
          </div>
        ) : (
          <p>Loading...</p>
        )}
      </div>
      {/* <div className="card text-center">
        <div className="card-header">
          <h2>Recommendations</h2>
        </div>
        <div className="card-body">
          <ProductsGrid products={samplerecommendedProducts} />
        </div>
      </div> */}
    </div>
  );
}
export default ProductView;
