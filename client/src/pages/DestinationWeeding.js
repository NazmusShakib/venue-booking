import React, {Component} from 'react';
import {Link} from "react-router-dom";
import InfoSection from "../components/partials/InfoSection";
import Subscribe from "../components/partials/Subscribe";

class DestinationWeeding extends Component {
    componentDidMount() {
        window.scrollTo(0, 0);
    }

    render() {
        return (
            <>
                <section className="breadcrumb-area bread-bg-7">
                    <div className="breadcrumb-wrap">
                        <div className="container">
                            <div className="row align-items-center">
                                <div className="col-lg-6">
                                    <div className="breadcrumb-content">
                                        <div className="section-heading">
                                            <h2 className="sec__title text-white">Destination Weeding</h2>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-6">
                                    <div className="breadcrumb-list text-right">
                                        <ul className="list-items">
                                            <li><Link to="/">Home</Link></li>
                                            <li>Destination Weeding</li>
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

export default DestinationWeeding;