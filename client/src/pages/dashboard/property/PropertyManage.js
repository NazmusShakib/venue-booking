import React, {Component} from 'react';
import {Link} from "react-router-dom";

class PropertyManage extends Component {
    render() {
        return (
            <>
                <section>
                    <div className="container padding-top-70px padding-bottom-100px">
                        <div className="row">
                            <div className="col-sm-12 mb-5" style={{'display': 'flex', 'justify-content': 'space-between', 'align-items': 'center'}}>
                                <div>
                                    <h1 className="text-black mb-1">Manage Property</h1>
                                    <p>Manage property</p>
                                </div>
                                <div>
                                    <nav aria-label="breadcrumb">
                                        <ol className="breadcrumb custom-breadcrumb">
                                            <li className="breadcrumb-item"><Link to='/dashboard'>Dashboard</Link></li>
                                            <li className="breadcrumb-item active">Manage Property</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                            <div className="col-sm-6 mb-5">
                                <div className="card">
                                    <div class="card-body media">
                                        <i className="las la-user font-size-18 align-self-start mr-3"></i>
                                        <div class="media-body">
                                            <h5 class="mt-0 text-black">Organization</h5>
                                            <p>Manage Organization</p>
                                            <Link to='/property/organization'>All Organization</Link>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="col-sm-6 mb-5">
                                <div className="card">
                                    <div class="card-body media">
                                        <i className="las la-user font-size-18 align-self-start mr-3"></i>
                                        <div class="media-body">
                                            <h5 class="mt-0 text-black">Orders</h5>
                                            <p>Your order lists</p>
                                            <Link to='/property/orders'>All orders</Link>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="col-sm-6 mb-5">
                                <div className="card">
                                    <div class="card-body media">
                                        <i className="las la-user font-size-18 align-self-start mr-3"></i>
                                        <div class="media-body">
                                            <h5 class="mt-0 text-black">Property</h5>
                                            <p>Manage your property</p>
                                            <Link to='/manage/property/list'>All Property</Link>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="col-sm-6 mb-5">
                                <div className="card">
                                    <div class="card-body media">
                                        <i className="las la-user font-size-18 align-self-start mr-3"></i>
                                        <div class="media-body">
                                            <h5 class="mt-0 text-black">Calendar</h5>
                                            <p>Manage available dates for property</p>
                                            <Link to='/manage/property/calendar'>Calendar</Link>
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

export default PropertyManage;