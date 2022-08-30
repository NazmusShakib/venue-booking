import React, {Component} from 'react';
import {Link} from "react-router-dom";
import axios from "axios";
import {toast} from "react-toastify";

class HelpAndSupport extends Component {
    constructor() {
        super();
        this.state = {
            name:'',
            email:'',
            subject:'',
            message:'',
            response_status:200,
            response_message:'',
            processing:false,
            errors:[]
        }
    }

    componentDidMount() {
        window.scrollTo(0, 0);
    }

    handleInput = (e) =>{
        e.persist();
        this.setState({[e.target.name] : e.target.value});
    }

    formSubmit = (e) =>{
        e.preventDefault();
        let data ={
            name:this.state.name,
            subject:this.state.subject,
            email:this.state.email,
            message:this.state.message
        }
        this.setState({processing : true, errors:[], response_message:''});
        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.post('/api/inbox/message/store', data).then(res => {
                if (res.data.status === 400)
                {
                    this.setState({processing:false, response_message:res.data.message, errors:res.data.errors, response_status:res.data.status});
                    toast.warn(res.data.message);
                }
                else if(res.data.status === 200)
                {
                    this.setState({
                        name:'',
                        message:'',
                        subject:'',
                        email:'',
                        processing:false,
                        errors:[],
                        response_message:res.data.message,
                        response_status:res.data.status
                    });
                    toast.success(res.data.message);
                }
            }).catch((error)=>{
                this.setState({processing:false, response_message:'Sorry! something went wrong.', response_status:500});
            });
        });
    }

    render() {
        return (
            <>
                <section className="breadcrumb-area bread-bg-5">
                    <div className="breadcrumb-wrap">
                        <div className="container">
                            <div className="row align-items-center">
                                <div className="col-lg-6">
                                    <div className="breadcrumb-content">
                                        <div className="section-heading">
                                            <h2 className="sec__title text-white">Contact us</h2>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-6">
                                    <div className="breadcrumb-list text-right">
                                        <ul className="list-items">
                                            <li><Link to="/">Home</Link></li>
                                            <li>Contact us</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div className="bread-svg-box">
                        <svg className="bread-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 10" preserveAspectRatio="none">
                            <polygon points="100 0 50 10 0 0 0 10 100 10"></polygon>
                        </svg>
                    </div>
                </section>

                <section className="contact-area section--padding">
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-8">
                                <div className="form-box">
                                    <div className="form-title-wrap">
                                        <h3 className="title">We'd love to hear from you</h3>
                                        <p className="font-size-15">Send us a message and we'll respond as soon as possible</p>
                                    </div>
                                    <div className="form-content ">
                                        <div className="contact-form-action">
                                            <form className="row messenger-box-form" onSubmit={this.formSubmit}>
                                                {this.state.response_message !== '' ? (
                                                    <>
                                                        {parseInt(this.state.response_status) === 200 ? (
                                                            <div className="alert alert-success messenger-box-contact__msg col-lg-12" role="alert">{this.state.response_message}</div>
                                                        ):(
                                                            <div className="alert alert-danger messenger-box-contact__msg col-lg-12" role="alert">{this.state.response_message}</div>
                                                        )}
                                                    </>
                                                ) : (
                                                    <></>
                                                )}

                                                <div className="col-lg-6 responsive-column">
                                                    <div className="input-box messenger-box-input-wrap">
                                                        <label className="label-text" htmlFor="name">Your Name</label>
                                                        <div className="form-group">
                                                            <span className="la la-user form-icon"></span>
                                                            <input onChange={this.handleInput} value={this.state.name} className="form-control" type="text" id="name" name="name"
                                                                   placeholder="Your name" required/>
                                                            <p className="text-danger">{this.state.errors.name}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div className="col-lg-6 responsive-column">
                                                    <div className="input-box messenger-box-input-wrap">
                                                        <label className="label-text" htmlFor="email">Your Email</label>
                                                        <div className="form-group">
                                                            <span className="la la-envelope-o form-icon"></span>
                                                            <input onChange={this.handleInput} value={this.state.email} className="form-control" type="email" name="email" id="email"
                                                                   placeholder="Email address" required/>
                                                            <p className="text-danger">{this.state.errors.email}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div className="col-lg-12 responsive-column">
                                                    <div className="input-box messenger-box-input-wrap">
                                                        <label className="label-text" htmlFor="name">Subject</label>
                                                        <div className="form-group">
                                                            <span className="la la-pencil form-icon"></span>
                                                            <input onChange={this.handleInput} value={this.state.subject} className="form-control" type="text" id="subject" name="subject"
                                                                   placeholder="Subject" required/>
                                                            <p className="text-danger">{this.state.errors.subject}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div className="col-lg-12">
                                                    <div className="input-box messenger-box-input-wrap">
                                                        <label className="label-text" htmlFor="message">Message</label>
                                                        <div className="form-group">
                                                            <span className="la la-pencil form-icon"></span>
                                                            <textarea onChange={this.handleInput} value={this.state.message} className="message-control form-control" name="message"
                                                                      id="message" placeholder="Write message" required/>
                                                            <p className="text-danger">{this.state.errors.message}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div className="col-lg-12">
                                                    <div className="btn-box messenger-box-input-wrap">
                                                        {this.state.processing === true ? (
                                                            <>
                                                                <button type="submit" className="theme-btn send-message-btn disabled"><i className="las la-spin la-spinner"></i> Send Message</button>
                                                            </>
                                                        ) : (
                                                            <button type="submit" className="theme-btn send-message-btn"><i className="la la-envelope ml-1"></i> Send Message</button>
                                                        )}
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="col-lg-4">
                                <div className="form-box">
                                    <div className="form-title-wrap">
                                        <h3 className="title">Contact Us</h3>
                                    </div>
                                    <div className="form-content">
                                        <div className="address-book">
                                            <ul className="list-items contact-address">
                                                <li>
                                                    <i className="la la-map-marker icon-element"></i>
                                                    <h5 className="title font-size-16 pb-1">Address</h5>
                                                    <p className="map__desc">
                                                        Melbourne, Australia, 105 South Park Avenue
                                                    </p>
                                                </li>
                                                <li>
                                                    <i className="la la-phone icon-element"></i>
                                                    <h5 className="title font-size-16 pb-1">Phone</h5>
                                                    <p className="map__desc">Telephone: 2800 256 508</p>
                                                    <p className="map__desc">Mobile: 666 777 888</p>
                                                </li>
                                                <li>
                                                    <i className="la la-envelope-o icon-element"></i>
                                                    <h5 className="title font-size-16 pb-1">Email</h5>
                                                    <p className="map__desc">needhelp@trizen.com</p>
                                                    <p className="map__desc">inquiry@trizen.com</p>
                                                </li>
                                            </ul>
                                            <ul className="social-profile text-center">
                                                <li><a href="#"><i className="lab la-facebook-f"></i></a></li>
                                                <li><a href="#"><i className="lab la-twitter"></i></a></li>
                                                <li><a href="#"><i className="lab la-instagram"></i></a></li>
                                                <li><a href="#"><i className="lab la-linkedin-in"></i></a></li>
                                                <li><a href="#"><i className="lab la-youtube"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section className="map-area padding-bottom-100px">
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12">
                                <div className="map-container">
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1818.9123250374973!2d89.03483124313816!3d24.24791097955714!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39fc19480ab9e8f1%3A0xb81c6954c89f1ccb!2sWalia%20Bazar!5e0!3m2!1sen!2sbd!4v1641884470509!5m2!1sen!2sbd"
                                        width="100%" height="450" style={{"border":"0"}} allowFullScreen=""
                                        loading="lazy"></iframe>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default HelpAndSupport;