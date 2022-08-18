import React, {Component} from 'react';
import {Link} from "react-router-dom";

class PropertyCreate extends Component {
    render() {
        return (
            <>
                <section>
                    <div className="container padding-top-70px padding-bottom-100px">
                        <div className="row">
                            <div className="col-sm-12 mb-5" style={{'display': 'flex', 'justify-content': 'space-between', 'align-items': 'center'}}>
                                <div>
                                    <h1 className="text-black mb-1">Property</h1>
                                    <p>Add New Property</p>
                                </div>
                                <div>
                                    <nav aria-label="breadcrumb">
                                        <ol className="breadcrumb custom-breadcrumb">
                                            <li className="breadcrumb-item"><Link to='/dashboard'>Dashboard</Link></li>
                                            <li className="breadcrumb-item"><Link to='/manage/property'>Manage Property</Link></li>
                                            <li className="breadcrumb-item"><Link to='/manage/property/list'>Property</Link></li>
                                            <li className="breadcrumb-item active">Create</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>

                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default PropertyCreate;