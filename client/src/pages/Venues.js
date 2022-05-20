import React, {Component} from 'react';
import Select2 from "../hooks/Select2";
import JqueryUi from "../hooks/JqueryUi";
import InfoSection from "../components/partials/InfoSection";
import Subscribe from "../components/partials/Subscribe";
import {Link} from "react-router-dom";

class Venues extends Component {
    render() {
        return (
            <>
                <Select2/>
                <JqueryUi/>
                <section className="breadcrumb-area bread-bg-7">
                    <div className="breadcrumb-wrap">
                        <div className="container">
                            <div className="row align-items-center">
                                <div className="col-lg-6">
                                    <div className="breadcrumb-content">
                                        <div className="section-heading">
                                            <h2 className="sec__title text-white">Venues</h2>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-6">
                                    <div className="breadcrumb-list text-right">
                                        <ul className="list-items">
                                            <li><Link to="/">Home</Link></li>
                                            <li>Venues</li>
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


                <section className="card-area section--padding">
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12">
                                <div className="filter-wrap margin-bottom-30px">
                                    <div className="filter-top d-flex align-items-center justify-content-between pb-4">
                                        <div>
                                            <h3 className="title font-size-24">2224 Venues found</h3>
                                            <p className="font-size-14"><span className="mr-1 pt-1">Book with confidence:</span>No
                                                venue booking fees</p>
                                        </div>
                                    </div>
                                    <div className="filter-bar d-flex align-items-center justify-content-between">
                                        <div className="filter-bar-filter d-flex flex-wrap align-items-center">
                                            <div className="filter-option">
                                                <h3 className="title font-size-16">Filter by:</h3>
                                            </div>
                                            <div className="filter-option">
                                                <div className="dropdown dropdown-contain">
                                                    <a className="dropdown-toggle dropdown-btn dropdown--btn" href="#"
                                                       role="button" data-toggle="dropdown">
                                                        Filter Price
                                                    </a>
                                                    <div className="dropdown-menu dropdown-menu-wrap">
                                                        <div className="dropdown-item">
                                                            <div className="slider-range-wrap">
                                                                <div
                                                                    className="price-slider-amount padding-bottom-20px">
                                                                    <label htmlFor="amount"
                                                                           className="filter__label">Price:</label>
                                                                    <input type="text" id="amount" className="amounts"/>
                                                                </div>
                                                                <div id="slider-range"></div>
                                                            </div>
                                                            <div className="btn-box pt-4">
                                                                <button
                                                                    className="theme-btn theme-btn-small theme-btn-transparent"
                                                                    type="button">Apply
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div className="filter-option">
                                                <div className="dropdown dropdown-contain">
                                                    <a className="dropdown-toggle dropdown-btn dropdown--btn" href="#"
                                                       role="button" data-toggle="dropdown">
                                                        Review Score
                                                    </a>
                                                    <div className="dropdown-menu dropdown-menu-wrap">
                                                        <div className="dropdown-item">
                                                            <div className="checkbox-wrap">
                                                                <div className="custom-checkbox">
                                                                    <input type="checkbox" id="r1"/>
                                                                    <label htmlFor="r1">
                                                        <span className="ratings d-flex align-items-center">
                                                            <i className="la la-star"></i>
                                                            <i className="la la-star"></i>
                                                            <i className="la la-star"></i>
                                                            <i className="la la-star"></i>
                                                            <i className="la la-star"></i>
                                                            <span
                                                                className="color-text-3 font-size-13 ml-1">(55.590)</span>
                                                        </span>
                                                                    </label>
                                                                </div>
                                                                <div className="custom-checkbox">
                                                                    <input type="checkbox" id="r2"/>
                                                                    <label htmlFor="r2">
                                                        <span className="ratings d-flex align-items-center">
                                                            <i className="la la-star"></i>
                                                            <i className="la la-star"></i>
                                                            <i className="la la-star"></i>
                                                            <i className="la la-star"></i>
                                                            <i className="la la-star-o"></i>
                                                            <span
                                                                className="color-text-3 font-size-13 ml-1">(40.590)</span>
                                                        </span>
                                                                    </label>
                                                                </div>
                                                                <div className="custom-checkbox">
                                                                    <input type="checkbox" id="r3"/>
                                                                    <label htmlFor="r3">
                                                        <span className="ratings d-flex align-items-center">
                                                            <i className="la la-star"></i>
                                                            <i className="la la-star"></i>
                                                            <i className="la la-star"></i>
                                                            <i className="la la-star-o"></i>
                                                            <i className="la la-star-o"></i>
                                                            <span
                                                                className="color-text-3 font-size-13 ml-1">(23.590)</span>
                                                        </span>
                                                                    </label>
                                                                </div>
                                                                <div className="custom-checkbox">
                                                                    <input type="checkbox" id="r4"/>
                                                                    <label htmlFor="r4">
                                                        <span className="ratings d-flex align-items-center">
                                                            <i className="la la-star"></i>
                                                            <i className="la la-star"></i>
                                                            <i className="la la-star-o"></i>
                                                            <i className="la la-star-o"></i>
                                                            <i className="la la-star-o"></i>
                                                            <span
                                                                className="color-text-3 font-size-13 ml-1">(12.590)</span>
                                                        </span>
                                                                    </label>
                                                                </div>
                                                                <div className="custom-checkbox">
                                                                    <input type="checkbox" id="r5"/>
                                                                    <label htmlFor="r5">
                                                        <span className="ratings d-flex align-items-center">
                                                            <i className="la la-star"></i>
                                                            <i className="la la-star-o"></i>
                                                            <i className="la la-star-o"></i>
                                                            <i className="la la-star-o"></i>
                                                            <i className="la la-star-o"></i>
                                                            <span
                                                                className="color-text-3 font-size-13 ml-1">(590)</span>
                                                        </span>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div className="filter-option">
                                                <div className="dropdown dropdown-contain">
                                                    <a className="dropdown-toggle dropdown-btn dropdown--btn" href="#"
                                                       role="button" data-toggle="dropdown">
                                                        Facilities
                                                    </a>
                                                    <div className="dropdown-menu dropdown-menu-wrap">
                                                        <div className="dropdown-item">
                                                            <div className="checkbox-wrap">
                                                                <div className="custom-checkbox">
                                                                    <input type="checkbox" id="catChb1"/>
                                                                    <label htmlFor="catChb1">Pet Allowed</label>
                                                                </div>
                                                                <div className="custom-checkbox">
                                                                    <input type="checkbox" id="catChb2"/>
                                                                    <label htmlFor="catChb2">Groups Allowed</label>
                                                                </div>
                                                                <div className="custom-checkbox">
                                                                    <input type="checkbox" id="catChb3"/>
                                                                    <label htmlFor="catChb3">Tour Guides</label>
                                                                </div>
                                                                <div className="custom-checkbox">
                                                                    <input type="checkbox" id="catChb4"/>
                                                                    <label htmlFor="catChb4">Access for
                                                                        disabled</label>
                                                                </div>
                                                                <div className="custom-checkbox">
                                                                    <input type="checkbox" id="catChb5"/>
                                                                    <label htmlFor="catChb5">Room Service</label>
                                                                </div>
                                                                <div className="custom-checkbox">
                                                                    <input type="checkbox" id="catChb6"/>
                                                                    <label htmlFor="catChb6">Parking</label>
                                                                </div>
                                                                <div className="custom-checkbox">
                                                                    <input type="checkbox" id="catChb7"/>
                                                                    <label htmlFor="catChb7">Restaurant</label>
                                                                </div>
                                                                <div className="custom-checkbox">
                                                                    <input type="checkbox" id="catChb8"/>
                                                                    <label htmlFor="catChb8">Pet friendly</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div className="select-contain">
                                            <select className="select-contain-select">
                                                <option value="1">Short by default</option>
                                                <option value="2">Popular Hotels</option>
                                                <option value="3">Price: low to high</option>
                                                <option value="4">Price: high to low</option>
                                                <option value="5">A to Z</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div className="row">
                            <div className="col-lg-4 responsive-column">
                                <div className="card-item">
                                    <div className="card-img">
                                        <a href="hotel-single.html" className="d-block">
                                            <img src="assets/images/img1.jpg" alt="hotel-img"/>
                                        </a>
                                        <span className="badge">Bestseller</span>
                                        <div className="add-to-wishlist icon-element" data-toggle="tooltip"
                                             data-placement="top" title="Bookmark">
                                            <i className="la la-heart-o"></i>
                                        </div>
                                    </div>
                                    <div className="card-body">
                                        <h3 className="card-title"><a href="hotel-single.html">The Millennium Hilton New
                                            York</a></h3>
                                        <p className="card-meta">124 E Huron St, New york</p>
                                        <div className="card-rating">
                                            <span className="badge text-white">4.4/5</span>
                                            <span className="review__text">Average</span>
                                            <span className="rating__text">(30 Reviews)</span>
                                        </div>
                                        <div className="card-price d-flex align-items-center justify-content-between">
                                            <p>
                                                <span className="price__from">From</span>
                                                <span className="price__num">$88.00</span>
                                                <span className="price__text">Per night</span>
                                            </p>
                                            <a href="hotel-single.html" className="btn-text">See details<i
                                                className="la la-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="col-lg-4 responsive-column">
                                <div className="card-item">
                                    <div className="card-img">
                                        <a href="hotel-single.html" className="d-block">
                                            <img src="assets/images/img2.jpg" alt="hotel-img"/>
                                        </a>
                                        <div className="add-to-wishlist icon-element" data-toggle="tooltip"
                                             data-placement="top" title="Bookmark">
                                            <i className="la la-heart-o"></i>
                                        </div>
                                    </div>
                                    <div className="card-body">
                                        <h3 className="card-title"><a href="hotel-single.html">Best Western Grant Park
                                            Hotels</a></h3>
                                        <p className="card-meta">124 E Huron St, Chicago</p>
                                        <div className="card-rating">
                                            <span className="badge text-white">4.4/5</span>
                                            <span className="review__text">Average</span>
                                            <span className="rating__text">(30 Reviews)</span>
                                        </div>
                                        <div className="card-price d-flex align-items-center justify-content-between">
                                            <p>
                                                <span className="price__from">From</span>
                                                <span className="price__num">$58.00</span>
                                                <span className="price__text">Per night</span>
                                            </p>
                                            <a href="hotel-single.html" className="btn-text">See details<i
                                                className="la la-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="col-lg-4 responsive-column">
                                <div className="card-item">
                                    <div className="card-img">
                                        <a href="hotel-single.html" className="d-block">
                                            <img src="assets/images/img3.jpg" alt="hotel-img"/>
                                        </a>
                                        <span className="badge">Featured</span>
                                        <div className="add-to-wishlist icon-element" data-toggle="tooltip"
                                             data-placement="top" title="Bookmark">
                                            <i className="la la-heart-o"></i>
                                        </div>
                                    </div>
                                    <div className="card-body">
                                        <h3 className="card-title"><a href="hotel-single.html">Hyatt Regency Maui Resort
                                            & Spa</a></h3>
                                        <p className="card-meta">200 Nohea Kai Dr, Lahaina, HI</p>
                                        <div className="card-rating">
                                            <span className="badge text-white">4.4/5</span>
                                            <span className="review__text">Average</span>
                                            <span className="rating__text">(30 Reviews)</span>
                                        </div>
                                        <div className="card-price d-flex align-items-center justify-content-between">
                                            <p>
                                                <span className="price__from">From</span>
                                                <span className="price__num">$88.00</span>
                                                <span className="price__text">Per night</span>
                                            </p>
                                            <a href="hotel-single.html" className="btn-text">See details<i
                                                className="la la-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="col-lg-4 responsive-column">
                                <div className="card-item">
                                    <div className="card-img">
                                        <a href="hotel-single.html" className="d-block">
                                            <img src="assets/images/img4.jpg" alt="hotel-img"/>
                                        </a>
                                        <span className="badge">Popular</span>
                                        <div className="add-to-wishlist icon-element" data-toggle="tooltip"
                                             data-placement="top" title="Bookmark">
                                            <i className="la la-heart-o"></i>
                                        </div>
                                    </div>
                                    <div className="card-body">
                                        <h3 className="card-title"><a href="hotel-single.html">Four Seasons Resort Maui
                                            at Wailea</a></h3>
                                        <p className="card-meta">3900 Wailea Alanui Drive, Kihei, HI</p>
                                        <div className="card-rating">
                                            <span className="badge text-white">4.4/5</span>
                                            <span className="review__text">Average</span>
                                            <span className="rating__text">(30 Reviews)</span>
                                        </div>
                                        <div className="card-price d-flex align-items-center justify-content-between">
                                            <p>
                                                <span className="price__from">From</span>
                                                <span className="price__num">$88.00</span>
                                                <span className="price__text">Per night</span>
                                            </p>
                                            <a href="hotel-single.html" className="btn-text">See details<i
                                                className="la la-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="col-lg-4 responsive-column">
                                <div className="card-item">
                                    <div className="card-img">
                                        <a href="hotel-single.html" className="d-block">
                                            <img src="assets/images/img5.jpg" alt="hotel-img"/>
                                        </a>
                                        <div className="add-to-wishlist icon-element" data-toggle="tooltip"
                                             data-placement="top" title="Bookmark">
                                            <i className="la la-heart-o"></i>
                                        </div>
                                    </div>
                                    <div className="card-body">
                                        <h3 className="card-title"><a href="hotel-single.html">Ibis Styles London
                                            Heathrow</a></h3>
                                        <p className="card-meta"> 272 Bath Road, Harlington, England</p>
                                        <div className="card-rating">
                                            <span className="badge text-white">4.4/5</span>
                                            <span className="review__text">Average</span>
                                            <span className="rating__text">(30 Reviews)</span>
                                        </div>
                                        <div className="card-price d-flex align-items-center justify-content-between">
                                            <p>
                                                <span className="price__from">From</span>
                                                <span className="price__num">$88.00</span>
                                                <span className="price__text">Per night</span>
                                            </p>
                                            <a href="hotel-single.html" className="btn-text">See details<i
                                                className="la la-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="col-lg-4 responsive-column">
                                <div className="card-item">
                                    <div className="card-img">
                                        <a href="hotel-single.html" className="d-block">
                                            <img src="assets/images/img6.jpg" alt="hotel-img"/>
                                        </a>
                                        <div className="add-to-wishlist icon-element" data-toggle="tooltip"
                                             data-placement="top" title="Bookmark">
                                            <i className="la la-heart-o"></i>
                                        </div>
                                    </div>
                                    <div className="card-body">
                                        <h3 className="card-title"><a href="hotel-single.html">Hotels Europe Saint
                                            Severin Paris</a></h3>
                                        <p className="card-meta">38-40 Rue Saint Séverin, Paris, Paris</p>
                                        <div className="card-rating">
                                            <span className="badge text-white">4.4/5</span>
                                            <span className="review__text">Average</span>
                                            <span className="rating__text">(30 Reviews)</span>
                                        </div>
                                        <div className="card-price d-flex align-items-center justify-content-between">
                                            <p>
                                                <span className="price__from">From</span>
                                                <span className="price__num">$88.00</span>
                                                <span className="price__text">Per night</span>
                                            </p>
                                            <a href="hotel-single.html" className="btn-text">See details<i
                                                className="la la-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-lg-12">
                                <div className="btn-box mt-3 text-center">
                                    <button type="button" className="theme-btn"><i className="la la-refresh mr-1"></i>Load
                                        More
                                    </button>
                                    <p className="font-size-13 pt-2">Showing 1 - 6 of 2224 Hotels</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <InfoSection/>
                <Subscribe/>
            </>
        );
    }
}

export default Venues;