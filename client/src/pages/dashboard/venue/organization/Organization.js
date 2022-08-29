import React, {Component} from 'react';
import {Link} from "react-router-dom";
import SessionHelper from "../../../../session/SessionHelper";
import axios from "axios";
import Swal from "sweetalert2";
import WithRouter from "../../../../_utility/WithRouter";
import { toast } from 'react-toastify';

class Organization extends Component {
    constructor() {
        super();
        this.state = {
            organizations:[],
            loading:true,
            edit_btn_loading:false,
            delete_btn_loading:false
        }
    }

    componentDidMount() {
        let user_id = SessionHelper.GetAuthUserId();
        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.get('/api/user/organizations/'+user_id).then(res => {
                this.setState({organizations:res.data.data});
                this.setState({loading:false});
            }).catch((error)=>{});
        });
    }

    deleteOrganization(organization_id){
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
                let data = {
                    user_id:SessionHelper.GetAuthUserId(),
                    creator_type:'User'
                }
                this.setState({delete_btn_loading:true});
                axios.get('/sanctum/csrf-cookie').then(response => {
                    axios.post('/api/delete/organization/'+organization_id, data).then(res => {
                        this.setState({delete_btn_loading:false});
                        if(parseInt(res.data.status) === 200){
                            document.getElementById('organization_'+organization_id).remove();
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

    editOrganization(organization_slug){
        this.setState({edit_btn_loading:true});
        let data = {
            'updated_by':SessionHelper.GetAuthUserId(),
            'slug' : organization_slug
        }
        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.post(`/api/organization/${organization_slug}/edit`, data).then(res => {
                this.setState({edit_btn_loading:false});
                if(res.data.status === 200)
                {
                    this.props.navigate(`/manage/venue/organization/${organization_slug}/edit`, {state: {organization:res.data.data}});
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
                                    <h1 className="text-black mb-1">Organization</h1>
                                    <Link to='/manage/venue/organization/create' className="btn btn-primary btn-sm mt-2"><i className="las la-plus"></i> Add New Organization</Link>
                                </div>
                                <div>
                                    <nav aria-label="breadcrumb">
                                        <ol className="breadcrumb custom-breadcrumb">
                                            <li className="breadcrumb-item"><Link to='/dashboard'>Dashboard</Link></li>
                                            <li className="breadcrumb-item"><Link to='/manage/venue'>Manage Venue</Link></li>
                                            <li className="breadcrumb-item active">Organization</li>
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
                                    <table className="table table-bordered table-condensed text-center">
                                        <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Description</th>
                                            <th scope="col">Contact Name</th>
                                            <th scope="col">Contact Number</th>
                                            <th scope="col">E-mail Address</th>
                                            <th scope="col">Address</th>
                                            <th scope="col">Created At</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        {
                                            this.state.organizations.map((organization, index) => (
                                                <React.Fragment key={index}>
                                                    <tr id={`organization_`+organization.id}>
                                                        <th scope="row">{index+1}</th>
                                                        <td>{organization.name}</td>
                                                        <td>{organization.description}</td>
                                                        <td>{organization.contact_name}</td>
                                                        <td>{organization.contact_number}</td>
                                                        <td>{organization.email}</td>
                                                        <td>{organization.address}</td>
                                                        <td>{organization.created_at}</td>
                                                        <td>
                                                            <button type="button" className="btn btn-sm btn-success mr-2"
                                                                    onClick={(e) => this.editOrganization(organization.slug)}>
                                                                {this.state.edit_btn_loading === false ? (<i className="las la-edit"></i>) : (<i className="las la-spin la-spinner"></i>)}
                                                            </button>

                                                            <button type="button" className="btn btn-sm btn-danger"
                                                                    onClick={(e) => this.deleteOrganization(organization.id)}>
                                                                {this.state.delete_btn_loading === false ? (<i className="las la-trash"></i>) : (<i className="las la-spin la-spinner"></i>)}
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
                    </div>
                </section>
            </>
        );
    }
}

export default WithRouter(Organization);