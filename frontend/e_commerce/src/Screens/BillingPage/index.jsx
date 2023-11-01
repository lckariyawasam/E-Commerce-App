import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

import './index.css';

const BillingPage = () => {
    const [firstName, setFirstName] = useState('') 
    const [lastName, setLastName] = useState('') 
    const [email, setEmail] = useState('')
    const [phoneNumber, setPhoneNumber] = useState('') 
    const [addressLine01, setAddressLine01] = useState('') 
    const [city, setCity] = useState('') 
    const [zipCode, setZipCode] = useState('') 
    const [state, setState] = useState('') 
    const [country, setCountry] = useState('')
    const [userType, setUserType] = useState('')

    // const [paymentMethod, setPaymentMethod] = useState('')

    const [loading, setLoading] = useState(false)

    const navigate = useNavigate()

    
    const loadUser = () => {
        axios.get('http://localhost:5000/user', {
            withCredentials: true,
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
        .then(res => {
            res.data.first_name && setFirstName(res.data.first_name)
            res.data.last_name && setLastName(res.data.last_name)
            res.data.phone_number && setPhoneNumber(res.data.phone_number)
            res.data.email && setEmail(res.data.email)
            res.data.address_line01 && setAddressLine01(res.data.address_line01)
            res.data.address_city && setCity(res.data.address_city)
            res.data.address_zip_code && setZipCode(res.data.address_zip_code)
            res.data.address_state && setState(res.data.address_state)
            res.data.address_country && setCountry(res.data.address_country)
            setUserType(res.data.user_type)
            console.log(res.data)
        })
        .catch(err => {
            console.log(err)
        })
    }

    const verifyDetails = () => {
        if (firstName === '' || lastName === '' || email === '' || phoneNumber === '' || addressLine01 === '' || city === '' || zipCode === '' || state === '' || country === '') {
            console.log(firstName, lastName, email, phoneNumber, addressLine01, city, zipCode, state, country)
            return false
        }
        return true
    }

    const confirmDetails = () => {
        setLoading(true)

        if (!verifyDetails()) {
            setLoading(false)
            alert('Please fill all the fields')
            return
        }

        axios.post('http://localhost:5000/user/update',
        {
            "first_name": firstName,
            "last_name": lastName,
            "email": email,
            "phone_number": phoneNumber,
            "address_line01": addressLine01,
            "address_city": city,
            "address_zip_code": zipCode,
            "address_state": state,
            "address_country": country,
            // "payment_method": paymentMethod
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
                setLoading(false)
                console.log(res)
                navigate('/checkout')
            } else {
                setLoading(false)
                alert('Something went wrong')
            }
        }
        )
        .catch(err => {
            console.log(err)
        }
        )
    }

    useEffect(() => {
        loadUser()
    }
    , [])


    return (
        <div className='billing-page'>
            {/* {loading && 
            <div className="loading-overlay">
                Verifying Details...
            </div>
            } */}
            <div className='checkout-form'>
                <h1 className='form-heading'>Billing Information</h1>
                <div className='name-fields-billing'>
                    <input className='input-field-billing' disabled={userType === "Registered"} onChange={(e) => setFirstName(e.target.value)} placeholder='First Name' type="text" value={firstName} />
                    <input className='input-field-billing' disabled={userType === "Registered"} onChange={(e) => setLastName(e.target.value)} placeholder='Last Name' type="text" value={lastName} />
                </div>
                <input className='input-field-billing' disabled={userType === "Registered"} onChange={(e) => setEmail(e.target.value)} placeholder='Email' type="email" value={email} />
                <input className='input-field-billing' onChange={(e) => setPhoneNumber(e.target.value)} placeholder='Phone Number' type="tel" value={phoneNumber} />
                <input className='input-field-billing' onChange={(e) => setAddressLine01(e.target.value)} placeholder='Address Line 01' type="text" value={addressLine01} />
                <div className='name-fields-billing'>
                    <input className='input-field-billing' onChange={(e) => setCity(e.target.value)} placeholder='City' type="text" value={city} />
                    <input className='input-field-billing' onChange={(e) => setZipCode(e.target.value)} placeholder='Zip-Code' type="text" value={zipCode} />
                </div>
                <div className='name-fields-billing'>
                    <input className='input-field-billing' onChange={(e) => setState(e.target.value)} placeholder='State/Province' type="text" value={state} />
                    <select className='input-field-billing' onChange={(e) => setCountry(e.target.value)} placeholder='Country' type="text" value={country}>
                        <option value="" disabled>Select Country</option>
                        <option value="India">India</option>
                        <option value="United States">USA</option>
                        <option value="UK">UK</option>
                        <option value="Australia">Australia</option>
                    </select>
                </div>
                {/* Add a dropdown menu to select payment option */}
                {/* <h1 className='form-heading'>Payment Option</h1>
                <select className='input-field-billing' onChange={(e) => setPaymentMethod(e.target.value)} value={paymentMethod}>
                    <option value="" disabled>Select Payment Option</option>
                    <option value="paypal">Cash on Delivery</option>
                    <option value="credit-card">Credit Card</option>
                    <option value="debit-card">Debit Card</option>
                </select> */}
                <button className='checkout-button' onClick={confirmDetails}>Confirm Details</button>
            </div>
        </div>
    );
};

export default BillingPage;
