import React, {Component} from 'react';
import axios from "axios";
import SessionHelper from "../../session/SessionHelper";
import {Link} from "react-router-dom";
import Swal from "sweetalert2";

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

    deleteOrder(order_id){
        let data = {
            user_id:SessionHelper.GetAuthUserId(),
            order_id:order_id,
            type:'personal'
        }

        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showDenyButton: true,
            confirmButtonText: 'Yes, delete it!',
            denyButtonText: 'No, cancel!'
        }).then((result) => {
            /* Read more about isConfirmed, isDenied below */
            if (result.isConfirmed) {
                axios.get('/sanctum/csrf-cookie').then(response => {
                    axios.post('/api/delete/order', data).then(res => {
                        if(parseInt(res.data.status) === 200){
                            document.getElementById('order_'+order_id).remove();
                            Swal.fire('Deleted!','Your file has been deleted.','success');
                        }else if(parseInt(res.data.status) === 500){
                            Swal.fire('Failed!',res.data.message.toString(),'error');
                        }
                    }).catch((error)=>{
                        Swal.fire('Failed!',error.message.toString(),'error');
                    });
                });
            } else if (result.isDenied) {
                Swal.fire('Cancelled','Your imaginary file is safe :)','error');
            }
        })
    }

    render() {
        return (
            <>
                <section>
                    <div className="container-fluid full-with-section-padding-lr padding-top-70px padding-bottom-100px">
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
                                                <tr id={`order_`+order.id}>
                                                    <th scope="row">{index+1}</th>
                                                    <td>{order.venue}</td>
                                                    <td>{order.start_date}</td>
                                                    <td>{order.end_date}</td>
                                                    <td>{order.total_guests}</td>
                                                    <td>{order.net_total_price}</td>
                                                    <td>{order.status}</td>
                                                    <td>{order.payment_status}</td>
                                                    <td>
                                                        <button type="button" className="btn btn-sm btn-danger"
                                                                onClick={(e) => this.deleteOrder(order.id)}>
                                                            <i className="las la-trash"></i>
                                                        </button>
                                                    </td>
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