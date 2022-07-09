import React, {Component} from 'react';
import {useLocation, useNavigate, useParams} from "react-router-dom";

class VenueDetails extends Component {
    constructor(props) {
        super();
        this.state = {}
    }

    componentDidMount() {
        window.scrollTo(0, 0);
        let slug = this.props.params.venue_slug;
        console.log(slug);
    }

    render() {
        return (
            <>
                <section className="breadcrumb-top-bar">
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12">
                                <div className="breadcrumb-list breadcrumb-top-list">
                                    <ul className="list-items bg-transparent radius-none p-0">
                                        <li><a href="home-index.html">Home</a></li>
                                        <li>France</li>
                                        <li>Hilton Hotels and Resorts</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section className="breadcrumb-area bread-bg-7 py-0">
                    <div className="breadcrumb-wrap">
                        <div className="container">
                            <div className="row">
                                <div className="col-lg-12">
                                    <div className="breadcrumb-btn">
                                        <div className="btn-box">
                                            <a
                                                className="theme-btn"
                                                data-fancybox="video"
                                                data-src="https://www.youtube.com/watch?v=5u1WISBbo5I"
                                                data-speed="700"
                                            >
                                                <i className="la la-video-camera mr-2"></i>Video
                                            </a>
                                            <a
                                                className="theme-btn"
                                                data-src="images/img1.jpg"
                                                data-fancybox="gallery"
                                                data-caption="Showing image - 01"
                                                data-speed="700"
                                            >
                                                <i className="la la-photo mr-2"></i>More Photos
                                            </a>
                                        </div>
                                        <a
                                            className="d-none"
                                            data-fancybox="gallery"
                                            data-src="images/img2.jpg"
                                            data-caption="Showing image - 02"
                                            data-speed="700"
                                        ></a>
                                        <a
                                            className="d-none"
                                            data-fancybox="gallery"
                                            data-src="images/img3.jpg"
                                            data-caption="Showing image - 03"
                                            data-speed="700"
                                        ></a>
                                        <a
                                            className="d-none"
                                            data-fancybox="gallery"
                                            data-src="images/img4.jpg"
                                            data-caption="Showing image - 04"
                                            data-speed="700"
                                        ></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section className="tour-detail-area padding-bottom-90px">
                    <div
                        className="single-content-navbar-wrap menu section-bg"
                        id="single-content-navbar"
                    >
                        <div className="container">
                            <div className="row">
                                <div className="col-lg-12">
                                    <div className="single-content-nav" id="single-content-nav">
                                        <ul>
                                            <li>
                                                <a
                                                    data-scroll="description"
                                                    href="#description"
                                                    className="scroll-link active"
                                                >Hotels Details</a
                                                >
                                            </li>
                                            <li>
                                                <a
                                                    data-scroll="availability"
                                                    href="#availability"
                                                    className="scroll-link"
                                                >Availability</a
                                                >
                                            </li>
                                            <li>
                                                <a
                                                    data-scroll="amenities"
                                                    href="#amenities"
                                                    className="scroll-link"
                                                >Amenities</a
                                                >
                                            </li>
                                            <li>
                                                <a data-scroll="faq" href="#faq" className="scroll-link">Faq</a>
                                            </li>
                                            <li>
                                                <a data-scroll="reviews" href="#reviews" className="scroll-link"
                                                >Reviews</a
                                                >
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div className="single-content-box">
                        <div className="container">
                            <div className="row">
                                <div className="col-lg-8">
                                    <div className="single-content-wrap padding-top-60px">
                                        <div id="description" className="page-scroll">
                                            <div className="single-content-item pb-4">
                                                <h3 className="title font-size-26">Hilton Hotels and Resorts</h3>
                                                <div className="d-flex align-items-center pt-2">
                                                    <p className="mr-2">Boston, MA, USA</p>
                                                    <p>
                        <span
                            className="badge badge-warning text-white font-size-16"
                        >4.7</span
                        >
                                                        <span>(4,209 Reviews)</span>
                                                    </p>
                                                </div>
                                            </div>
                                            <div className="section-block"></div>
                                            <div className="single-content-item py-4">
                                                <div className="row">
                                                    <div className="col-lg-4 responsive-column">
                                                        <div
                                                            className="single-tour-feature d-flex align-items-center mb-3"
                                                        >
                                                            <div
                                                                className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                            >
                                                                <i className="la la-hotel"></i>
                                                            </div>
                                                            <div className="single-feature-titles">
                                                                <h3 className="title font-size-15 font-weight-medium">
                                                                    Hotels Type
                                                                </h3>
                                                                <span className="font-size-13">4 Star</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div className="col-lg-4 responsive-column">
                                                        <div
                                                            className="single-tour-feature d-flex align-items-center mb-3"
                                                        >
                                                            <div
                                                                className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                            >
                                                                <i className="la la-user"></i>
                                                            </div>
                                                            <div className="single-feature-titles">
                                                                <h3 className="title font-size-15 font-weight-medium">
                                                                    Extra People
                                                                </h3>
                                                                <span className="font-size-13">No Charge</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div className="col-lg-4 responsive-column">
                                                        <div
                                                            className="single-tour-feature d-flex align-items-center mb-3"
                                                        >
                                                            <div
                                                                className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                            >
                                                                <i className="la la-bed"></i>
                                                            </div>
                                                            <div className="single-feature-titles">
                                                                <h3 className="title font-size-15 font-weight-medium">
                                                                    Minimum Stay
                                                                </h3>
                                                                <span className="font-size-13">2 Nights</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div className="col-lg-4 responsive-column">
                                                        <div
                                                            className="single-tour-feature d-flex align-items-center mb-3"
                                                        >
                                                            <div
                                                                className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                            >
                                                                <i className="la la-money"></i>
                                                            </div>
                                                            <div className="single-feature-titles">
                                                                <h3 className="title font-size-15 font-weight-medium">
                                                                    Security Deposit
                                                                </h3>
                                                                <span className="font-size-13">$279</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div className="col-lg-4 responsive-column">
                                                        <div
                                                            className="single-tour-feature d-flex align-items-center mb-3"
                                                        >
                                                            <div
                                                                className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                            >
                                                                <i className="la la-globe"></i>
                                                            </div>
                                                            <div className="single-feature-titles">
                                                                <h3 className="title font-size-15 font-weight-medium">
                                                                    Country
                                                                </h3>
                                                                <span className="font-size-13">France</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div className="col-lg-4 responsive-column">
                                                        <div
                                                            className="single-tour-feature d-flex align-items-center mb-3"
                                                        >
                                                            <div
                                                                className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                            >
                                                                <i className="la la-map"></i>
                                                            </div>
                                                            <div className="single-feature-titles">
                                                                <h3 className="title font-size-15 font-weight-medium">
                                                                    City
                                                                </h3>
                                                                <span className="font-size-13">Paris</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div className="col-lg-4 responsive-column">
                                                        <div
                                                            className="single-tour-feature d-flex align-items-center mb-3"
                                                        >
                                                            <div
                                                                className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                            >
                                                                <i className="la la-user"></i>
                                                            </div>
                                                            <div className="single-feature-titles">
                                                                <h3 className="title font-size-15 font-weight-medium">
                                                                    Neighborhood
                                                                </h3>
                                                                <span className="font-size-13">République</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div className="col-lg-4 responsive-column">
                                                        <div
                                                            className="single-tour-feature d-flex align-items-center mb-3"
                                                        >
                                                            <div
                                                                className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                            >
                                                                <i className="la la-times"></i>
                                                            </div>
                                                            <div className="single-feature-titles">
                                                                <h3 className="title font-size-15 font-weight-medium">
                                                                    Cancellation
                                                                </h3>
                                                                <span className="font-size-13">Strict</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div className="section-block"></div>
                                            <div
                                                className="single-content-item padding-top-40px padding-bottom-40px"
                                            >
                                                <h3 className="title font-size-20">
                                                    About Hilton Hotels and Resorts
                                                </h3>
                                                <p className="py-3">
                                                    Per consequat adolescens ex, cu nibh commune temporibus
                                                    vim, ad sumo viris eloquentiam sed. Mea appareat
                                                    omittantur eloquentiam ad, nam ei quas oportere
                                                    democritum. Prima causae admodum id est, ei timeam
                                                    inimicus sed. Sit an meis aliquam, cetero inermis vel ut.
                                                    An sit illum euismod facilisis, tamquam vulputate
                                                    pertinacia eum at.
                                                </p>
                                                <p>
                                                    Cum et probo menandri. Officiis consulatu pro et, ne sea
                                                    sale invidunt, sed ut sint blandit efficiendi. Atomorum
                                                    explicari eu qui, est enim quaerendum te. Quo harum viris
                                                    id. Per ne quando dolore evertitur, pro ad cibo commune.
                                                </p>
                                            </div>
                                            <div className="section-block"></div>
                                        </div>
                                        <div id="availability" className="page-scroll">
                                            <div
                                                className="single-content-item padding-top-40px padding-bottom-30px"
                                            >
                                                <h3 className="title font-size-20">Availability</h3>
                                                <div className="contact-form-action padding-bottom-35px">
                                                    <form method="post">
                                                        <div className="row">
                                                            <div className="col-lg-6 responsive-column">
                                                                <div className="input-box">
                                                                    <label className="label-text"
                                                                    >Check in - Check out</label
                                                                    >
                                                                    <div className="form-group">
                                                                        <span
                                                                            className="la la-calendar form-icon"></span>
                                                                        <input
                                                                            className="date-range form-control"
                                                                            type="text"
                                                                            name="daterange"
                                                                            readOnly
                                                                        />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div className="col-lg-6 responsive-column">
                                                                <div className="input-box">
                                                                    <label className="label-text">Rooms</label>
                                                                    <div className="form-group">
                                                                        <div className="select-contain w-auto">
                                                                            <select className="select-contain-select">
                                                                                <option value="0">Select Rooms</option>
                                                                                <option value="1">1 Room</option>
                                                                                <option value="2">2 Rooms</option>
                                                                                <option value="3">3 Rooms</option>
                                                                                <option value="4">4 Rooms</option>
                                                                                <option value="5">5 Rooms</option>
                                                                                <option value="6">6 Rooms</option>
                                                                                <option value="7">7 Rooms</option>
                                                                                <option value="8">8 Rooms</option>
                                                                                <option value="9">9 Rooms</option>
                                                                                <option value="10">10 Rooms</option>
                                                                                <option value="11">11 Rooms</option>
                                                                                <option value="12">12 Rooms</option>
                                                                                <option value="13">13 Rooms</option>
                                                                                <option value="14">14 Rooms</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div className="col-lg-6 responsive-column">
                                                                <div className="input-box">
                                                                    <label className="label-text">Adults (18+)</label>
                                                                    <div className="form-group">
                                                                        <div className="select-contain w-auto">
                                                                            <select className="select-contain-select">
                                                                                <option value="0">Select Adults</option>
                                                                                <option value="1">1 Adults</option>
                                                                                <option value="2">2 Adults</option>
                                                                                <option value="3">3 Adults</option>
                                                                                <option value="4">4 Adults</option>
                                                                                <option value="5">5 Adults</option>
                                                                                <option value="6">6 Adults</option>
                                                                                <option value="7">7 Adults</option>
                                                                                <option value="8">8 Adults</option>
                                                                                <option value="9">9 Adults</option>
                                                                                <option value="10">10 Adults</option>
                                                                                <option value="11">11 Adults</option>
                                                                                <option value="12">12 Adults</option>
                                                                                <option value="13">13 Adults</option>
                                                                                <option value="14">14 Adults</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div className="col-lg-6 responsive-column">
                                                                <div className="input-box">
                                                                    <label className="label-text">Children
                                                                        (0-17)</label>
                                                                    <div className="form-group">
                                                                        <div className="select-contain w-auto">
                                                                            <select className="select-contain-select">
                                                                                <option value="0">Select Children
                                                                                </option>
                                                                                <option value="1">1 Children</option>
                                                                                <option value="2">2 Children</option>
                                                                                <option value="3">3 Children</option>
                                                                                <option value="4">4 Children</option>
                                                                                <option value="5">5 Children</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div className="col-lg-12">
                                                                <div className="btn-box">
                                                                    <button type="button" className="theme-btn">
                                                                        Search Now
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <h3 className="title font-size-20">Available Rooms</h3>
                                                <div className="cabin-type padding-top-30px">
                                                    <div className="cabin-type-item seat-selection-item d-flex">
                                                        <div className="cabin-type-img flex-shrink-0">
                                                            <img src="images/inside-cabin.jpg" alt=""/>
                                                        </div>
                                                        <div className="cabin-type-detail">
                                                            <h3 className="title">Standard Family Room</h3>
                                                            <div className="row padding-top-20px">
                                                                <div className="col-lg-6 responsive-column">
                                                                    <div
                                                                        className="single-tour-feature d-flex align-items-center mb-3"
                                                                    >
                                                                        <div
                                                                            className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-2"
                                                                        >
                                                                            <i className="la la-wifi"></i>
                                                                        </div>
                                                                        <div className="single-feature-titles">
                                                                            <h3
                                                                                className="title font-size-15 font-weight-medium"
                                                                            >
                                                                                Free Wi-Fi
                                                                            </h3>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div className="col-lg-6 responsive-column">
                                                                    <div
                                                                        className="single-tour-feature d-flex align-items-center mb-3"
                                                                    >
                                                                        <div
                                                                            className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-2"
                                                                        >
                                                                            <i className="la la-bed"></i>
                                                                        </div>
                                                                        <div className="single-feature-titles">
                                                                            <h3
                                                                                className="title font-size-15 font-weight-medium"
                                                                            >
                                                                                2 Single beds
                                                                            </h3>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div className="col-lg-6 responsive-column">
                                                                    <div
                                                                        className="single-tour-feature d-flex align-items-center mb-3"
                                                                    >
                                                                        <div
                                                                            className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-2"
                                                                        >
                                                                            <i className="la la-building"></i>
                                                                        </div>
                                                                        <div className="single-feature-titles">
                                                                            <h3
                                                                                className="title font-size-15 font-weight-medium"
                                                                            >
                                                                                15 m²
                                                                            </h3>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div className="col-lg-6 responsive-column">
                                                                    <div
                                                                        className="single-tour-feature d-flex align-items-center mb-3"
                                                                    >
                                                                        <div
                                                                            className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-2"
                                                                        >
                                                                            <i className="la la-hotel"></i>
                                                                        </div>
                                                                        <div className="single-feature-titles">
                                                                            <h3
                                                                                className="title font-size-15 font-weight-medium"
                                                                            >
                                                                                Shower and bathtub
                                                                            </h3>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div className="room-photos">
                                                                <a
                                                                    className="btn theme-btn-hover-gray"
                                                                    data-src="images/img1.jpg"
                                                                    data-fancybox="gallery"
                                                                    data-caption="Showing image - 01"
                                                                    data-speed="700"
                                                                >
                                                                    <i className="la la-photo mr-2"></i>Room Photos
                                                                </a>
                                                                <a
                                                                    className="d-none"
                                                                    data-fancybox="gallery"
                                                                    data-src="images/img2.jpg"
                                                                    data-caption="Showing image - 02"
                                                                    data-speed="700"
                                                                ></a>
                                                                <a
                                                                    className="d-none"
                                                                    data-fancybox="gallery"
                                                                    data-src="images/img3.jpg"
                                                                    data-caption="Showing image - 03"
                                                                    data-speed="700"
                                                                ></a>
                                                                <a
                                                                    className="d-none"
                                                                    data-fancybox="gallery"
                                                                    data-src="images/img4.jpg"
                                                                    data-caption="Showing image - 04"
                                                                    data-speed="700"
                                                                ></a>
                                                            </div>
                                                        </div>
                                                        <div className="cabin-price">
                                                            <p className="text-uppercase font-size-14">
                                                                Per/night<strong
                                                                className="mt-n1 text-black font-size-18 font-weight-black d-block"
                                                            >$121</strong
                                                            >
                                                            </p>
                                                            <div className="custom-checkbox mb-0">
                                                                <input type="checkbox" id="selectChb1"/>
                                                                <label
                                                                    htmlFor="selectChb1"
                                                                    className="theme-btn theme-btn-small"
                                                                >Select</label
                                                                >
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div className="cabin-type padding-top-30px">
                                                    <div className="cabin-type-item seat-selection-item d-flex">
                                                        <div className="cabin-type-img flex-shrink-0">
                                                            <img src="images/oceanview-cabin.jpg" alt=""/>
                                                        </div>
                                                        <div className="cabin-type-detail">
                                                            <h3 className="title">Superior Double Room</h3>
                                                            <div className="row padding-top-20px">
                                                                <div className="col-lg-6 responsive-column">
                                                                    <div
                                                                        className="single-tour-feature d-flex align-items-center mb-3"
                                                                    >
                                                                        <div
                                                                            className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-2"
                                                                        >
                                                                            <i className="la la-wifi"></i>
                                                                        </div>
                                                                        <div className="single-feature-titles">
                                                                            <h3
                                                                                className="title font-size-15 font-weight-medium"
                                                                            >
                                                                                Free Wi-Fi
                                                                            </h3>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div className="col-lg-6 responsive-column">
                                                                    <div
                                                                        className="single-tour-feature d-flex align-items-center mb-3"
                                                                    >
                                                                        <div
                                                                            className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-2"
                                                                        >
                                                                            <i className="la la-bed"></i>
                                                                        </div>
                                                                        <div className="single-feature-titles">
                                                                            <h3
                                                                                className="title font-size-15 font-weight-medium"
                                                                            >
                                                                                2 Single beds
                                                                            </h3>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div className="col-lg-6 responsive-column">
                                                                    <div
                                                                        className="single-tour-feature d-flex align-items-center mb-3"
                                                                    >
                                                                        <div
                                                                            className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-2"
                                                                        >
                                                                            <i className="la la-building"></i>
                                                                        </div>
                                                                        <div className="single-feature-titles">
                                                                            <h3
                                                                                className="title font-size-15 font-weight-medium"
                                                                            >
                                                                                15 m²
                                                                            </h3>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div className="col-lg-6 responsive-column">
                                                                    <div
                                                                        className="single-tour-feature d-flex align-items-center mb-3"
                                                                    >
                                                                        <div
                                                                            className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-2"
                                                                        >
                                                                            <i className="la la-hotel"></i>
                                                                        </div>
                                                                        <div className="single-feature-titles">
                                                                            <h3
                                                                                className="title font-size-15 font-weight-medium"
                                                                            >
                                                                                Shower and bathtub
                                                                            </h3>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div className="room-photos">
                                                                <a
                                                                    className="btn theme-btn-hover-gray"
                                                                    data-src="images/img1.jpg"
                                                                    data-fancybox="gallery"
                                                                    data-caption="Showing image - 01"
                                                                    data-speed="700"
                                                                >
                                                                    <i className="la la-photo mr-2"></i>Room Photos
                                                                </a>
                                                                <a
                                                                    className="d-none"
                                                                    data-fancybox="gallery"
                                                                    data-src="images/img2.jpg"
                                                                    data-caption="Showing image - 02"
                                                                    data-speed="700"
                                                                ></a>
                                                                <a
                                                                    className="d-none"
                                                                    data-fancybox="gallery"
                                                                    data-src="images/img3.jpg"
                                                                    data-caption="Showing image - 03"
                                                                    data-speed="700"
                                                                ></a>
                                                                <a
                                                                    className="d-none"
                                                                    data-fancybox="gallery"
                                                                    data-src="images/img4.jpg"
                                                                    data-caption="Showing image - 04"
                                                                    data-speed="700"
                                                                ></a>
                                                            </div>
                                                        </div>
                                                        <div className="cabin-price">
                                                            <p className="text-uppercase font-size-14">
                                                                Per/night<strong
                                                                className="mt-n1 text-black font-size-18 font-weight-black d-block"
                                                            >$121</strong
                                                            >
                                                            </p>
                                                            <div className="custom-checkbox mb-0">
                                                                <input type="checkbox" id="selectChb2"/>
                                                                <label
                                                                    htmlFor="selectChb2"
                                                                    className="theme-btn theme-btn-small"
                                                                >Select</label
                                                                >
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div className="cabin-type padding-top-30px">
                                                    <div className="cabin-type-item seat-selection-item d-flex">
                                                        <div className="cabin-type-img flex-shrink-0">
                                                            <img src="images/balcony-cabin.jpg" alt=""/>
                                                        </div>
                                                        <div className="cabin-type-detail">
                                                            <h3 className="title">Deluxe Single Room</h3>
                                                            <div className="row padding-top-20px">
                                                                <div className="col-lg-6 responsive-column">
                                                                    <div
                                                                        className="single-tour-feature d-flex align-items-center mb-3"
                                                                    >
                                                                        <div
                                                                            className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-2"
                                                                        >
                                                                            <i className="la la-wifi"></i>
                                                                        </div>
                                                                        <div className="single-feature-titles">
                                                                            <h3
                                                                                className="title font-size-15 font-weight-medium"
                                                                            >
                                                                                Free Wi-Fi
                                                                            </h3>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div className="col-lg-6 responsive-column">
                                                                    <div
                                                                        className="single-tour-feature d-flex align-items-center mb-3"
                                                                    >
                                                                        <div
                                                                            className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-2"
                                                                        >
                                                                            <i className="la la-bed"></i>
                                                                        </div>
                                                                        <div className="single-feature-titles">
                                                                            <h3
                                                                                className="title font-size-15 font-weight-medium"
                                                                            >
                                                                                2 Single beds
                                                                            </h3>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div className="col-lg-6 responsive-column">
                                                                    <div
                                                                        className="single-tour-feature d-flex align-items-center mb-3"
                                                                    >
                                                                        <div
                                                                            className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-2"
                                                                        >
                                                                            <i className="la la-building"></i>
                                                                        </div>
                                                                        <div className="single-feature-titles">
                                                                            <h3
                                                                                className="title font-size-15 font-weight-medium"
                                                                            >
                                                                                15 m²
                                                                            </h3>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div className="col-lg-6 responsive-column">
                                                                    <div
                                                                        className="single-tour-feature d-flex align-items-center mb-3"
                                                                    >
                                                                        <div
                                                                            className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-2"
                                                                        >
                                                                            <i className="la la-hotel"></i>
                                                                        </div>
                                                                        <div className="single-feature-titles">
                                                                            <h3
                                                                                className="title font-size-15 font-weight-medium"
                                                                            >
                                                                                Shower and bathtub
                                                                            </h3>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div className="room-photos">
                                                                <a
                                                                    className="btn theme-btn-hover-gray"
                                                                    data-src="images/img1.jpg"
                                                                    data-fancybox="gallery"
                                                                    data-caption="Showing image - 01"
                                                                    data-speed="700"
                                                                >
                                                                    <i className="la la-photo mr-2"></i>Room Photos
                                                                </a>
                                                                <a
                                                                    className="d-none"
                                                                    data-fancybox="gallery"
                                                                    data-src="images/img2.jpg"
                                                                    data-caption="Showing image - 02"
                                                                    data-speed="700"
                                                                ></a>
                                                                <a
                                                                    className="d-none"
                                                                    data-fancybox="gallery"
                                                                    data-src="images/img3.jpg"
                                                                    data-caption="Showing image - 03"
                                                                    data-speed="700"
                                                                ></a>
                                                                <a
                                                                    className="d-none"
                                                                    data-fancybox="gallery"
                                                                    data-src="images/img4.jpg"
                                                                    data-caption="Showing image - 04"
                                                                    data-speed="700"
                                                                ></a>
                                                            </div>
                                                        </div>
                                                        <div className="cabin-price">
                                                            <p className="text-uppercase font-size-14">
                                                                Per/night<strong
                                                                className="mt-n1 text-black font-size-18 font-weight-black d-block"
                                                            >$121</strong
                                                            >
                                                            </p>
                                                            <div className="custom-checkbox mb-0">
                                                                <input type="checkbox" id="selectChb3"/>
                                                                <label
                                                                    htmlFor="selectChb3"
                                                                    className="theme-btn theme-btn-small"
                                                                >Select</label
                                                                >
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div className="cabin-type padding-top-30px">
                                                    <div className="cabin-type-item seat-selection-item d-flex">
                                                        <div className="cabin-type-img flex-shrink-0">
                                                            <img src="images/suite-cabin.jpg" alt=""/>
                                                        </div>
                                                        <div className="cabin-type-detail">
                                                            <h3 className="title">Single Bed Room</h3>
                                                            <div className="row padding-top-20px">
                                                                <div className="col-lg-6 responsive-column">
                                                                    <div
                                                                        className="single-tour-feature d-flex align-items-center mb-3"
                                                                    >
                                                                        <div
                                                                            className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-2"
                                                                        >
                                                                            <i className="la la-wifi"></i>
                                                                        </div>
                                                                        <div className="single-feature-titles">
                                                                            <h3
                                                                                className="title font-size-15 font-weight-medium"
                                                                            >
                                                                                Free Wi-Fi
                                                                            </h3>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div className="col-lg-6 responsive-column">
                                                                    <div
                                                                        className="single-tour-feature d-flex align-items-center mb-3"
                                                                    >
                                                                        <div
                                                                            className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-2"
                                                                        >
                                                                            <i className="la la-bed"></i>
                                                                        </div>
                                                                        <div className="single-feature-titles">
                                                                            <h3
                                                                                className="title font-size-15 font-weight-medium"
                                                                            >
                                                                                1 Single beds
                                                                            </h3>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div className="col-lg-6 responsive-column">
                                                                    <div
                                                                        className="single-tour-feature d-flex align-items-center mb-3"
                                                                    >
                                                                        <div
                                                                            className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-2"
                                                                        >
                                                                            <i className="la la-building"></i>
                                                                        </div>
                                                                        <div className="single-feature-titles">
                                                                            <h3
                                                                                className="title font-size-15 font-weight-medium"
                                                                            >
                                                                                15 m²
                                                                            </h3>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div className="col-lg-6 responsive-column">
                                                                    <div
                                                                        className="single-tour-feature d-flex align-items-center mb-3"
                                                                    >
                                                                        <div
                                                                            className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-2"
                                                                        >
                                                                            <i className="la la-hotel"></i>
                                                                        </div>
                                                                        <div className="single-feature-titles">
                                                                            <h3
                                                                                className="title font-size-15 font-weight-medium"
                                                                            >
                                                                                Shower and bathtub
                                                                            </h3>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div className="room-photos">
                                                                <a
                                                                    className="btn theme-btn-hover-gray"
                                                                    data-src="images/img1.jpg"
                                                                    data-fancybox="gallery"
                                                                    data-caption="Showing image - 01"
                                                                    data-speed="700"
                                                                >
                                                                    <i className="la la-photo mr-2"></i>Room Photos
                                                                </a>
                                                                <a
                                                                    className="d-none"
                                                                    data-fancybox="gallery"
                                                                    data-src="images/img2.jpg"
                                                                    data-caption="Showing image - 02"
                                                                    data-speed="700"
                                                                ></a>
                                                                <a
                                                                    className="d-none"
                                                                    data-fancybox="gallery"
                                                                    data-src="images/img3.jpg"
                                                                    data-caption="Showing image - 03"
                                                                    data-speed="700"
                                                                ></a>
                                                                <a
                                                                    className="d-none"
                                                                    data-fancybox="gallery"
                                                                    data-src="images/img4.jpg"
                                                                    data-caption="Showing image - 04"
                                                                    data-speed="700"
                                                                ></a>
                                                            </div>
                                                        </div>
                                                        <div className="cabin-price">
                                                            <p className="text-uppercase font-size-14">
                                                                Per/night<strong
                                                                className="mt-n1 text-black font-size-18 font-weight-black d-block"
                                                            >$121</strong
                                                            >
                                                            </p>
                                                            <div className="custom-checkbox mb-0">
                                                                <input type="checkbox" id="selectChb4"/>
                                                                <label
                                                                    htmlFor="selectChb4"
                                                                    className="theme-btn theme-btn-small"
                                                                >Select</label
                                                                >
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div className="section-block"></div>
                                        </div>
                                        <div id="amenities" className="page-scroll">
                                            <div
                                                className="single-content-item padding-top-40px padding-bottom-20px"
                                            >
                                                <h3 className="title font-size-20">Amenities</h3>
                                                <div className="amenities-feature-item pt-4">
                                                    <div className="row">
                                                        <div className="col-lg-4 responsive-column">
                                                            <div
                                                                className="single-tour-feature d-flex align-items-center mb-3"
                                                            >
                                                                <div
                                                                    className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                                >
                                                                    <i className="la la-wifi"></i>
                                                                </div>
                                                                <div className="single-feature-titles">
                                                                    <h3 className="title font-size-15 font-weight-medium">
                                                                        WI-FI
                                                                    </h3>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-4 responsive-column">
                                                            <div
                                                                className="single-tour-feature d-flex align-items-center mb-3"
                                                            >
                                                                <div
                                                                    className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                                >
                                                                    <i className="la la-check"></i>
                                                                </div>
                                                                <div className="single-feature-titles">
                                                                    <h3 className="title font-size-15 font-weight-medium">
                                                                        Swimming Pool
                                                                    </h3>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-4 responsive-column">
                                                            <div
                                                                className="single-tour-feature d-flex align-items-center mb-3"
                                                            >
                                                                <div
                                                                    className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                                >
                                                                    <i className="la la-television"></i>
                                                                </div>
                                                                <div className="single-feature-titles">
                                                                    <h3 className="title font-size-15 font-weight-medium">
                                                                        Television
                                                                    </h3>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-4 responsive-column">
                                                            <div
                                                                className="single-tour-feature d-flex align-items-center mb-3"
                                                            >
                                                                <div
                                                                    className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                                >
                                                                    <i className="la la-coffee"></i>
                                                                </div>
                                                                <div className="single-feature-titles">
                                                                    <h3 className="title font-size-15 font-weight-medium">
                                                                        Coffee
                                                                    </h3>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-4 responsive-column">
                                                            <div
                                                                className="single-tour-feature d-flex align-items-center mb-3"
                                                            >
                                                                <div
                                                                    className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                                >
                                                                    <i className="la la-tree"></i>
                                                                </div>
                                                                <div className="single-feature-titles">
                                                                    <h3 className="title font-size-15 font-weight-medium">
                                                                        Air Conditioning
                                                                    </h3>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-4 responsive-column">
                                                            <div
                                                                className="single-tour-feature d-flex align-items-center mb-3"
                                                            >
                                                                <div
                                                                    className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                                >
                                                                    <i className="la la-gear"></i>
                                                                </div>
                                                                <div className="single-feature-titles">
                                                                    <h3 className="title font-size-15 font-weight-medium">
                                                                        Fitness Facility
                                                                    </h3>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-4 responsive-column">
                                                            <div
                                                                className="single-tour-feature d-flex align-items-center mb-3"
                                                            >
                                                                <div
                                                                    className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                                >
                                                                    <i className="la la-check"></i>
                                                                </div>
                                                                <div className="single-feature-titles">
                                                                    <h3 className="title font-size-15 font-weight-medium">
                                                                        Fridge
                                                                    </h3>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-4 responsive-column">
                                                            <div
                                                                className="single-tour-feature d-flex align-items-center mb-3"
                                                            >
                                                                <div
                                                                    className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                                >
                                                                    <i className="la la-glass"></i>
                                                                </div>
                                                                <div className="single-feature-titles">
                                                                    <h3 className="title font-size-15 font-weight-medium">
                                                                        Wine Bar
                                                                    </h3>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-4 responsive-column">
                                                            <div
                                                                className="single-tour-feature d-flex align-items-center mb-3"
                                                            >
                                                                <div
                                                                    className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                                >
                                                                    <i className="la la-music"></i>
                                                                </div>
                                                                <div className="single-feature-titles">
                                                                    <h3 className="title font-size-15 font-weight-medium">
                                                                        Entertainment
                                                                    </h3>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-4 responsive-column">
                                                            <div
                                                                className="single-tour-feature d-flex align-items-center mb-3"
                                                            >
                                                                <div
                                                                    className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                                >
                                                                    <i className="la la-lock"></i>
                                                                </div>
                                                                <div className="single-feature-titles">
                                                                    <h3 className="title font-size-15 font-weight-medium">
                                                                        Secure Vault
                                                                    </h3>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-4 responsive-column">
                                                            <div
                                                                className="single-tour-feature d-flex align-items-center mb-3"
                                                            >
                                                                <div
                                                                    className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                                >
                                                                    <i className="la la-car"></i>
                                                                </div>
                                                                <div className="single-feature-titles">
                                                                    <h3 className="title font-size-15 font-weight-medium">
                                                                        Pick And Drop
                                                                    </h3>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-4 responsive-column">
                                                            <div
                                                                className="single-tour-feature d-flex align-items-center mb-3"
                                                            >
                                                                <div
                                                                    className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                                >
                                                                    <i className="la la-check"></i>
                                                                </div>
                                                                <div className="single-feature-titles">
                                                                    <h3 className="title font-size-15 font-weight-medium">
                                                                        Room Service
                                                                    </h3>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-4 responsive-column">
                                                            <div
                                                                className="single-tour-feature d-flex align-items-center mb-3"
                                                            >
                                                                <div
                                                                    className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                                >
                                                                    <i className="la la-check-circle"></i>
                                                                </div>
                                                                <div className="single-feature-titles">
                                                                    <h3 className="title font-size-15 font-weight-medium">
                                                                        Pets Allowed
                                                                    </h3>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-4 responsive-column">
                                                            <div
                                                                className="single-tour-feature d-flex align-items-center mb-3"
                                                            >
                                                                <div
                                                                    className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                                >
                                                                    <i className="la la-coffee"></i>
                                                                </div>
                                                                <div className="single-feature-titles">
                                                                    <h3 className="title font-size-15 font-weight-medium">
                                                                        Breakfast
                                                                    </h3>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-4 responsive-column">
                                                            <div
                                                                className="single-tour-feature d-flex align-items-center mb-3"
                                                            >
                                                                <div
                                                                    className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                                >
                                                                    <i className="la la-car"></i>
                                                                </div>
                                                                <div className="single-feature-titles">
                                                                    <h3 className="title font-size-15 font-weight-medium">
                                                                        Free Parking
                                                                    </h3>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-4 responsive-column">
                                                            <div
                                                                className="single-tour-feature d-flex align-items-center mb-3"
                                                            >
                                                                <div
                                                                    className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                                >
                                                                    <i className="la la-fire"></i>
                                                                </div>
                                                                <div className="single-feature-titles">
                                                                    <h3 className="title font-size-15 font-weight-medium">
                                                                        Fire Place
                                                                    </h3>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-4 responsive-column">
                                                            <div
                                                                className="single-tour-feature d-flex align-items-center mb-3"
                                                            >
                                                                <div
                                                                    className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                                >
                                                                    <i className="la la-wheelchair"></i>
                                                                </div>
                                                                <div className="single-feature-titles">
                                                                    <h3 className="title font-size-15 font-weight-medium">
                                                                        Handicap Accessible
                                                                    </h3>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-4 responsive-column">
                                                            <div
                                                                className="single-tour-feature d-flex align-items-center mb-3"
                                                            >
                                                                <div
                                                                    className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                                >
                                                                    <i className="la la-user-secret"></i>
                                                                </div>
                                                                <div className="single-feature-titles">
                                                                    <h3 className="title font-size-15 font-weight-medium">
                                                                        Doorman
                                                                    </h3>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-4 responsive-column">
                                                            <div
                                                                className="single-tour-feature d-flex align-items-center mb-3"
                                                            >
                                                                <div
                                                                    className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                                >
                                                                    <i className="la la-building"></i>
                                                                </div>
                                                                <div className="single-feature-titles">
                                                                    <h3 className="title font-size-15 font-weight-medium">
                                                                        Elevator In Building
                                                                    </h3>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-4 responsive-column">
                                                            <div
                                                                className="single-tour-feature d-flex align-items-center mb-3"
                                                            >
                                                                <div
                                                                    className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                                >
                                                                    <i className="la la-gift"></i>
                                                                </div>
                                                                <div className="single-feature-titles">
                                                                    <h3 className="title font-size-15 font-weight-medium">
                                                                        Suitable For Events
                                                                    </h3>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-4 responsive-column">
                                                            <div
                                                                className="single-tour-feature d-flex align-items-center mb-3"
                                                            >
                                                                <div
                                                                    className="single-feature-icon icon-element ml-0 flex-shrink-0 mr-3"
                                                                >
                                                                    <i className="la la-gamepad"></i>
                                                                </div>
                                                                <div className="single-feature-titles">
                                                                    <h3 className="title font-size-15 font-weight-medium">
                                                                        Play Place
                                                                    </h3>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div className="section-block"></div>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-4">
                                    <div className="sidebar single-content-sidebar mb-0">
                                        <div className="sidebar-widget single-content-widget">
                                            <div className="sidebar-widget-item">
                                                <div className="sidebar-book-title-wrap mb-3">
                                                    <h3>Popular</h3>
                                                    <p>
                        <span className="text-form">From</span
                        ><span className="text-value ml-2 mr-1">৳ 133399.00</span>
                                                        <span className="before-price">৳ 144412.00</span>
                                                    </p>
                                                </div>
                                            </div>
                                            <div className="sidebar-widget-item">
                                                <div className="contact-form-action">
                                                    <form action="#">
                                                        <div className="input-box">
                                                            <label className="label-text">Check in - Check out</label>
                                                            <div className="form-group">
                                                                <span className="la la-calendar form-icon"></span>
                                                                <input
                                                                    className="date-range form-control"
                                                                    type="text"
                                                                    name="daterange"
                                                                    readOnly
                                                                />
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                            <div className="sidebar-widget-item">
                                                <div
                                                    className="qty-box mb-2 d-flex align-items-center justify-content-between"
                                                >
                                                    <label className="font-size-16"
                                                    >Adults <span>Age 18+</span></label
                                                    >
                                                    <div className="qtyBtn d-flex align-items-center">
                                                        <div className="qtyDec"><i className="la la-minus"></i></div>
                                                        <input type="text" name="qtyInput" value="0"/>
                                                        <div className="qtyInc"><i className="la la-plus"></i></div>
                                                    </div>
                                                </div>
                                                <div
                                                    className="qty-box mb-2 d-flex align-items-center justify-content-between"
                                                >
                                                    <label className="font-size-16"
                                                    >Children <span>2-12 years old</span></label
                                                    >
                                                    <div className="qtyBtn d-flex align-items-center">
                                                        <div className="qtyDec"><i className="la la-minus"></i></div>
                                                        <input type="text" name="qtyInput" value="0"/>
                                                        <div className="qtyInc"><i className="la la-plus"></i></div>
                                                    </div>
                                                </div>
                                                <div
                                                    className="qty-box mb-2 d-flex align-items-center justify-content-between"
                                                >
                                                    <label className="font-size-16"
                                                    >Infants <span>0-2 years old</span></label
                                                    >
                                                    <div className="qtyBtn d-flex align-items-center">
                                                        <div className="qtyDec"><i className="la la-minus"></i></div>
                                                        <input type="text" name="qtyInput" value="0"/>
                                                        <div className="qtyInc"><i className="la la-plus"></i></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div className="btn-box pt-2">
                                                <a
                                                    href="hotel-booking.html"
                                                    className="theme-btn text-center w-100 mb-2"
                                                ><i className="la la-shopping-cart mr-2 font-size-18"></i>Book
                                                    Now</a
                                                >
                                                <a
                                                    href="#"
                                                    className="theme-btn text-center w-100 theme-btn-transparent"
                                                ><i className="la la-heart-o mr-2"></i>Add to Wishlist</a
                                                >
                                                <div
                                                    className="d-flex align-items-center justify-content-between pt-2"
                                                >
                                                    <a
                                                        href="#"
                                                        className="btn theme-btn-hover-gray font-size-15"
                                                        data-toggle="modal"
                                                        data-target="#sharePopupForm"
                                                    ><i className="la la-share mr-1"></i>Share</a
                                                    >
                                                    <p>
                                                        <i className="la la-eye mr-1 font-size-15 color-text-2"></i
                                                        >3456
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div className="sidebar-widget single-content-widget">
                                            <h3 className="title stroke-shape">Enquiry Form</h3>
                                            <div className="enquiry-forum">
                                                <div className="form-box">
                                                    <div className="form-content">
                                                        <div className="contact-form-action">
                                                            <form method="post">
                                                                <div className="input-box">
                                                                    <label className="label-text">Your Name</label>
                                                                    <div className="form-group">
                                                                        <span className="la la-user form-icon"></span>
                                                                        <input
                                                                            className="form-control"
                                                                            type="text"
                                                                            name="text"
                                                                            placeholder="Your name"
                                                                        />
                                                                    </div>
                                                                </div>
                                                                <div className="input-box">
                                                                    <label className="label-text">Your Email</label>
                                                                    <div className="form-group">
                                                                        <span
                                                                            className="la la-envelope-o form-icon"></span>
                                                                        <input
                                                                            className="form-control"
                                                                            type="email"
                                                                            name="email"
                                                                            placeholder="Email address"
                                                                        />
                                                                    </div>
                                                                </div>
                                                                <div className="input-box">
                                                                    <label className="label-text">Message</label>
                                                                    <div className="form-group">
                                                                        <span className="la la-pencil form-icon"></span>
                                                                        <textarea
                                                                            className="message-control form-control"
                                                                            name="message"
                                                                            placeholder="Write message"
                                                                        ></textarea>
                                                                    </div>
                                                                </div>
                                                                <div className="input-box">
                                                                    <div className="form-group">
                                                                        <div className="custom-checkbox mb-0">
                                                                            <input type="checkbox" id="agreeChb"/>
                                                                            <label htmlFor="agreeChb"
                                                                            >I agree with
                                                                                <a href="#">Terms of Service</a> and
                                                                                <a href="#">Privacy Statement</a></label
                                                                            >
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div className="btn-box">
                                                                    <button type="button" className="theme-btn">
                                                                        Submit Enquiry
                                                                    </button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div className="sidebar-widget single-content-widget">
                                            <h3 className="title stroke-shape">Why Book With Us?</h3>
                                            <div className="sidebar-list">
                                                <ul className="list-items">
                                                    <li>
                                                        <i className="la la-dollar icon-element mr-2"></i>No-hassle
                                                        best price guarantee
                                                    </li>
                                                    <li>
                                                        <i className="la la-microphone icon-element mr-2"></i
                                                        >Customer care available 24/7
                                                    </li>
                                                    <li>
                                                        <i className="la la-thumbs-up icon-element mr-2"></i
                                                        >Hand-picked Tours & Activities
                                                    </li>
                                                    <li>
                                                        <i className="la la-file-text icon-element mr-2"></i>Free
                                                        Travel Insureance
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div className="sidebar-widget single-content-widget">
                                            <h3 className="title stroke-shape">Get a Question?</h3>
                                            <p className="font-size-14 line-height-24">
                                                Do not hesitate to give us a call. We are an expert team and
                                                we are happy to talk to you.
                                            </p>
                                            <div className="sidebar-list pt-3">
                                                <ul className="list-items">
                                                    <li>
                                                        <i className="la la-phone icon-element mr-2"></i
                                                        ><a href="#">+ 61 23 8093 3400</a>
                                                    </li>
                                                    <li>
                                                        <i className="la la-envelope icon-element mr-2"></i
                                                        ><a href="mailto:info@trizen.com">info@trizen.com</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div className="sidebar-widget single-content-widget">
                                            <h3 className="title stroke-shape">Organized by</h3>
                                            <div className="author-content">
                                                <div className="d-flex">
                                                    <div className="author-img">
                                                        <a href="#"
                                                        ><img src="images/team8.jpg" alt="testimonial image"
                                                        /></a>
                                                    </div>
                                                    <div className="author-bio">
                                                        <h4 className="author__title">
                                                            <a href="#">royaltravelagency</a>
                                                        </h4>
                                                        <span className="author__meta">Member Since 2017</span>
                                                        <span className="ratings d-flex align-items-center">
                          <i className="la la-star"></i>
                          <i className="la la-star"></i>
                          <i className="la la-star"></i>
                          <i className="la la-star"></i>
                          <i className="la la-star-o"></i>
                          <span className="ml-2">305 Reviews</span>
                        </span>
                                                        <div className="btn-box pt-3">
                                                            <a
                                                                href="#"
                                                                className="theme-btn theme-btn-small theme-btn-transparent"
                                                            >Ask a Question</a
                                                            >
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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

const withRouter = (Component) => {
    const Wrapper = (props) => {
        let location = useLocation();
        let navigate = useNavigate();
        let params = useParams();

        return (
            <Component
                location={location}
                navigate={navigate}
                params={params}
                {...props}
            />
        );
    };

    return Wrapper;
};

export default withRouter(VenueDetails);