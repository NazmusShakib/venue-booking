import React, {useEffect, useState} from 'react';
import {useNavigate} from "react-router";
import {Link, useLocation} from "react-router-dom";
import axios from "axios";
import SessionHelper from "../../session/SessionHelper";
import queryString from 'query-string';

const Login = () => {
    useEffect(() => {
        window.scrollTo(0, 0);
    }, []);

    const navigate = useNavigate();
    const location = useLocation();
    let redirectTo = queryString.parse(location.search).redirect;

    const [loginInput, setLogin] = useState({
        'email':'',
        'password':'',
        'message':'',
        'processing':false,
        'errors':[]
    });

    const handleInput = (e) =>{
        e.persist();
        setLogin({...loginInput, [e.target.name]:e.target.value});
    }

    const formSubmit = (e) =>{
        e.preventDefault();
        setLogin({...loginInput, errors:[], message:'', processing:true});
        const data = {
            email: loginInput.email,
            password: loginInput.password
        }
        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.post('/api/login', data).then(res => {
                if (res.data.status === 400)
                {
                    setLogin({...loginInput, processing:false, message:res.data.message, errors:res.data.errors});
                }
                else if(res.data.status === 401)
                {
                    setLogin({...loginInput, processing:false, message:res.data.message});
                }
                else if(res.data.status === 200)
                {
                    SessionHelper.SetAuthSession(res.data.user);
                    setLogin({...loginInput,
                        processing:false,
                        errors:[],
                        email: '',
                        message: '',
                        password: ''
                    });

                    if(redirectTo === 'undefined' || redirectTo === 'null')
                    {
                        navigate('/');
                    }else
                    {
                        navigate(redirectTo.toString());
                    }
                }
            }).catch((error)=>{
                setLogin({...loginInput, processing:false, message:'Sorry! something went wrong.'});
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
                                        <h2 className="sec__title text-white">Login</h2>
                                    </div>
                                </div>
                            </div>
                            <div className="col-lg-6">
                                <div className="breadcrumb-list text-right">
                                    <ul className="list-items">
                                        <li><Link to="/">Home</Link></li>
                                        <li>Login</li>
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
                                    Login
                                </h5>
                                <p className="font-size-14">Hello! Welcome to your account</p>
                            </div>
                        </div>
                    </div>
                    <div className="row padding-top-60px">
                        <div className="col-sm-6 offset-sm-3 contact-form-action">
                            {loginInput.message !== '' ? (
                                <>
                                    <div className="alert alert-danger" role="alert">{loginInput.message}</div>
                                </>
                            ) : (
                                <></>
                            )}

                            <form onSubmit={formSubmit}>
                                <div className="input-box">
                                    <label className="label-text">Email Address</label>
                                    <div className="form-group">
                                        <span className="la la-envelope form-icon"></span>
                                        <input
                                            className="form-control"
                                            type="text"
                                            name="email"
                                            placeholder="Type your email"
                                            onChange={handleInput} value={loginInput.email}
                                        />
                                    </div>
                                    <p className="text-danger">{loginInput.errors.email}</p>
                                </div>
                                <div className="input-box">
                                    <label className="label-text">Password</label>
                                    <div className="form-group mb-2">
                                        <span className="la la-lock form-icon"></span>
                                        <input
                                            className="form-control"
                                            type="password"
                                            name="password"
                                            placeholder="Type your password"
                                            onChange={handleInput} value={loginInput.password}
                                        />
                                    </div>
                                    <p className="text-danger">{loginInput.errors.password}</p>
                                </div>
                                <div className="btn-box pt-3 pb-4">
                                    <button type="submit" className={loginInput.processing == true ? 'btn btn-block btn-lg btn-danger disabled font-size-16' : 'btn btn-block btn-primary btn-lg font-size-16'}>

                                        {loginInput.processing === true ? (
                                            <>
                                                <i className="las la-spinner"></i> Login Account
                                            </>
                                        ) : (
                                            <>Login Account</>
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

export default Login;