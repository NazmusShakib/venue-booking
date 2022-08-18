import React, {Component} from 'react';
import axios from "axios";
import SessionHelper from "../../session/SessionHelper";
import {Link} from "react-router-dom";

class PersonalOrders extends Component {
    constructor() {
        super();
        this.state = {
            orders:[],
            loading:true
        }
    }

    componentDidMount() {
        let user_id = SessionHelper.GetAuthUserId();
        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.get('/api/orders/'+user_id).then(res => {
                this.setState({orders:res.data.data});
                this.setState({loading:false});
            }).catch((error)=>{});
        });
    }

    render() {
        return (
            <>
                <section>
                    <div className="container padding-top-70px padding-bottom-100px">
                        <div className="row">
                            <div className="col-sm-12 mb-5 p-0" style={{'display': 'flex', 'justify-content': 'space-between', 'align-items': 'center'}}>
                                <div>
                                    <h1 className="text-black mb-1">Orders</h1>
                                    <p>Manage your all orders</p>
                                </div>
                                <div>
                                    <nav aria-label="breadcrumb">
                                        <ol className="breadcrumb custom-breadcrumb">
                                            <li className="breadcrumb-item"><Link to='/dashboard'>Dashboard</Link></li>
                                            <li className="breadcrumb-item active">Orders</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                            {this.state.loading === true && (
                                <div className="col-sm-12 p-0 loaderPlaceholder">
                                    <div className="row">
                                        <div className="col-lg-12 responsive-column">
                                            <div className="ph-item">
                                                <div className="ph-col-12">
                                                    <div className="ph-picture"></div>
                                                    <div className="ph-row">
                                                        <div className="ph-col-6 big"></div>
                                                        <div className="ph-col-4 empty big"></div>
                                                        <div className="ph-col-2 big"></div>
                                                        <div className="ph-col-4"></div>
                                                        <div className="ph-col-8 empty"></div>
                                                        <div className="ph-col-6"></div>
                                                        <div className="ph-col-6 empty"></div>
                                                        <div className="ph-col-12"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            )}

                            {this.state.loading === false && (
                                <table className="table table-bordered table-condensed text-center">
                                    <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Venue</th>
                                        <th scope="col">Start Date</th>
                                        <th scope="col">End Date</th>
                                        <th scope="col">Total Guests</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Payment Status</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {
                                        this.state.orders.map((order, index) => (
                                            <React.Fragment key={index}>
                                                <tr>
                                                    <th scope="row">{index+1}</th>
                                                    <td>{order.venue}</td>
                                                    <td>{order.start_date}</td>
                                                    <td>{order.end_date}</td>
                                                    <td>{order.total_guests}</td>
                                                    <td>{order.net_total_price}</td>
                                                    <td>{order.status}</td>
                                                    <td>{order.payment_status}</td>
                                                    <td></td>
                                                </tr>
                                            </React.Fragment>
                                        ))
                                    }
                                    </tbody>
                                </table>
                            )}
                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default PersonalOrders;