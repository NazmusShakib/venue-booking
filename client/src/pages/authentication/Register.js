import React, {useEffect, useState} from 'react';
import {Link, useLocation} from "react-router-dom";
import SessionHelper from "../../session/SessionHelper";
import {useNavigate} from "react-router";
import axios from "axios";
import queryString from "query-string";
import SocialLogin from "./SocialLogin";

const Register = () => {
    useEffect(() => {
        window.scrollTo(0, 0);
    }, []);

    const navigate = useNavigate();
    const location = useLocation();
    let redirectTo = queryString.parse(location.search).redirect;
    const [registerInput, setRegister] = useState({
        'name':'',
        'username':'',
        'email':'',
        'password':'',
        'type':'',
        'confirm_password':'',
        'message':'',
        'errors':[],
        'processing':false
    });

    const handleInput = (e) =>{
        e.persist();
        setRegister({...registerInput, [e.target.name] : e.target.value});
    }

    const formSubmit = (e) => {
        e.preventDefault();
        setRegister({...registerInput, errors:[], message:'', processing:true});
        const data = {
            name: registerInput.name,
            username: registerInput.username,
            email: registerInput.email,
            password: registerInput.password,
            type: registerInput.type,
            confirm_password: registerInput.confirm_password
        }
        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.post('/api/register', data).then(res => {
                if (res.data.status === 400)
                {
                    setRegister({...registerInput, processing:false, message:res.data.message, errors:res.data.errors});
                }
                else
                {
                    SessionHelper.SetAuthSession(res.data.user);
                    setRegister({...registerInput,
                        processing:false,
                        errors:[],
                        name: '',
                        username: '',
                        email: '',
                        password: '',
                        type: '',
                        confirm_password: '',
                    });
                    if(redirectTo === undefined || redirectTo === null)
                    {
                        navigate('/dashboard');
                    }else
                    {
                        navigate(redirectTo.toString());
                    }
                }
            }).catch((error)=>{
                setRegister({...registerInput, processing:false, message:'Sorry! something went wrong.'});
            });
        });
    }

    return (
        <>
            <section className="breadcrumb-area bread-bg-9">
                <div className="breadcrumb-wrap">
                    <div className="container">
                        <div className="row align-items-center">
                            <div className="col-lg-6">
                                <div className="breadcrumb-content">
                                    <div className="section-heading">
                                        <h2 className="sec__title text-white">Register</h2>
                                    </div>
                                </div>
                            </div>
                            <div className="col-lg-6">
                                <div className="breadcrumb-list text-right">
                                    <ul className="list-items">
                                        <li><Link to="/">Home</Link></li>
                                        <li>Register</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="bread-svg-box">
                    <svg className="bread-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 10"
                         preserveAspectRatio="none">
                        <polygon points="100 0 50 10 0 0 0 10 100 10"></polygon>
                    </svg>
                </div>
            </section>

            <section className="faq-area padding-top-100px padding-bottom-60px">
                <div className="container">
                    <div className="row">
                        <div className="col-lg-12">
                            <div className="section-heading text-center">
                                <h5 className="sec__title" id="exampleModalLongTitle">
                                    Register
                                </h5>
                                <p className="font-size-14">Hello! Welcome Create a New Account</p>
                            </div>
                        </div>
                    </div>
                    <div className="row padding-top-60px">
                        <div className="col-sm-6 offset-sm-3 contact-form-action">
                            {registerInput.message !== '' ? (
                                <>
                                    <div className="alert alert-danger" role="alert">{registerInput.message}</div>
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
                                            onChange={handleInput} value={registerInput.name}
                                        />
                                    </div>
                                    <p className="text-danger">{registerInput.errors.name}</p>
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
                                            onChange={handleInput} value={registerInput.username}
                                        />
                                    </div>
                                    <p className="text-danger">{registerInput.errors.username}</p>
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
                                            onChange={handleInput} value={registerInput.email}
                                        />
                                    </div>
                                    <p className="text-danger">{registerInput.errors.email}</p>
                                </div>
                                <div className="input-box">
                                    <label className="label-text">Password</label>
                                    <div className="form-group">
                                        <span className="la la-lock form-icon"></span>
                                        <input
                                            className="form-control"
                                            type="password"
                                            name="password"
                                            placeholder="Type password"
                                            onChange={handleInput} value={registerInput.password}
                                        />
                                    </div>
                                    <p className="text-danger">{registerInput.errors.password}</p>
                                </div>
                                <div className="input-box">
                                    <label className="label-text">Repeat Password</label>
                                    <div className="form-group">
                                        <span className="la la-lock form-icon"></span>
                                        <input
                                            className="form-control"
                                            type="password"
                                            name="confirm_password"
                                            placeholder="Type again password"
                                            onChange={handleInput} value={registerInput.confirm_password}
                                        />
                                    </div>
                                    <p className="text-danger">{registerInput.errors.confirm_password}</p>
                                </div>

                                <div className="input-box pt-3">
                                    <div className="form-group">
                                        <div className="form-check form-check-inline">
                                            <input className="form-check-input" onChange={handleInput} type="radio" name="type" id="as_a_customer" value="Customer"/>
                                            <label className="form-check-label" htmlFor="as_a_customer">Register as a  Customer</label>
                                        </div>
                                        <div className="form-check form-check-inline">
                                            <input className="form-check-input" onChange={handleInput} type="radio" name="type" id="as_a_owner" value="Venue Owner"/>
                                            <label className="form-check-label" htmlFor="as_a_owner">Register as a Venue Owner</label>
                                        </div>
                                    </div>
                                    <p className="text-danger">{registerInput.errors.type}</p>
                                </div>

                                <div className="btn-box pt-3 pb-4">
                                    {registerInput.processing === true ? (
                                        <>
                                            <button type="submit" className="theme-btn disabled w-100">
                                                <i className="las la-spin la-spinner"></i> Register Account
                                            </button>
                                        </>
                                    ) : (

                                        <button type="submit" className="theme-btn w-100">
                                            Register Account
                                        </button>
                                    )}
                                </div>
                                <SocialLogin/>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </>
    );
}

export default Register;