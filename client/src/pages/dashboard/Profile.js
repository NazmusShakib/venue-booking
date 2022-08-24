import React, {useState, useEffect} from 'react';
import axios from "axios";
import SessionHelper from "../../session/SessionHelper";
import {Link} from "react-router-dom";
import Swal from "sweetalert2";
import {toast} from "react-toastify";

const Profile =()=> {
    const [profileInput, setProfile] = useState({
                                                  'name':SessionHelper.GetAuthSession().name,
                                                  'username':SessionHelper.GetAuthSession().username,
                                                  'email':SessionHelper.GetAuthSession().email,
                                                  'password':'',
                                                  'confirm_password':'',
                                                  'message':'',
                                                  'errors':[],
                                                  'processing':false
                                              });
    // useEffect(() => {
    //     axios.get('/sanctum/csrf-cookie').then(response => {
    //         axios.get('/api/get/profile').then(res => {
    //             setProfile({...profileInput, ...res.data});
    //         }).catch((error)=>{
    //             Swal.fire('Failed!',error.message.toString(),'error');
    //         });
    //     });
    // }, []);

    const handleInput = (e) =>{
        e.persist();
        setProfile({...profileInput, [e.target.name] : e.target.value});
    }

    const formSubmit = (e) => {
        e.preventDefault();
        setProfile({...profileInput, errors:[], message:'', processing:true});
        const data = {
            name: profileInput.name,
            username: profileInput.username,
            email: profileInput.email,
            password: profileInput.password,
            confirm_password: profileInput.confirm_password
        }
        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.post('/api/update/profile', data).then(res => {
                if (res.data.status === 400)
                {
                    setProfile({...profileInput, processing:false, message:res.data.message, errors:res.data.errors});
                }
                else if(res.data.status === 200)
                {
                    SessionHelper.SetAuthSession(res.data.user);
                    setProfile({...profileInput, errors:[], message:'', password:'', confirm_password:'', processing:false});
                    toast.success(res.data.message);
                }
            }).catch((error)=>{
                setProfile({...profileInput, processing:false, message:'Sorry! something went wrong.'});
                Swal.fire('Failed!',error.message.toString(),'error');
            });
        });
    }
    return (
        <>
            <section>
                <div className="container padding-top-70px padding-bottom-100px">
                    <div className="row">
                        <div className="col-sm-12 mb-5" style={{'display': 'flex', 'justifyContent': 'space-between', 'alignItems': 'center'}}>
                            <div>
                                <h1 className="text-black mb-1">Personal Details</h1>
                                <p>Update Your Personal Information</p>
                            </div>
                            <div>
                                <nav aria-label="breadcrumb">
                                    <ol className="breadcrumb custom-breadcrumb">
                                        <li className="breadcrumb-item"><Link to='/dashboard'>Dashboard</Link></li>
                                        <li className="breadcrumb-item active">Personal Details</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                        <div className="col-sm-12 contact-form-action">
                            {profileInput.message !== '' ? (
                                <>
                                    <div className="alert alert-danger" role="alert">{profileInput.message}</div>
                                </>
                            ) : (
                                <></>
                            )}
                            <form onSubmit={formSubmit}>
                                <div className="input-box">
                                    <label className="label-text">Name</label>
                                    <div className="form-group">
                                        <span className="la la-user form-icon"></span>
                                        <input
                                            className="form-control"
                                            type="text"
                                            name="name"
                                            placeholder="Type your name"
                                            onChange={handleInput} value={profileInput.name}
                                        />
                                    </div>
                                    <p className="text-danger">{profileInput.errors.name}</p>
                                </div>
                                <div className="input-box">
                                    <label className="label-text">Username</label>
                                    <div className="form-group">
                                        <span className="la la-user form-icon"></span>
                                        <input
                                            className="form-control"
                                            type="text"
                                            name="username"
                                            placeholder="Type your username"
                                            onChange={handleInput} value={profileInput.username}
                                        />
                                    </div>
                                    <p className="text-danger">{profileInput.errors.username}</p>
                                </div>
                                <div className="input-box">
                                    <label className="label-text">Email Address</label>
                                    <div className="form-group">
                                        <span className="la la-envelope form-icon"></span>
                                        <input
                                            className="form-control"
                                            type="text"
                                            name="email"
                                            placeholder="Type your email"
                                            onChange={handleInput} value={profileInput.email}
                                        />
                                    </div>
                                    <p className="text-danger">{profileInput.errors.email}</p>
                                </div>
                                <div className="input-box">
                                    <label className="label-text">Password</label>
                                    <div className="form-group">
                                        <span className="la la-lock form-icon"></span>
                                        <input
                                            className="form-control"
                                            type="text"
                                            name="password"
                                            placeholder="Type password"
                                            onChange={handleInput} value={profileInput.password}
                                        />
                                    </div>
                                    <p className="text-danger">{profileInput.errors.password}</p>
                                </div>
                                <div className="input-box">
                                    <label className="label-text">Repeat Password</label>
                                    <div className="form-group">
                                        <span className="la la-lock form-icon"></span>
                                        <input
                                            className="form-control"
                                            type="text"
                                            name="confirm_password"
                                            placeholder="Type again password"
                                            onChange={handleInput} value={profileInput.confirm_password}
                                        />
                                    </div>
                                    <p className="text-danger">{profileInput.errors.confirm_password}</p>
                                </div>
                                <div className="btn-box pt-3 pb-4">
                                    <button type="submit" className={profileInput.processing === true ? 'btn float-right btn-lg btn-danger disabled font-size-16' : 'btn float-right btn-primary btn-lg font-size-16'} disabled={profileInput.processing === true ? 'disabled' : ''}>
                                        {profileInput.processing === true ? (
                                            <><i className="las la-spinner la-spin"></i> Updating</>
                                        ) : (
                                            <> <i className="la la-save ml-1"></i> Update</>
                                        )}
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </>
    );
}

export default Profile;