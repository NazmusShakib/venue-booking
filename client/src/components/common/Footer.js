import React, {Component} from 'react';

class Footer extends Component {
    render() {
        return (
            <>
                <section
                    className="footer-area section-bg padding-top-100px padding-bottom-30px"
                >
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-3 responsive-column">
                                <div className="footer-item">
                                    <div className="footer-logo padding-bottom-30px">
                                        <a href="index.html" className="foot__logo"
                                        ><img style={{'maxWidth': '130px'}} src="assets/images/logo.png" alt="logo"
                                        /></a>
                                    </div>
                                    <p className="footer__desc">
                                        Morbi convallis bibendum urna ut viverra. Maecenas consequat
                                    </p>
                                    <ul className="list-items pt-3">
                                        <li>
                                            3015 Grand Ave, Coconut Grove,<br/>
                                            Cerrick Way, FL 12345
                                        </li>
                                        <li>+123-456-789</li>
                                        <li><a href="#">trizen@yourwebsite.com</a></li>
                                    </ul>
                                    <div className="footer-social-box">
                                        <ul className="social-profile">
                                            <li>
                                                <a href="#"><i className="lab la-facebook-f"></i></a>
                                            </li>
                                            <li>
                                                <a href="#"><i className="lab la-twitter"></i></a>
                                            </li>
                                            <li>
                                                <a href="#"><i className="lab la-instagram"></i></a>
                                            </li>
                                            <li>
                                                <a href="#"><i className="lab la-linkedin-in"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div className="col-lg-3 responsive-column">
                                <div className="footer-item">
                                    <h4
                                        className="title curve-shape pb-3 margin-bottom-20px"
                                        data-text="curvs"
                                    >
                                        Company
                                    </h4>
                                    <ul className="list-items list--items">
                                        <li><a href="about.html">About us</a></li>
                                        <li><a href="services.html">Services</a></li>
                                        <li><a href="blog-sidebar.html">News</a></li>
                                        <li><a href="contact.html">Support</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div className="col-lg-3 responsive-column">
                                <div className="footer-item">
                                    <h4
                                        className="title curve-shape pb-3 margin-bottom-20px"
                                        data-text="curvs"
                                    >
                                        Other Links
                                    </h4>
                                    <ul className="list-items list--items">
                                        <li><a href="#">Terms & Conditions</a></li>
                                        <li><a href="#">Privacy Policy</a></li>
                                        <li><a href="faq.html">Faq</a></li>
                                        <li><a href="contact.html">Help Center</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div className="col-lg-3 responsive-column">
                                <div className="footer-item">
                                    <h4
                                        className="title curve-shape pb-3 margin-bottom-20px"
                                        data-text="curvs"
                                    >
                                        Subscribe now
                                    </h4>
                                    <p className="footer__desc pb-3">
                                        Subscribe for latest updates & promotions
                                    </p>
                                    <div className="contact-form-action">
                                        <form action="#">
                                            <div className="input-box">
                                                <label className="label-text">Enter email address</label>
                                                <div className="form-group mb-0">
                                                    <span className="la la-envelope form-icon"></span>
                                                    <input
                                                        className="form-control"
                                                        type="email"
                                                        name="email"
                                                        placeholder="Email address"
                                                    />
                                                    <button
                                                        className="theme-btn theme-btn-small submit-btn"
                                                        type="submit"
                                                    >
                                                        Go
                                                    </button>
                                                    <span className="font-size-14 pt-1"
                                                    ><i className="la la-lock mr-1"></i>Your information is safe with us.</span
                                                    >
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div className="section-block mt-4"></div>
                    <div className="container">
                        <div className="row align-items-center">
                            <div className="col-lg-7">
                                <div className="copy-right padding-top-30px">
                                    <p className="copy__desc">
                                        &copy; Copyright Trizen 2020. Made with
                                        <span className="la la-heart"></span> by
                                        <a target="_blank" href="https://creativewebsolution.net"
                                        >Creative Web Solution</a
                                        >
                                    </p>
                                </div>
                            </div>
                            <div className="col-lg-5">
                                <div
                                    className="copy-right-content d-flex align-items-center justify-content-end padding-top-30px"
                                >
                                    <h3 className="title font-size-15 pr-2">We Accept</h3>
                                    <img src="assets/images/payment-img.png" alt=""/>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default Footer;