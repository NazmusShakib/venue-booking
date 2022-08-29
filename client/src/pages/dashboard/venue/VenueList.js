import React, {Component} from 'react';
import {Link} from "react-router-dom";
import SessionHelper from "../../../session/SessionHelper";
import axios from "axios";
import Swal from "sweetalert2";
import {toast} from "react-toastify";
import WithRouter from "../../../_utility/WithRouter";

class VenueList extends Component {
    constructor() {
        super();
        this.state = {
            venues:[],
            loading:true,
            edit_btn_loading:false,
            delete_btn_loading:false
        }
    }

    componentDidMount() {
        let user_id = SessionHelper.GetAuthUserId();
        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.get('/api/user/venues/'+user_id).then(res => {
                this.setState({venues:res.data.data});
                this.setState({loading:false});
            }).catch((error)=>{});
        });
    }

    deleteVenue(venue_id){
        let data = {
            user_id:SessionHelper.GetAuthUserId(),
            venue_id:venue_id,
            creator_type:'User'
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
                this.setState({delete_btn_loading:true});
                axios.get('/sanctum/csrf-cookie').then(response => {
                    axios.post('/api/delete/venue', data).then(res => {
                        this.setState({delete_btn_loading:false});
                        if(parseInt(res.data.status) === 200){
                            document.getElementById('venue_'+venue_id).remove();
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

    editVenue(venue_slug){
        this.setState({edit_btn_loading:true});
        let data = {
            'slug'      :   venue_slug,
            'user_id'   :   SessionHelper.GetAuthUserId(),
        };
        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.post(`/api/venue/${venue_slug}/edit`, data).then(res => {
                this.setState({edit_btn_loading:false});
                if(res.data.status === 200)
                {
                    this.props.navigate(`/manage/venue/${venue_slug}/edit`, {state: {venue:res.data.data}});
                }

                if(res.data.status === 306)
                {
                    Swal.fire('Failed!',res.data.error.toString(),'error');
                }
            }).catch((error)=>{});
        });
    }

    render() {
        return (
            <>
                <section>
                    <div className="container-fluid full-with-section-padding-lr padding-top-70px padding-bottom-100px">
                        <div className="row">
                            <div className="col-sm-12 mb-5" style={{'display': 'flex', 'justifyContent': 'space-between', 'alignItems': 'center'}}>
                                <div>
                                    <h1 className="text-black mb-1">Venue</h1>
                                    <Link to='/manage/venue/create' className="btn btn-primary btn-sm mt-2">Add New Venue</Link>
                                </div>
                                <div>
                                    <nav aria-label="breadcrumb">
                                        <ol className="breadcrumb custom-breadcrumb">
                                            <li className="breadcrumb-item"><Link to='/dashboard'>Dashboard</Link></li>
                                            <li className="breadcrumb-item"><Link to='/manage/venue'>Manage Venue</Link></li>
                                            <li className="breadcrumb-item active">Venue</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                            <div className="col-sm-12">
                                {this.state.loading === true && (
                                    <div className="row">
                                        <div className="col-sm-12 loaderPlaceholder">
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
                                    </div>
                                )}

                                {this.state.loading === false && (
                                    <div className="table-responsive">
                                        <table className="table table-bordered table-condensed text-center">
                                        <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col" className="text-nowrap">Featured Image</th>
                                            <th scope="col">Organization</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Division</th>
                                            <th scope="col">District</th>
                                            <th scope="col">City</th>
                                            <th scope="col">Enabled?</th>
                                            <th scope="col" className="text-nowrap">Created at</th>
                                            <th scope="col" className="text-nowrap">Updated at</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        {
                                            this.state.venues.map((venue, index) => (
                                                <React.Fragment key={index}>
                                                    <tr id={`venue_`+venue.id}>
                                                        <th scope="row">{index+1}</th>
                                                        <td><img src={venue.thumbnail} style={{'maxWidth':'100px', 'maxHeight':'100px'}} alt={venue.name} className="img img-thumbnail"/></td>
                                                        <td>{venue.organization}</td>
                                                        <td>{venue.name}</td>
                                                        <td>{venue.division}</td>
                                                        <td>{venue.district}</td>
                                                        <td>{venue.city}</td>
                                                        <td><span className={venue.is_enabled === 'Yes' ? 'badge badge-success' : 'badge badge-danger'}>{venue.is_enabled}</span></td>
                                                        <td>{venue.created_at}</td>
                                                        <td>{venue.updated_at}</td>
                                                        <td>
                                                            <button type="button" className="btn btn-sm btn-success mr-2"
                                                                    onClick={(e) => this.editVenue(venue.slug)}>
                                                                {this.state.edit_btn_loading === false ? (<i className="las la-edit"></i>) : (<i className="las la-spin la-spinner"></i>)}
                                                            </button>

                                                            <button type="button" className="btn btn-sm btn-danger"
                                                                    onClick={(e) => this.deleteVenue(venue.id)}>
                                                                {this.state.delete_btn_loading === false ? (<i className="las la-trash"></i>) : (<i className="las la-spin la-spinner"></i>)}
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </React.Fragment>
                                            ))
                                        }
                                        </tbody>
                                    </table>
                                    </div>
                                )}
                            </div>
                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default WithRouter(VenueList);