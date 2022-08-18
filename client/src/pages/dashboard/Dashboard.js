import React, {Component} from 'react';
import {Link} from "react-router-dom";
class Dashboard extends Component {
    render() {
        return (
            <>
                <section>
                    <div className="container padding-top-70px padding-bottom-100px">
                        <div className="row">
                            <div className="col-sm-12 mb-5">
                                <h1 className="text-black mb-1">Your Account</h1>
                                <p>Manage your account</p>
                            </div>
                            <div className="col-sm-4">
                                <div className="card">
                                    <div className="card-body media">
                                        <i className="las la-user-cog font-size-30 align-self-start mr-3"></i>
                                            <div className="media-body">
                                                <h5 className="mt-0 text-black">Personal Details</h5>
                                                <p>Update Your Personal Information</p>
                                                <Link to='/profile'>Manage Personal Details</Link>
                                            </div>
                                    </div>
                                </div>
                            </div>
                            <div className="col-sm-4">
                                <div className="card">
                                    <div className="card-body media">
                                        <i className="las la-luggage-cart font-size-30 align-self-start mr-3"></i>
                                        <div className="media-body">
                                            <h5 className="mt-0 text-black">Orders</h5>
                                            <p>Your order lists</p>
                                            <Link to='/orders'>Manage your orders</Link>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="col-sm-4">
                                <div className="card">
                                    <div className="card-body media">
                                        <i className="las la-industry font-size-30 align-self-start mr-3"></i>
                                        <div className="media-body">
                                            <h5 className="mt-0 text-black">Manage Property</h5>
                                            <p>Manage your property</p>
                                            <Link to='/manage/property'>Manage Property</Link>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default Dashboard;