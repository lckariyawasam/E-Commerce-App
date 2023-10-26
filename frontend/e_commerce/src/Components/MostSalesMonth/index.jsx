import React from "react";


    const salesData =['october'];


function MostSalesMonth() {
    return (
        <div>
            <table border="1" style={{ width: '80%', margin: '0 auto' }}>
                <thead>
                    <tr>
                        <th>Month</th>
                    </tr>
                </thead>
                <tbody>
                    <td>{salesData}</td>

                </tbody>
            </table>
        </div>
    );
}

export default MostSalesMonth;
