import React, {Component} from 'react';
import {Link} from "react-router-dom";
import axios from "axios";
import SessionHelper from "../../../../session/SessionHelper";
import WithRouter from "../../../../_utility/WithRouter";
import { toast } from 'react-toastify';

class OrganizationEdit extends Component {
    constructor() {
        super();
        this.state = {
            name:'',
            email:'',
            description:'',
            contact_name:'',
            contact_number:'',
            address:'',
            multiple_properties:0,
            loading:true,
            processing:false,
            message:'',
            errors:[]
        }
    }

    componentDidMount() {
        this.setState(previousState => ({
            ...this.props.location.state.organization
        }), () => {
            this.setState({loading:false});
        });
    }

    handleInput = (e) =>{
        e.persist();
        this.setState({[e.target.name] : e.target.value});
        if(e.target.name.toString() === 'multiple_properties'){
            this.setState({multiple_properties : e.target.checked});
        }
    }

    formSubmit = (e) =>{
        e.preventDefault();
        let data ={
            updated_by:SessionHelper.GetAuthUserId(),
            name:this.state.name,
            description:this.state.description,
            contact_name:this.state.contact_name,
            contact_number:this.state.contact_number,
            email:this.state.email,
            address:this.state.address,
            multiple_properties:this.state.multiple_properties,
        }
        this.setState({processing : true, errors:[], message:''});
        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.post(`/api/organization/${this.props.params.organization_slug}/update`, data).then(res => {
                if (res.data.status === 400)
                {
                    this.setState({processing:false, message:res.data.message, errors:res.data.errors});
                    toast.warn(res.data.message);
                }
                else if(res.data.status === 200)
                {
                    this.setState({processing:false, errors:[], message:res.data.message});
                    toast.success(res.data.message);
                    this.props.navigate('/manage/venue/organization');
                }else if(res.data.status === 306)
                {
                    toast.error(res.data.error);
                    this.props.navigate('/manage/venue/organization');
                }
            }).catch((error)=>{
                console.log(error);
                this.setState({processing:false, message:'Sorry! something went wrong.'});
            });
        });
    }

    render() {
        return (
            <>
                <section>
                    <div className="container padding-top-70px padding-bottom-100px">
                        <div className="row">
                            <div className="col-sm-12 mb-5" style={{'display': 'flex', 'justifyContent': 'space-between', 'alignItems': 'center'}}>
                                <div>
                                    <h1 className="text-black mb-1">Organization</h1>
                                    <p>Edit</p>
                                </div>
                                <div>
                                    <nav aria-label="breadcrumb">
                                        <ol className="breadcrumb custom-breadcrumb">
                                            <li className="breadcrumb-item"><Link to='/dashboard'>Dashboard</Link></li>
                                            <li className="breadcrumb-item"><Link to='/manage/venue'>Manage Venue</Link></li>
                                            <li className="breadcrumb-item"><Link to='/manage/venue/organization'>Organization</Link></li>
                                            <li className="breadcrumb-item active">Edit</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                            <div className="col-sm-12">
                                <div className="form-box">
                                    <div className="form-title-wrap">
                                        <h3 className="title"><i className="la la-landmark mr-2 text-gray"></i>Organization Information</h3>
                                    </div>
                                    <div className="form-content contact-form-action">
                                        {this.state.loading === true && (
                                            <div className="row">
                                                <div className="col-sm-12 loaderPlaceholder">
                                                    <div className="row">
                                                        <div className="col-lg-12 responsive-column">
                                                            <div className="ph-col">
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
                                                            <div className="ph-col">
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
                                            <form className="row" onSubmit={this.formSubmit}>
                                            {this.state.message !== '' ? (
                                                <>
                                                    <div className="form-group col-lg-12 text-center">
                                                        <div className="alert alert-danger" role="alert">{this.state.message}</div>
                                                    </div>
                                                </>
                                            ) : (
                                                <></>
                                            )}
                                            <div className="col-lg-12 responsive-column">
                                                <div className="input-box">
                                                    <label className="label-text">Name</label>
                                                    <div className="form-group">
                                                        <span className="la la-landmark form-icon"></span>
                                                        <input onChange={this.handleInput} className="form-control" defaultValue={this.state.name} type="text" name="name"
                                                               placeholder="Organization Name"/>
                                                        <p className="text-danger">{this.state.errors.name}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-lg-12">
                                                <div className="input-box">
                                                    <label className="label-text mb-0 line-height-20">Description</label>
                                                    <div className="form-group">
                                                        <span className="la la-pencil form-icon"></span>
                                                        <textarea onChange={this.handleInput} defaultValue={this.state.description} className="message-control form-control" name="description" placeholder="In English only, no HTML, no web, no ALL CAPS"></textarea>
                                                        <p className="text-danger">{this.state.errors.description}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-lg-12 responsive-column">
                                                <div className="input-box">
                                                    <label className="label-text">Contact Name</label>
                                                    <div className="form-group">
                                                        <span className="la la-user form-icon"></span>
                                                        <input onChange={this.handleInput} defaultValue={this.state.contact_name} className="form-control" type="text" name="contact_name"
                                                               placeholder="Contact Name"/>
                                                        <p className="text-danger">{this.state.errors.contact_name}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-lg-6 responsive-column">
                                                <div className="input-box">
                                                    <label className="label-text">Contact Number</label>
                                                    <div className="form-group">
                                                        <span className="la la-phone form-icon"></span>
                                                        <input onChange={this.handleInput} defaultValue={this.state.contact_number} className="form-control" type="text" name="contact_number"
                                                               placeholder="Contact Number"/>
                                                        <p className="text-danger">{this.state.errors.contact_number}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-lg-6 responsive-column">
                                                <div className="input-box">
                                                    <label className="label-text">E-mail Address</label>
                                                    <div className="form-group">
                                                        <span className="la la-envelope-o form-icon"></span>
                                                        <input onChange={this.handleInput} defaultValue={this.state.email} className="form-control" type="email" name="email"
                                                               placeholder="E-mail Address"/>
                                                        <p className="text-danger">{this.state.errors.email}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-lg-12">
                                                <div className="input-box">
                                                    <label className="label-text mb-0 line-height-20">Address</label>
                                                    <div className="form-group">
                                                        <span className="la la-pencil form-icon"></span>
                                                        <textarea onChange={this.handleInput} defaultValue={this.state.address} className="message-control form-control" name="address" placeholder="In English only, no HTML, no web, no ALL CAPS"></textarea>
                                                        <p className="text-danger">{this.state.errors.address}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-lg-12">
                                                <div className="custom-checkbox">
                                                    {this.state.multiple_properties === 1 ?
                                                    (
                                                        <><input onChange={this.handleInput} type="checkbox" id="multiple_properties"  defaultChecked="checked" name="multiple_properties"/></>
                                                    ):(
                                                        <><input onChange={this.handleInput} type="checkbox" id="multiple_properties" name="multiple_properties"/></>
                                                    )}

                                                    <label htmlFor="multiple_properties">Multiple Properties?</label>
                                                </div>
                                            </div>

                                            <div className="col-lg-12 responsive-column">
                                                <div className="btn-box pt-3">
                                                    {this.state.processing === true ? (
                                                        <>
                                                            <button type="submit" className="theme-btn btn-danger disabled float-right"><i className="las la-spin la-spinner"></i> Update</button>
                                                        </>
                                                    ) : (
                                                        <button type="submit" className="theme-btn float-right"><i className="la la-save ml-1"></i> Update</button>
                                                    )}
                                                </div>
                                            </div>

                                        </form>
                                        )}
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

export default WithRouter(OrganizationEdit);