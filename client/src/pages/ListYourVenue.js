import React, {Component} from 'react';
import {Link} from "react-router-dom";

class ListYourVenue extends Component {
    render() {
        return (
            <>
                <section className="breadcrumb-area gradient-bg-gray before-none">
                    <div className="breadcrumb-wrap">
                        <div className="container">
                            <div className="row d-flex flex-wrap align-items-center justify-content-between">
                                <div className="col-sm-6 mb-5">
                                    <div className="breadcrumb-content">
                                        <div className="section-heading text-left">
                                            <h2 className="sec__title mb-4 line-height-55">
                                                List your <br/> <span className="text-color">Venues, Resorts, Hotels</span> <br/> on {process.env.REACT_APP_PLAIN_DOMAIN}
                                            </h2>
                                            <p className="sec__desc font-weight-regular pb-2">Registration is free and can take as little as 15 minutes to complete – get started today</p>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-6">
                                    <div className="card-item">
                                        <div className="card-body border-bottom pb-3">
                                            <h3 className="card-title mb-3 font-size-25">Create new listing</h3>
                                            <ul className="list-items list-items-bullet">
                                                <li>More than 6.4 million vacation rentals already listed</li>
                                                <li>Over 1 billion vacation rental guest arrivals</li>
                                                <li>More than 40% of new vacation rental listings get their first booking within a week</li>
                                            </ul>
                                        </div>

                                        <div className="card-body border-bottom">
                                            <h3 className="card-title mb-3 font-size-16">Create a partner account to get started:</h3>
                                            <p className="font-size-14 line-height-22">By continuing, you agree to let Booking.com email you regarding your property registration.</p>
                                            <Link to="/register" className="theme-btn btn-block text-center mt-3">Get Started <i className="las la-arrow-right"></i></Link>
                                        </div>

                                        <div className="card-body">
                                            <h3 className="card-title mb-1 font-size-16">Already started registration?</h3>
                                            <Link to="/manage/venue/organization/create">Continue your registration</Link>
                                        </div>
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

                <section className="padding-bottom-20px padding-top-100px">
                    <div className="breadcrumb-wrap">
                        <div className="container">
                            <div className="row d-flex flex-wrap align-items-center justify-content-between">
                                <div className="col-sm-7 mb-5">
                                    <div className="section-heading">
                                        <h1 className="font-size-35 text-black font-weight-bold">Your peace of mind is our top priority</h1>
                                        <p className="pt-2">Here’s how we’re helping you feel confident welcoming guests:</p>
                                    </div>
                                    <div className="mt-5 mb-5">
                                        <div className="single-tour-feature d-flex align-items-center mb-4">
                                            <div className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"><i className="la la-check"></i></div>
                                            <div className="single-feature-titles">
                                                <h3 className="title font-size-15 font-weight-medium">Set <strong>house rules</strong> guest must agree to before they stay</h3>
                                            </div>
                                        </div>
                                        <div className="single-tour-feature d-flex align-items-center mb-4">
                                            <div className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"><i className="la la-check"></i></div>
                                            <div className="single-feature-titles">
                                                <h3 className="title font-size-15 font-weight-medium">Request <strong>damage deposits</strong> for extra security</h3>
                                            </div>
                                        </div>
                                        <div className="single-tour-feature d-flex align-items-center mb-4">
                                            <div className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"><i className="la la-check"></i></div>
                                            <div className="single-feature-titles">
                                                <h3 className="title font-size-15 font-weight-medium"><strong>Report guest misconduct</strong> if something goes wrong</h3>
                                            </div>
                                        </div>
                                        <div className="single-tour-feature d-flex align-items-center mb-4">
                                            <div className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"><i className="la la-check"></i></div>
                                            <div className="single-feature-titles">
                                                <h3 className="title font-size-15 font-weight-medium">Access <strong>24/7 support</strong> in 43+ languages</h3>
                                            </div>
                                        </div>
                                        <div className="single-tour-feature d-flex align-items-center mb-4">
                                            <div className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"><i className="la la-check"></i></div>
                                            <div className="single-feature-titles">
                                                <h3 className="title font-size-15 font-weight-medium">Protection against liability claims from guests and neighbors up to $1,000,000 for every reservation</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-5">
                                    <img src={`${process.env.REACT_APP_CLIENT_DOMAIN}/assets/images/peace-of-mind.svg`}/>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section className="section-bg padding-bottom-50px padding-top-100px">
                    <div className="breadcrumb-wrap">
                        <div className="container">
                            <div className="row d-flex flex-wrap align-items-center justify-content-between">
                                <div className="col-sm-12 mb-5">
                                    <div className="section-heading">
                                        <h1 className="font-size-35 text-black font-weight-bold">Which best describes you?</h1>
                                        <p className="pt-2">Select one of the options to see customized info</p>
                                    </div>
                                </div>
                                <div className="col-sm-6 mb-5">
                                    <div className="card-item">
                                        <div className="card-body">
                                            <h3 className="card-title mb-2 font-weight-bold">I have a property I rent out occasionally</h3>

                                            <ul className="list-items list-items-check mt-4">
                                                <li>This property is where I keep my personal belongings</li>
                                                <li>I have limited experience working in the hospitality industry</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-6 mb-5">
                                    <div className="card-item">
                                        <div className="card-body">
                                            <h3 className="card-title mb-2 font-weight-bold">I have multiple properties I rent out year-round</h3>

                                            <ul className="list-items list-items-check mt-4">
                                                <li>These properties are primarily used for guests</li>
                                                <li>I have experience working in the hospitality industry</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section className="padding-bottom-30px padding-top-100px">
                    <div className="breadcrumb-wrap">
                        <div className="container">
                            <div className="row d-flex flex-wrap align-items-center justify-content-between">
                                <div className="col-sm-12 margin-bottom-70px">
                                    <div className="section-heading">
                                        <h1 className="font-size-35 text-black font-weight-bold">Benefits of working with us</h1>
                                    </div>
                                </div>
                                <div className="d-flex flex-wrap justify-content-between">
                                    <div className="col-sm-5 margin-bottom-70px">
                                        <img className="mb-4 d-block" src={`${process.env.REACT_APP_CLIENT_DOMAIN}/assets/images/benefits_1.png`}/>
                                        <h3 className="title mb-2 font-weight-bold">List any type of property</h3>
                                        <p>Apartments to villas and everything in between can be listed for free.</p>
                                    </div>
                                    <div className="col-sm-5 margin-bottom-70px">
                                        <img className="mb-4 d-block" src={`${process.env.REACT_APP_CLIENT_DOMAIN}/assets/images/benefits_2.png`}/>
                                        <h3 className="title mb-2 font-weight-bold">Easily import details</h3>
                                        <p>To save you time, many of the details from your existing listings can be imported.</p>
                                    </div>
                                    <div className="col-sm-5 margin-bottom-70px">
                                        <img className="mb-4 d-block" src={`${process.env.REACT_APP_CLIENT_DOMAIN}/assets/images/benefits_3.png`}/>
                                        <h3 className="title mb-2 font-weight-bold">Step-by-step guidance</h3>
                                        <p>You’ll learn how our platform works, best practices, and things to watch out for.</p>
                                    </div>
                                    <div className="col-sm-5 margin-bottom-70px">
                                        <img className="mb-4 d-block" src={`${process.env.REACT_APP_CLIENT_DOMAIN}/assets/images/benefits_4.png`}/>
                                        <h3 className="title mb-2 font-weight-bold">Exclusive discounts</h3>
                                        <p>Discounts on products and services that save time and improve the guest experience.</p>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </section>

                <section className="padding-bottom-40px padding-top-20px">
                    <div className="breadcrumb-wrap">
                        <div className="container">
                            <div className="row d-flex flex-wrap align-items-center justify-content-between">
                                <div className="col-sm-7 mb-5">
                                    <div className="section-heading">
                                        <h1 className="font-size-35 text-black font-weight-bold">Get to know your guests</h1>
                                        <p className="pt-2">No matter where they’re from, our guests share a few similarities.</p>
                                    </div>
                                    <div className="mt-5 mb-5">
                                        <div className="single-tour-feature d-flex align-items-center mb-4">
                                            <div className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"><i className="la la-check"></i></div>
                                            <div className="single-feature-titles">
                                                <h3 className="title font-size-15 font-weight-medium">75% of nights booked are by guests with 5 or more previous bookings</h3>
                                            </div>
                                        </div>
                                        <div className="single-tour-feature d-flex align-items-center mb-4">
                                            <div className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"><i className="la la-check"></i></div>
                                            <div className="single-feature-titles">
                                                <h3 className="title font-size-15 font-weight-medium">68% of nights booked are by families and couples</h3>
                                            </div>
                                        </div>
                                        <div className="single-tour-feature d-flex align-items-center mb-4">
                                            <div className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"><i className="la la-check"></i></div>
                                            <div className="single-feature-titles">
                                                <h3 className="title font-size-15 font-weight-medium">42% of nights booked are for properties other than hotels</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-sm-5">
                                    <img src={`${process.env.REACT_APP_CLIENT_DOMAIN}/assets/images/meet-guests.svg`}/>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section className="padding-bottom-100px padding-top-20px">
                    <div className="breadcrumb-wrap">
                        <div className="container">
                            <div className="row">
                                <div className="col-lg-12">
                                    <div className="section-heading margin-bottom-20px">
                                        <h2 className="font-size-35 text-black font-weight-bold">Your questions answered</h2>
                                    </div>
                                </div>
                                <div className="col-lg-6">
                                    <div className="faq-item">
                                        <ul className="toggle-menu list-items list-items-flush pt-4">
                                            <li className="border-top border-bottom">
                                                <a href="#" className="font-size-22 title pt-3 pb-1 font-weight-bold toggle-menu-icon d-flex justify-content-between align-items-center">
                                                    What happens if my property is damaged by a guest?
                                                    <i className="la la-angle-down"></i>
                                                </a>
                                                <ul className="toggle-drop-menu pt-4">
                                                    <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div className="col-lg-6">
                                    <div className="faq-item">
                                        <ul className="toggle-menu list-items list-items-flush pt-4">
                                            <li className="border-top border-bottom">
                                                <a href="#" className="font-size-22 title pt-3 pb-1 font-weight-bold toggle-menu-icon d-flex justify-content-between align-items-center">
                                                    When will my property go online?
                                                    <i className="la la-angle-down"></i>
                                                </a>
                                                <ul className="toggle-drop-menu pt-4">
                                                    <li className="line-height-26">Suspendisse ullamcorper lacus et commodo laoreet. Sed sodales aliquet felis, quis volutpat massa imperdiet in. Praesent rutrum malesuada risus, ullamcorper pretium tortor</li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div className="col-sm-12">
                                    <p>Still have questions? Find answers to all your questions in our <Link to="/faq">FAQ</Link> </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default ListYourVenue;