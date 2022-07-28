import React, {Component} from 'react';
import axios from "axios";
import SessionHelper from "../../../session/SessionHelper";

class Orders extends Component {
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
            }).catch((error)=>{});
        });
    }

    render() {
        return (
            <>
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
            </>
        );
    }
}

export default Orders;