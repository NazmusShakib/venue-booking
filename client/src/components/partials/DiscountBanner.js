import React, {Component} from 'react';
import {Link} from "react-router-dom";

class DiscountBanner extends Component {
    render() {
        return (
            <>
                <section className="discount-area">
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12">
                                <div className="discount-box">
                                    <div className="discount-img">
                                        <img src="assets/images/discount-hotel-img.jpg" alt="discount img"/>
                                    </div>
                                    <div className="discount-content">
                                        <div className="section-heading">
                                            <p className="sec__desc text-white">Hot deal, save 50%</p>
                                            <h2 className="sec__title mb-0 line-height-50 text-white">
                                                Discount 50% for the <br/>
                                                First Booking
                                            </h2>
                                        </div>
                                        <div className="btn-box pt-4">
                                            <Link className="theme-btn border-0" to='/terms-and-conditions'>
                                                Learn More <i className="la la-arrow-right ml-1"></i>
                                            </Link>
                                        </div>
                                    </div>
                                    <div className="company-logo">
                                        <img src="assets/images/logo2.png" alt=""/>
                                        <p className="text-white font-size-14 text-right">*Terms applied</p>
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

export default DiscountBanner;