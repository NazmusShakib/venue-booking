import React, {Component} from 'react';
import Subscribe from "../components/partials/Subscribe";
import InfoSection from "../components/partials/InfoSection";

class Hotels extends Component {
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
                                            <h2 className="sec__title text-white">Hotel List</h2>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-6">
                                    <div className="breadcrumb-list text-right">
                                        <ul className="list-items">
                                            <li><a href="index.html">Home</a></li>
                                            <li>Hotels</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div className="bread-svg-box">
                        <svg
                            className="bread-svg"
                            xmlns="http://www.w3.org/2000/svg"
                            viewBox="0 0 100 10"
                            preserveAspectRatio="none"
                        >
                            <polygon points="100 0 50 10 0 0 0 10 100 10"></polygon>
                        </svg>
                    </div>
                </section>

                <section className="card-area section--padding">
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12">
                                <div className="filter-wrap margin-bottom-30px">
                                    <div
                                        className="filter-top d-flex align-items-center justify-content-between pb-4"
                                    >
                                        <div>
                                            <h3 className="title font-size-24">2224 Hotels found</h3>
                                            <p className="font-size-14">
                                                <span className="mr-1 pt-1">Book with confidence:</span>No hotel
                                                booking fees
                                            </p>
                                        </div>
                                    </div>
                                    <div
                                        className="filter-bar d-flex align-items-center justify-content-between"
                                    >
                                        <div
                                            className="filter-bar-filter d-flex flex-wrap align-items-center"
                                        >
                                            <div className="filter-option">
                                                <h3 className="title font-size-16">Filter by:</h3>
                                            </div>
                                            <div className="filter-option">
                                                <div className="dropdown dropdown-contain">
                                                    <a
                                                        className="dropdown-toggle dropdown-btn dropdown--btn"
                                                        href="#"
                                                        role="button"
                                                        data-toggle="dropdown"
                                                    >
                                                        Filter Price
                                                    </a>
                                                    <div className="dropdown-menu dropdown-menu-wrap">
                                                        <div className="dropdown-item">
                                                            <div className="slider-range-wrap">
                                                                <div
                                                                    className="price-slider-amount padding-bottom-20px"
                                                                >
                                                                    <label htmlFor="amount" className="filter__label"
                                                                    >Price:</label
                                                                    >
                                                                    <input type="text" id="amount" className="amounts"/>
                                                                </div>
                                                                <div id="slider-range"></div>
                                                            </div>
                                                            <div className="btn-box pt-4">
                                                                <button
                                                                    className="theme-btn theme-btn-small theme-btn-transparent"
                                                                    type="button"
                                                                >
                                                                    Apply
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div className="filter-option">
                                                <div className="dropdown dropdown-contain">
                                                    <a
                                                        className="dropdown-toggle dropdown-btn dropdown--btn"
                                                        href="#"
                                                        role="button"
                                                        data-toggle="dropdown"
                                                    >
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
                                  <span className="color-text-3 font-size-13 ml-1"
                                  >(55.590)</span
                                  >
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
                                  <span className="color-text-3 font-size-13 ml-1"
                                  >(40.590)</span
                                  >
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
                                  <span className="color-text-3 font-size-13 ml-1"
                                  >(23.590)</span
                                  >
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
                                  <span className="color-text-3 font-size-13 ml-1"
                                  >(12.590)</span
                                  >
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
                                  <span className="color-text-3 font-size-13 ml-1"
                                  >(590)</span
                                  >
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
                                                    <a
                                                        className="dropdown-toggle dropdown-btn dropdown--btn"
                                                        href="#"
                                                        role="button"
                                                        data-toggle="dropdown"
                                                    >
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
                                                                    <label htmlFor="catChb4">Access for disabled</label>
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
                                                <option defaultValue="1">Short by default</option>
                                                <option defaultValue="2">Popular Hotel</option>
                                                <option defaultValue="3">Price: low to high</option>
                                                <option defaultValue="4">Price: high to low</option>
                                                <option defaultValue="5">A to Z</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-lg-4">
                                <div className="sidebar mt-0">
                                    <div className="sidebar-widget">
                                        <h3 className="title stroke-shape">Search Hotels</h3>
                                        <div className="sidebar-widget-item">
                                            <div className="contact-form-action">
                                                <form action="#">
                                                    <div className="input-box">
                                                        <label className="label-text"
                                                        >Destination / hotel name</label
                                                        >
                                                        <div className="form-group">
                                                            <span className="la la-map-marker form-icon"></span>
                                                            <input
                                                                className="form-control"
                                                                type="text"
                                                                name="text"
                                                                placeholder="Destination, hotel name"
                                                            />
                                                        </div>
                                                    </div>
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
                                                <label className="font-size-16">Rooms</label>
                                                <div className="roomBtn d-flex align-items-center">
                                                    <div className="roomDec"><i className="la la-minus"></i></div>
                                                    <input type="text" name="roomInput" defaultValue="0"/>
                                                    <div className="roomInc"><i className="la la-plus"></i></div>
                                                </div>
                                            </div>
                                            <div
                                                className="qty-box mb-2 d-flex align-items-center justify-content-between"
                                            >
                                                <label className="font-size-16">Adults <span>18+</span></label>
                                                <div className="qtyBtn d-flex align-items-center">
                                                    <div className="qtyDec"><i className="la la-minus"></i></div>
                                                    <input type="text" name="qtyInput" defaultValue="0"/>
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
                                                    <input type="text" name="qtyInput" defaultValue="0"/>
                                                    <div className="qtyInc"><i className="la la-plus"></i></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div className="btn-box pt-2">
                                            <a href="hotel-search-result.html" className="theme-btn"
                                            >Search Now</a
                                            >
                                        </div>
                                    </div>
                                    <div className="sidebar-widget">
                                        <h3 className="title stroke-shape">Filter by Price</h3>
                                        <div className="sidebar-price-range">
                                            <div className="main-search-input-item">
                                                <div className="price-slider-amount padding-bottom-20px">
                                                    <label htmlFor="amount2" className="filter__label">Price:</label>
                                                    <input type="text" id="amount2" className="amounts"/>
                                                </div>
                                                <div id="slider-range2"></div>
                                            </div>
                                            <div className="btn-box pt-4">
                                                <button
                                                    className="theme-btn theme-btn-small theme-btn-transparent"
                                                    type="button"
                                                >
                                                    Apply
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="sidebar-widget">
                                        <h3 className="title stroke-shape">Review Score</h3>
                                        <div className="sidebar-category">
                                            <div className="custom-checkbox">
                                                <input type="checkbox" id="r6"/>
                                                <label htmlFor="r6">Excellent</label>
                                            </div>
                                            <div className="custom-checkbox">
                                                <input type="checkbox" id="r7"/>
                                                <label htmlFor="r7">Very Good</label>
                                            </div>
                                            <div className="custom-checkbox">
                                                <input type="checkbox" id="r8"/>
                                                <label htmlFor="r8">Average</label>
                                            </div>
                                            <div className="custom-checkbox">
                                                <input type="checkbox" id="r9"/>
                                                <label htmlFor="r9">Poor</label>
                                            </div>
                                            <div className="custom-checkbox">
                                                <input type="checkbox" id="r10"/>
                                                <label htmlFor="r10">Terrible</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="sidebar-widget">
                                        <h3 className="title stroke-shape">Filter by Rating</h3>
                                        <div className="sidebar-review">
                                            <div className="custom-checkbox">
                                                <input type="checkbox" id="s1"/>
                                                <label htmlFor="s1">
                      <span className="ratings d-flex align-items-center">
                        <i className="la la-star"></i>
                        <i className="la la-star"></i>
                        <i className="la la-star"></i>
                        <i className="la la-star"></i>
                        <i className="la la-star"></i>
                        <span className="color-text-3 font-size-13 ml-1"
                        >(55.590)</span
                        >
                      </span>
                                                </label>
                                            </div>
                                            <div className="custom-checkbox">
                                                <input type="checkbox" id="s2"/>
                                                <label htmlFor="s2">
                      <span className="ratings d-flex align-items-center">
                        <i className="la la-star"></i>
                        <i className="la la-star"></i>
                        <i className="la la-star"></i>
                        <i className="la la-star"></i>
                        <i className="la la-star-o"></i>
                        <span className="color-text-3 font-size-13 ml-1"
                        >(40.590)</span
                        >
                      </span>
                                                </label>
                                            </div>
                                            <div className="custom-checkbox">
                                                <input type="checkbox" id="s3"/>
                                                <label htmlFor="s3">
                      <span className="ratings d-flex align-items-center">
                        <i className="la la-star"></i>
                        <i className="la la-star"></i>
                        <i className="la la-star"></i>
                        <i className="la la-star-o"></i>
                        <i className="la la-star-o"></i>
                        <span className="color-text-3 font-size-13 ml-1"
                        >(23.590)</span
                        >
                      </span>
                                                </label>
                                            </div>
                                            <div className="custom-checkbox">
                                                <input type="checkbox" id="s4"/>
                                                <label htmlFor="s4">
                      <span className="ratings d-flex align-items-center">
                        <i className="la la-star"></i>
                        <i className="la la-star"></i>
                        <i className="la la-star-o"></i>
                        <i className="la la-star-o"></i>
                        <i className="la la-star-o"></i>
                        <span className="color-text-3 font-size-13 ml-1"
                        >(12.590)</span
                        >
                      </span>
                                                </label>
                                            </div>
                                            <div className="custom-checkbox mb-0">
                                                <input type="checkbox" id="s5"/>
                                                <label htmlFor="s5">
                      <span className="ratings d-flex align-items-center">
                        <i className="la la-star"></i>
                        <i className="la la-star-o"></i>
                        <i className="la la-star-o"></i>
                        <i className="la la-star-o"></i>
                        <i className="la la-star-o"></i>
                        <span className="color-text-3 font-size-13 ml-1"
                        >(590)</span
                        >
                      </span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="sidebar-widget">
                                        <h3 className="title stroke-shape">Facilities</h3>
                                        <div className="sidebar-category">
                                            <div className="custom-checkbox">
                                                <input type="checkbox" id="f1"/>
                                                <label htmlFor="f1">Air Conditioning</label>
                                            </div>
                                            <div className="custom-checkbox">
                                                <input type="checkbox" id="chb12"/>
                                                <label htmlFor="chb12">Airport Transport</label>
                                            </div>
                                            <div className="custom-checkbox">
                                                <input type="checkbox" id="f2"/>
                                                <label htmlFor="f2">Fitness Center</label>
                                            </div>
                                            <div className="custom-checkbox">
                                                <input type="checkbox" id="f3"/>
                                                <label htmlFor="f3">Flat Tv</label>
                                            </div>
                                            <div className="custom-checkbox">
                                                <input type="checkbox" id="f4"/>
                                                <label htmlFor="f4">Heater</label>
                                            </div>
                                            <div className="custom-checkbox">
                                                <input type="checkbox" id="f5"/>
                                                <label htmlFor="f5">Internet – Wifi</label>
                                            </div>
                                            <div className="collapse" id="facilitiesMenu">
                                                <div className="custom-checkbox">
                                                    <input type="checkbox" id="f6"/>
                                                    <label htmlFor="f6">Parking</label>
                                                </div>
                                                <div className="custom-checkbox">
                                                    <input type="checkbox" id="f7"/>
                                                    <label htmlFor="f7">Pool</label>
                                                </div>
                                                <div className="custom-checkbox">
                                                    <input type="checkbox" id="f8"/>
                                                    <label htmlFor="f8">Restaurant</label>
                                                </div>
                                                <div className="custom-checkbox">
                                                    <input type="checkbox" id="f9"/>
                                                    <label htmlFor="f9">Smoking Room</label>
                                                </div>
                                                <div className="custom-checkbox">
                                                    <input type="checkbox" id="f10"/>
                                                    <label htmlFor="f10">Spa &amp; Sauna</label>
                                                </div>
                                                <div className="custom-checkbox">
                                                    <input type="checkbox" id="f11"/>
                                                    <label htmlFor="f11">Washer &amp; Dryer</label>
                                                </div>
                                            </div>
                                            <a
                                                className="btn-text"
                                                data-toggle="collapse"
                                                href="#facilitiesMenu"
                                                role="button"
                                                aria-expanded="false"
                                                aria-controls="facilitiesMenu"
                                            >
                    <span className="show-more"
                    >Show More <i className="la la-angle-down"></i
                    ></span>
                                                <span className="show-less"
                                                >Show Less <i className="la la-angle-up"></i
                                                ></span>
                                            </a>
                                        </div>
                                    </div>
                                    <div className="sidebar-widget">
                                        <h3 className="title stroke-shape">Hotel Theme</h3>
                                        <div className="sidebar-category">
                                            <div className="custom-checkbox">
                                                <input type="checkbox" id="ht1"/>
                                                <label htmlFor="ht1">Best value</label>
                                            </div>
                                            <div className="custom-checkbox">
                                                <input type="checkbox" id="ht2"/>
                                                <label htmlFor="ht2">Boutique</label>
                                            </div>
                                            <div className="custom-checkbox">
                                                <input type="checkbox" id="ht3"/>
                                                <label htmlFor="ht3">Budget</label>
                                            </div>
                                            <div className="custom-checkbox">
                                                <input type="checkbox" id="ht4"/>
                                                <label htmlFor="ht4">Business</label>
                                            </div>
                                            <div className="custom-checkbox">
                                                <input type="checkbox" id="ht5"/>
                                                <label htmlFor="ht5">Charming</label>
                                            </div>
                                            <div className="custom-checkbox">
                                                <input type="checkbox" id="ht6"/>
                                                <label htmlFor="ht6">Classic</label>
                                            </div>
                                            <div className="collapse" id="hotelThemeMenu">
                                                <div className="custom-checkbox">
                                                    <input type="checkbox" id="ht7"/>
                                                    <label htmlFor="ht7">Green</label>
                                                </div>
                                                <div className="custom-checkbox">
                                                    <input type="checkbox" id="ht8"/>
                                                    <label htmlFor="ht8">Luxury</label>
                                                </div>
                                                <div className="custom-checkbox">
                                                    <input type="checkbox" id="ht9"/>
                                                    <label htmlFor="ht9">Mid-range</label>
                                                </div>
                                                <div className="custom-checkbox">
                                                    <input type="checkbox" id="ht10"/>
                                                    <label htmlFor="ht10">Party</label>
                                                </div>
                                                <div className="custom-checkbox">
                                                    <input type="checkbox" id="ht11"/>
                                                    <label htmlFor="ht11">Quaint</label>
                                                </div>
                                                <div className="custom-checkbox">
                                                    <input type="checkbox" id="ht12"/>
                                                    <label htmlFor="ht12">Quite</label>
                                                </div>
                                                <div className="custom-checkbox">
                                                    <input type="checkbox" id="ht14"/>
                                                    <label htmlFor="ht14">Romantic</label>
                                                </div>
                                                <div className="custom-checkbox">
                                                    <input type="checkbox" id="ht15"/>
                                                    <label htmlFor="ht15">Standard</label>
                                                </div>
                                                <div className="custom-checkbox">
                                                    <input type="checkbox" id="ht16"/>
                                                    <label htmlFor="ht16">Trendy</label>
                                                </div>
                                            </div>
                                            <a
                                                className="btn-text"
                                                data-toggle="collapse"
                                                href="#hotelThemeMenu"
                                                role="button"
                                                aria-expanded="false"
                                                aria-controls="hotelThemeMenu"
                                            >
                    <span className="show-more"
                    >Show More <i className="la la-angle-down"></i
                    ></span>
                                                <span className="show-less"
                                                >Show Less <i className="la la-angle-up"></i
                                                ></span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="col-lg-8">
                                <div className="card-item card-item-list">
                                    <div className="card-img">
                                        <a href="hotel-single.html" className="d-block">
                                            <img src="assets/images/img1.jpg" alt="hotel-img"/>
                                        </a>
                                        <span className="badge">Bestseller</span>
                                        <div
                                            className="add-to-wishlist icon-element"
                                            data-toggle="tooltip"
                                            data-placement="top"
                                            title="Bookmark"
                                        >
                                            <i className="la la-heart-o"></i>
                                        </div>
                                    </div>
                                    <div className="card-body">
                                        <h3 className="card-title">
                                            <a href="hotel-single.html">The Millennium Hilton New York</a>
                                        </h3>
                                        <p className="card-meta">124 E Huron St, New york</p>
                                        <div className="card-rating">
                                            <span className="badge text-white">4.4/5</span>
                                            <span className="review__text">Average</span>
                                            <span className="rating__text">(30 Reviews)</span>
                                        </div>
                                        <div
                                            className="card-price d-flex align-items-center justify-content-between"
                                        >
                                            <p>
                                                <span className="price__from">From</span>
                                                <span className="price__num">$88.00</span>
                                                <span className="price__text">Per night</span>
                                            </p>
                                            <a href="hotel-single.html" className="btn-text"
                                            >See details<i className="la la-angle-right"></i
                                            ></a>
                                        </div>
                                    </div>
                                </div>
                                <div className="card-item card-item-list">
                                    <div className="card-img">
                                        <a href="hotel-single.html" className="d-block">
                                            <img src="assets/images/img2.jpg" alt="hotel-img"/>
                                        </a>
                                        <div
                                            className="add-to-wishlist icon-element"
                                            data-toggle="tooltip"
                                            data-placement="top"
                                            title="Bookmark"
                                        >
                                            <i className="la la-heart-o"></i>
                                        </div>
                                    </div>
                                    <div className="card-body">
                                        <h3 className="card-title">
                                            <a href="hotel-single.html">Best Western Grant Park Hotel</a>
                                        </h3>
                                        <p className="card-meta">124 E Huron St, Chicago</p>
                                        <div className="card-rating">
                                            <span className="badge text-white">4.4/5</span>
                                            <span className="review__text">Average</span>
                                            <span className="rating__text">(30 Reviews)</span>
                                        </div>
                                        <div
                                            className="card-price d-flex align-items-center justify-content-between"
                                        >
                                            <p>
                                                <span className="price__from">From</span>
                                                <span className="price__num">$58.00</span>
                                                <span className="price__text">Per night</span>
                                            </p>
                                            <a href="hotel-single.html" className="btn-text"
                                            >See details<i className="la la-angle-right"></i
                                            ></a>
                                        </div>
                                    </div>
                                </div>
                                <div className="card-item card-item-list">
                                    <div className="card-img">
                                        <a href="hotel-single.html" className="d-block">
                                            <img src="assets/images/img3.jpg" alt="hotel-img"/>
                                        </a>
                                        <span className="badge">Featured</span>
                                        <div
                                            className="add-to-wishlist icon-element"
                                            data-toggle="tooltip"
                                            data-placement="top"
                                            title="Bookmark"
                                        >
                                            <i className="la la-heart-o"></i>
                                        </div>
                                    </div>
                                    <div className="card-body">
                                        <h3 className="card-title">
                                            <a href="hotel-single.html"
                                            >Hyatt Regency Maui Resort & Spa</a
                                            >
                                        </h3>
                                        <p className="card-meta">200 Nohea Kai Dr, Lahaina, HI</p>
                                        <div className="card-rating">
                                            <span className="badge text-white">4.4/5</span>
                                            <span className="review__text">Average</span>
                                            <span className="rating__text">(30 Reviews)</span>
                                        </div>
                                        <div
                                            className="card-price d-flex align-items-center justify-content-between"
                                        >
                                            <p>
                                                <span className="price__from">From</span>
                                                <span className="price__num">$88.00</span>
                                                <span className="price__text">Per night</span>
                                            </p>
                                            <a href="hotel-single.html" className="btn-text"
                                            >See details<i className="la la-angle-right"></i
                                            ></a>
                                        </div>
                                    </div>
                                </div>
                                <div className="card-item card-item-list">
                                    <div className="card-img">
                                        <a href="hotel-single.html" className="d-block">
                                            <img src="assets/images/img4.jpg" alt="hotel-img"/>
                                        </a>
                                        <span className="badge">Popular</span>
                                        <div
                                            className="add-to-wishlist icon-element"
                                            data-toggle="tooltip"
                                            data-placement="top"
                                            title="Bookmark"
                                        >
                                            <i className="la la-heart-o"></i>
                                        </div>
                                    </div>
                                    <div className="card-body">
                                        <h3 className="card-title">
                                            <a href="hotel-single.html"
                                            >Four Seasons Resort Maui at Wailea</a
                                            >
                                        </h3>
                                        <p className="card-meta">3900 Wailea Alanui Drive, Kihei, HI</p>
                                        <div className="card-rating">
                                            <span className="badge text-white">4.4/5</span>
                                            <span className="review__text">Average</span>
                                            <span className="rating__text">(30 Reviews)</span>
                                        </div>
                                        <div
                                            className="card-price d-flex align-items-center justify-content-between"
                                        >
                                            <p>
                                                <span className="price__from">From</span>
                                                <span className="price__num">$88.00</span>
                                                <span className="price__text">Per night</span>
                                            </p>
                                            <a href="hotel-single.html" className="btn-text"
                                            >See details<i className="la la-angle-right"></i
                                            ></a>
                                        </div>
                                    </div>
                                </div>
                                <div className="card-item card-item-list">
                                    <div className="card-img">
                                        <a href="hotel-single.html" className="d-block">
                                            <img src="assets/images/img5.jpg" alt="hotel-img"/>
                                        </a>
                                        <div
                                            className="add-to-wishlist icon-element"
                                            data-toggle="tooltip"
                                            data-placement="top"
                                            title="Bookmark"
                                        >
                                            <i className="la la-heart-o"></i>
                                        </div>
                                    </div>
                                    <div className="card-body">
                                        <h3 className="card-title">
                                            <a href="hotel-single.html">Ibis Styles London Heathrow</a>
                                        </h3>
                                        <p className="card-meta">272 Bath Road, Harlington, England</p>
                                        <div className="card-rating">
                                            <span className="badge text-white">4.4/5</span>
                                            <span className="review__text">Average</span>
                                            <span className="rating__text">(30 Reviews)</span>
                                        </div>
                                        <div
                                            className="card-price d-flex align-items-center justify-content-between"
                                        >
                                            <p>
                                                <span className="price__from">From</span>
                                                <span className="price__num">$88.00</span>
                                                <span className="price__text">Per night</span>
                                            </p>
                                            <a href="hotel-single.html" className="btn-text"
                                            >See details<i className="la la-angle-right"></i
                                            ></a>
                                        </div>
                                    </div>
                                </div>
                                <div className="card-item card-item-list">
                                    <div className="card-img">
                                        <a href="hotel-single.html" className="d-block">
                                            <img src="assets/images/img6.jpg" alt="hotel-img"/>
                                        </a>
                                        <div
                                            className="add-to-wishlist icon-element"
                                            data-toggle="tooltip"
                                            data-placement="top"
                                            title="Bookmark"
                                        >
                                            <i className="la la-heart-o"></i>
                                        </div>
                                    </div>
                                    <div className="card-body">
                                        <h3 className="card-title">
                                            <a href="hotel-single.html"
                                            >Hotel Europe Saint Severin Paris</a
                                            >
                                        </h3>
                                        <p className="card-meta">38-40 Rue Saint Séverin, Paris, Paris</p>
                                        <div className="card-rating">
                                            <span className="badge text-white">4.4/5</span>
                                            <span className="review__text">Average</span>
                                            <span className="rating__text">(30 Reviews)</span>
                                        </div>
                                        <div
                                            className="card-price d-flex align-items-center justify-content-between"
                                        >
                                            <p>
                                                <span className="price__from">From</span>
                                                <span className="price__num">$88.00</span>
                                                <span className="price__text">Per night</span>
                                            </p>
                                            <a href="hotel-single.html" className="btn-text"
                                            >See details<i className="la la-angle-right"></i
                                            ></a>
                                        </div>
                                    </div>
                                </div>
                                <div className="card-item card-item-list">
                                    <div className="card-img">
                                        <a href="hotel-single.html" className="d-block">
                                            <img src="assets/images/img5.jpg" alt="hotel-img"/>
                                        </a>
                                        <div
                                            className="add-to-wishlist icon-element"
                                            data-toggle="tooltip"
                                            data-placement="top"
                                            title="Bookmark"
                                        >
                                            <i className="la la-heart-o"></i>
                                        </div>
                                    </div>
                                    <div className="card-body">
                                        <h3 className="card-title">
                                            <a href="hotel-single.html">Grand Desert Resort</a>
                                        </h3>
                                        <p className="card-meta">Delaware, USA</p>
                                        <div className="card-rating">
                                            <span className="badge text-white">4.4/5</span>
                                            <span className="review__text">Average</span>
                                            <span className="rating__text">(30 Reviews)</span>
                                        </div>
                                        <div
                                            className="card-price d-flex align-items-center justify-content-between"
                                        >
                                            <p>
                                                <span className="price__from">From</span>
                                                <span className="price__num">$88.00</span>
                                                <span className="price__text">Per night</span>
                                            </p>
                                            <a href="hotel-single.html" className="btn-text"
                                            >See details<i className="la la-angle-right"></i
                                            ></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-lg-12">
                                <div className="btn-box mt-3 text-center">
                                    <button type="button" className="theme-btn">
                                        <i className="la la-refresh mr-1"></i>Load More
                                    </button>
                                    <p className="font-size-13 pt-2">Showing 1 - 6 of 2224 Hotels</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <div className="section-block"></div>

                <InfoSection/>

                <Subscribe/>
            </>
        );
    }
}

export default Hotels;