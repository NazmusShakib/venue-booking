import React, {Component} from 'react';
import {Link} from "react-router-dom";

class IntroduceBanner extends Component {
    render() {
        return (
            <>
                <section
                    className="cta-area padding-top-100px padding-bottom-180px text-center"
                >
                    <div className="video-bg">
                        <video autoPlay loop muted controlsList="nodownload">
                            <source src="assets/video/video-bg.mp4" type="video/mp4"/>
                            Your browser does not support the video tag.
                        </video>
                    </div>
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12">
                                <div className="section-heading">
                                    <h2 className="sec__title text-white line-height-55">
                                        Let us show you the world <br/>
                                        Discover our most popular destinations
                                    </h2>
                                </div>
                                <div className="btn-box padding-top-35px">
                                    <Link className="theme-btn border-0" to='/register'>
                                        Join with us
                                    </Link>
                                </div>
                            </div>
                        </div>
                    </div>
                    <svg className="cta-svg" viewBox="0 0 500 150" preserveAspectRatio="none">
                        <path
                            d="M-31.31,170.22 C164.50,33.05 334.36,-32.06 547.11,196.88 L500.00,150.00 L0.00,150.00 Z"
                        ></path>
                    </svg>
                </section>
            </>
        );
    }
}

export default IntroduceBanner;