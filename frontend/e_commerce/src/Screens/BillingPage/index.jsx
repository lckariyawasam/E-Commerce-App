import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

import './index.css';

const BillingPage = () => {
    const [email, setEmail] = useState('') 

    const [firstName, setFirstName] = useState('') 
    const [lastName, setLastName] = useState('') 
    const [phoneNumber, setPhoneNumber] = useState('') 
    const [addressLine01, setAddressLine01] = useState('') 
    const [city, setCity] = useState('') 
    const [zipCode, setZipCode] = useState('') 
    const [state, setState] = useState('') 
    const [country, setCountry] = useState('')
    const [userType, setUserType] = useState('')

    const [paymentMethod, setPaymentMethod] = useState('')

    
    const loadUser = () => {
        axios.get('http://localhost:5000/user', {
            withCredentials: true,
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
        .then(res => {
            res.data.firstName && setFirstName(res.data.firstName)
            res.data.lastName && setLastName(res.data.lastName)
            res.data.phoneNumber && setPhoneNumber(res.data.phoneNumber)
            res.data.email && setEmail(res.data.email)
            res.data.addressLine01 && setAddressLine01(res.data.addressLine01)
            res.data.city && setCity(res.data.city)
            res.data.zipCode && setZipCode(res.data.zipCode)
            res.data.state && setState(res.data.state)
            res.data.country && setCountry(res.data.country)
            setUserType(res.data.user_type)
        })
        .catch(err => {
            console.log(err)
        })
    }

    useEffect(() => {
        loadUser()
    }
    , [])

    useEffect(() => {
        console.log(userType)
    }
    , [userType])


    return (
        <div className='checkout-page'>
            <div className='checkout-form'>
                <h1 className='form-heading'>Billing Information</h1>
                <div className='name-fields'>
                    <input className='input-field' disabled={userType === "Registered"} onChange={(e) => setFirstName(e.target.value)} placeholder='First Name' type="text" value={firstName} />
                    <input className='input-field' disabled={userType === "Registered"} onChange={(e) => setLastName(e.target.value)} placeholder='Last Name' type="text" value={lastName} />
                </div>
                <input className='input-field' disabled={userType === "Registered"} onChange={(e) => setEmail(e.target.value)} placeholder='Email' type="email" value={email} />
                <input className='input-field' onChange={(e) => setPhoneNumber(e.target.value)} placeholder='Phone Number' type="tel" value={phoneNumber} />
                <input className='input-field' onChange={(e) => setAddressLine01(e.target.value)} placeholder='Address Line 01' type="text" value={addressLine01} />
                <div className='name-fields'>
                    <input className='input-field' onChange={(e) => setCity(e.target.value)} placeholder='City' type="text" value={city} />
                    <input className='input-field' onChange={(e) => setZipCode(e.target.value)} placeholder='Zip-Code' type="text" value={zipCode} />
                </div>
                <div className='name-fields'>
                    <input className='input-field' onChange={(e) => setState(e.target.value)} placeholder='State/Province' type="text" value={state} />
                    <select className='input-field' onChange={(e) => setCountry(e.target.value)} placeholder='Country' type="text" value={country}>
                        <option value="" disabled>Select Country</option>
                        <option value="India">India</option>
                        <option value="USA">USA</option>
                        <option value="UK">UK</option>
                        <option value="Australia">Australia</option>
                    </select>
                </div>
                {/* Add a dropdown menu to select payment option */}
                <h1 className='form-heading'>Payment Option</h1>
                <select className='input-field' onChange={(e) => setPaymentMethod(e.target.value)} value={paymentMethod}>
                    <option value="" disabled>Select Payment Option</option>
                    <option value="paypal">Cash on Delivery</option>
                    <option value="credit-card">Credit Card</option>
                    <option value="debit-card">Debit Card</option>
                </select>
                <button className='checkout-button'>Confirm Details</button>
            </div>
        </div>
    );
};

export default BillingPage;
