import React, {Component} from 'react';
import {Link} from "react-router-dom";

class Faq extends Component {
    componentDidMount() {
        window.scrollTo(0, 0);
    }

    render() {
        return (
            <>
                <section className="breadcrumb-area bread-bg-9">
                    <div className="breadcrumb-wrap">
                        <div className="container">
                            <div className="row align-items-center">
                                <div className="col-lg-6">
                                    <div className="breadcrumb-content">
                                        <div className="section-heading">
                                            <h2 className="sec__title text-white">Faq</h2>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-6">
                                    <div className="breadcrumb-list text-right">
                                        <ul className="list-items">
                                            <li><Link to="/">Home</Link></li>
                                            <li>Faq</li>
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
                                    <h2 className="sec__title">Frequently Asked Questions</h2>
                                </div>
                            </div>
                        </div>
                        <div className="row padding-top-60px">
                            <div className="col-lg-6">
                                <div className="faq-item mb-5">
                                    <h3 className="title font-weight-bold">Cancellations</h3>
                                    <ul className="toggle-menu list-items list-items-flush pt-4">
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                Can I cancel my booking?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                If I need to cancel my booking, will I pay a fee?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                Can I cancel or change my dates for a non-refundable booking?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                How do I know if my booking was cancelled?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                Where can I find my property's cancellation policy?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div className="col-lg-6">
                                <div className="faq-item mb-5">
                                    <h3 className="title font-weight-bold">Payment</h3>
                                    <ul className="toggle-menu list-items list-items-flush pt-4">
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                What payment methods are accepted?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                Can I pay with a deposit, or prepayment?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                I’ve been charged. Do I need to do anything?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                Where can I see the payment policy for my booking?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                Why do I need to provide my card details?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div className="col-lg-6">
                                <div className="faq-item mb-5">
                                    <h3 className="title font-weight-bold">Booking details</h3>
                                    <ul className="toggle-menu list-items list-items-flush pt-4">
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                How do I get more information about the room or property's facilities?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                Is it possible to get an extra bed or cot for a child?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                How can I get an invoice?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                I can't find my confirmation email. What should I do?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                Will I pay the full price for my children?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div className="col-lg-6">
                                <div className="faq-item mb-5">
                                    <h3 className="title font-weight-bold">Communications</h3>
                                    <ul className="toggle-menu list-items list-items-flush pt-4">
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                What is the Booking Assistant?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                Where can I find the Booking Assistant?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                How can the Booking Assistant help me?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                Where does the Booking Assistant get information?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                Can I use the Booking Assistant in my language?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div className="col-lg-6">
                                <div className="faq-item mb-5">
                                    <h3 className="title font-weight-bold">Room types</h3>
                                    <ul className="toggle-menu list-items list-items-flush pt-4">
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                What's the difference between a Double room and a Twin room?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                What do "non-refundable" and "free cancellation" mean?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                Can I request an extra bed in my room and will there be extra costs?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                Is it possible to get an extra bed or cot for a child?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div className="col-lg-6">
                                <div className="faq-item mb-5">
                                    <h3 className="title font-weight-bold">Pricing</h3>
                                    <ul className="toggle-menu list-items list-items-flush pt-4">
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                Is breakfast included in the price?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                What does the price include?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                Are taxes included in the price?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                Do I pay a reservation fee to Tripstar.com?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div className="col-lg-6">
                                <div className="faq-item mb-5">
                                    <h3 className="title font-weight-bold">Credit cards</h3>
                                    <ul className="toggle-menu list-items list-items-flush pt-4">
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                Can I use a debit card to complete my reservation?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                Can I make a reservation without a credit card?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                Why do I need to give my credit card details?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                Can I make a reservation for myself using someone else’s credit card?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div className="col-lg-6">
                                <div className="faq-item mb-5">
                                    <h3 className="title font-weight-bold">Security and awareness</h3>
                                    <ul className="toggle-menu list-items list-items-flush pt-4">
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                What is social engineering?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                How can I avoid social engineering attempts?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                I was recently asked to pay using my gift card over the phone. Is that okay?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" className="toggle-menu-icon d-flex justify-content-between align-items-center">
                                                I think I have been the victim of a scam. What should I do?
                                                <i className="la la-angle-down"></i>
                                            </a>
                                            <ul className="toggle-drop-menu pt-2">
                                                <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section className="cta-area cta-bg-2 bg-fixed padding-top-60px padding-bottom-60px">
                    <div className="container">
                        <div className="row align-items-center">
                            <div className="col-lg-7">
                                <div className="section-heading">
                                    <h2 className="sec__title font-size-30 text-white">Couldn't Find a Solution?</h2>
                                    <p className="sec__desc text-white pt-1">Submit a ticket to our support desk.</p>
                                </div>
                            </div>
                            <div className="col-lg-5">
                                <div className="btn-box btn--box text-right">
                                    <Link to="/contact-us" className="theme-btn border-0">Contact Us</Link>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default Faq;