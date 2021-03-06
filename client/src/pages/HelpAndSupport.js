import React, {Component} from 'react';
import {Link} from "react-router-dom";

class HelpAndSupport extends Component {
    componentDidMount() {
        window.scrollTo(0, 0);
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
                                            <form className="row messenger-box-form" method="post" action="https://techydevs.com/demos/themes/html/trizen-demo/trizen/mailer.php">
                                                <div className="alert alert-success messenger-box-contact__msg col-lg-12"
                                                     style={{"display": "none"}} role="alert">
                                                    Thank You! Your message has been sent.
                                                </div>
                                                <div className="col-lg-6 responsive-column">
                                                    <div className="input-box messenger-box-input-wrap">
                                                        <label className="label-text" htmlFor="name">Your Name</label>
                                                        <div className="form-group">
                                                            <span className="la la-user form-icon"></span>
                                                            <input className="form-control" type="text" id="name" name="name"
                                                                   placeholder="Your name" required/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div className="col-lg-6 responsive-column">
                                                    <div className="input-box messenger-box-input-wrap">
                                                        <label className="label-text" htmlFor="email">Your Email</label>
                                                        <div className="form-group">
                                                            <span className="la la-envelope-o form-icon"></span>
                                                            <input className="form-control" type="email" name="email" id="email"
                                                                   placeholder="Email address" required/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div className="col-lg-12">
                                                    <div className="input-box messenger-box-input-wrap">
                                                        <label className="label-text" htmlFor="message">Message</label>
                                                        <div className="form-group">
                                                            <span className="la la-pencil form-icon"></span>
                                                            <textarea className="message-control form-control" name="message"
                                                                      id="message" placeholder="Write message" required/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div className="col-lg-12">
                                                    <div className="btn-box messenger-box-input-wrap">
                                                        <button name="submit" type="submit" className="theme-btn send-message-btn"
                                                                id="send-message-btn">Send Message</button>
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