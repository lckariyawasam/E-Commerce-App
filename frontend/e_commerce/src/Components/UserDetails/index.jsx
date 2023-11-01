import React, { useEffect, useState } from "react";
import "./index.css";
import axios from "axios";

function UserDetails() {
    const [userDetails, setUserDetails] = useState(null);

    const loadData = () => {
        axios.get('http://localhost:5000/user', {
            withCredentials: true,
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
        .then(res => {
            console.log(res.data);
            setUserDetails(res.data); 
        })
        .catch(err => console.log(err));
    }

    useEffect(loadData, []);

    return (
        <div className="">
            {userDetails ? (
                <div>
                    <h2>User Details</h2>
                    <div>User ID: {userDetails.user_id}</div>
                    <div>Type: {userDetails.user_type}</div>
                    <div>Name: {userDetails.first_name} {userDetails.last_name}</div>
                    <div>Email: {userDetails.email}</div>
                    <div>Phone: {userDetails.phone_number}</div>
                    <div>Address: 
                        {userDetails.address_line01}, 
                        {userDetails.address_city}, 
                        {userDetails.address_state} - {userDetails.address_zip_code},
                        {userDetails.address_country}
                    </div>
                </div>
            ) : (
                <div className="no-data">Fetching user details...</div>
            )}
        </div>
    );
}

export default UserDetails;
