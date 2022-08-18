import React, {useState} from 'react';
import {useNavigate} from "react-router";
import axios from "axios";
import SessionHelper from "../../session/SessionHelper";
import {Link} from "react-router-dom";

const Profile =()=> {
    const navigate = useNavigate();
    const [profileInput, setProfile] = useState({
                                                  'name':'',
                                                  'username':'',
                                                  'email':'',
                                                  'password':'',
                                                  'confirm_password':'',
                                                  'message':'',
                                                  'errors':[],
                                                  'processing':false
                                              });

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
            axios.post('/api/register', data).then(res => {
                if (res.data.status === 400)
                {
                    setProfile({...profileInput, processing:false, message:res.data.message, errors:res.data.errors});
                }
                else
                {
                    SessionHelper.SetAuthSession(res.data.user);
                    setProfile({...profileInput,
                        processing:false,
                        errors:[],
                        name: '',
                        username: '',
                        email: '',
                        password: '',
                        confirm_password: '',
                    });
                    navigate('/');
                }
            }).catch((error)=>{
                setProfile({...profileInput, processing:false, message:'Sorry! something went wrong.'});
            });
        });
    }
    return (
        <>
            <section>
                <div className="container padding-top-70px padding-bottom-100px">
                    <div className="row">
                        <div className="col-sm-12 mb-5" style={{'display': 'flex', 'justify-content': 'space-between', 'align-items': 'center'}}>
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
                        <div className="col-lg-12 contact-form-action">
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
                                    <button type="submit" className={profileInput.processing === true ? 'btn btn-block btn-lg btn-danger disabled font-size-16' : 'btn btn-block btn-primary btn-lg font-size-16'} disabled={profileInput.processing === true ? 'disabled' : ''}>
                                        {profileInput.processing === true ? (
                                            <>
                                                <i className="las la-spinner"></i> Update Profile
                                            </>
                                        ) : (
                                            <> Update Profile</>
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