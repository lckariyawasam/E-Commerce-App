import React, { useState } from 'react';
import './index.css';
import { Link, useNavigate } from 'react-router-dom';
import axios from 'axios';

const RegisterPage = () => {
    const [firstName, setFirstName] = useState('') 
    const [lastName, setLastName] = useState('') 
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [phoneNumber, setPhoneNumber] = useState('') 
    const [addressLine01, setAddressLine01] = useState('') 
    const [city, setCity] = useState('') 
    const [zipCode, setZipCode] = useState('') 
    const [state, setState] = useState('') 
    const [country, setCountry] = useState('')

    const [loading, setLoading] = useState(false)
    
    const navigate = useNavigate()

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

        axios.post('http://localhost:5000/register',
        {
            "first_name": firstName,
            "last_name": lastName,
            "email": email,
            "password": password,
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
                alert("User Created Successfully!")
                navigate('/login')
            } else {
                setLoading(false)
                alert('Something went wrong')
            }
        }
        )
        .catch(err => {
            console.log(err)
            if (err.response.status === 400) {
                alert('Email already exists')
            }
        }
        )
    }


    return (
        <div className='register-page'>
            <div className='login-form'>
                <h1 className='login-heading'>Register</h1>
                <div className='name-fields'>
                    <input className='input-field-register' onChange={e => setFirstName(e.target.value)} value={firstName} placeholder='First Name' type="text" />
                    <input className='input-field-register' onChange={e => setLastName(e.target.value)} value={lastName} placeholder='Last Name' type="text" />
                </div>
                <input className='input-field-register' onChange={e => setEmail(e.target.value)} value={email} placeholder='Email' type="email" />
                <input className='input-field-register' onChange={e => setPassword(e.target.value)} value={password} placeholder='Password' type="password" />
                <input className='input-field-register' onChange={e => setPhoneNumber(e.target.value)} value={phoneNumber} placeholder='Phone Number' type="tel" />
                <input className='input-field-register' onChange={e => setAddressLine01(e.target.value)} value={addressLine01} placeholder='Address Line 01' type="text" />
                <div className='name-fields'>
                    <input className='input-field-register' onChange={e => setCity(e.target.value)}  value={city} placeholder='City' type="text" />
                    <input className='input-field-register' onChange={e => setZipCode(e.target.value)}  value={zipCode} placeholder='Zip-Code' type="text" />
                </div>
                <div className='name-fields'>
                    <input className='input-field-register' onChange={e => setState(e.target.value)}  value={state} placeholder='State/Province' type="text" />
                    <input className='input-field-register' onChange={e => setCountry(e.target.value)}  value={country} placeholder='Country' type="text" />
                </div>
                <button className='login-button' onClick={confirmDetails}>Sign Up</button>
            </div>
        </div>
    );
};

export default RegisterPage;
