import React, {Component} from 'react';
import {Link} from "react-router-dom";

class VenueManage extends Component {
    render() {
        return (
            <>
                <section>
                    <div className="container-fluid full-with-section-padding-lr padding-top-70px padding-bottom-100px">
                        <div className="row">
                            <div className="col-sm-12 mb-5" style={{'display': 'flex', 'justifyContent': 'space-between', 'alignItems': 'center'}}>
                                <div>
                                    <h1 className="text-black mb-1">Manage Venue</h1>
                                    <p>Manage venue</p>
                                </div>
                                <div>
                                    <nav aria-label="breadcrumb">
                                        <ol className="breadcrumb custom-breadcrumb">
                                            <li className="breadcrumb-item"><Link to='/dashboard'>Dashboard</Link></li>
                                            <li className="breadcrumb-item active">Manage Venue</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                            <div className="col-sm-3 mb-5">
                                <div className="card">
                                    <div className="card-body media">
                                        <i className="las la-landmark font-size-30 align-self-start mr-3"></i>
                                        <div className="media-body">
                                            <h5 className="mt-0 text-black">Organization</h5>
                                            <p>Manage Organization</p>
                                            <Link to='/manage/venue/organization'>All Organization</Link>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="col-sm-3 mb-5">
                                <div className="card">
                                    <div className="card-body media">
                                        <i className="las la-building font-size-30 align-self-start mr-3"></i>
                                        <div className="media-body">
                                            <h5 className="mt-0 text-black">Venue</h5>
                                            <p>Manage your venue</p>
                                            <Link to='/manage/venue/list'>All Venues</Link>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="col-sm-3 mb-5">
                                <div className="card">
                                    <div className="card-body media">
                                        <i className="las la-calendar-check font-size-30 align-self-start mr-3"></i>
                                        <div className="media-body">
                                            <h5 className="mt-0 text-black">Calendar</h5>
                                            <p>Manage available dates for venue</p>
                                            <Link to='/manage/venue/calendar'>Calendar</Link>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="col-sm-3 mb-5">
                                <div className="card">
                                    <div className="card-body media">
                                        <i className="las la-cart-plus font-size-30 align-self-start mr-3"></i>
                                        <div className="media-body">
                                            <h5 className="mt-0 text-black">Orders</h5>
                                            <p>Your order lists</p>
                                            <Link to='/manage/venue/orders'>All orders</Link>
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

export default VenueManage;