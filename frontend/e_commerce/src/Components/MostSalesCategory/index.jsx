import React from "react";


    const salesData =['Head Phones'];


function MostSalesCategory() {
    return (
        <div>
            <table border="1" style={{ width: '80%', margin: '0 auto' }}>
                <thead>
                    <tr>
                        <th>Category</th>
                    </tr>
                </thead>
                <tbody>
                    <td>{salesData}</td>

                </tbody>
            </table>
        </div>
    );
}

export default MostSalesCategory;
