import React, {Component} from 'react';
import {Link} from "react-router-dom";

class TermsAndConditions extends Component {
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
                                            <h2 className="sec__title text-white">Terms & Conditions</h2>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-6">
                                    <div className="breadcrumb-list text-right">
                                        <ul className="list-items">
                                            <li><Link to="/">Home</Link></li>
                                            <li>Terms & Conditions</li>
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
                                    <h2 className="sec__title">Terms & Conditions</h2>
                                </div>
                            </div>
                        </div>
                        <div className="row padding-top-60px">
                            <div className="col-lg-12">
                                <h2 className="title font-size-24">Limitations Of Liability</h2>
                                <p className="py-3">
                                    Evolo also automatically collects and receives certain information from your computer or mobile device, including the activities you perform on our Website, the Platforms,and the Applications, the type of hardware and software you are using (for example, your operating system or browser), and information obtained from cookies. For example, each time you visit the Website or otherwise use the Services, we automatically collect your IP address, browser and device type, access times, the web page from which you came, the regions from which you navigate the web page, and the web page(s) you access (as applicable).
                                </p>

                                <p className="py-3 title">When you first register for a Evolo account, and when you use the Services, we collect some Personal Information about you such as:</p>

                                <ul className="list--items">
                                    <li>The geographic area where you use your computer and mobile devices</li>
                                    <li>Your full name, username, and email address and other contact details</li>
                                    <li>A unique Evolo user ID (an alphanumeric string) which is assigned to you upon registration</li>
                                    <li>Other optional information as part of your account profile</li>
                                    <li>Your IP Address and, when applicable, timestamp related to your consent and confirmation of consent</li>
                                    <li>Other information submitted by you or your organizational representatives via various methods</li>
                                </ul>

                                <h2 className="title font-size-24 pt-3">Terms And Conditions</h2>
                                <p className="py-3">Under no circumstances shall Evolo be liable for any direct, indirect, special, incidental or consequential damages, including, but not limited to, loss of data or profit, arising out of the use, or the inability to use, the materials on this site, even if Evolo or an authorized representative has been advised of the possibility of such damages. If your use of materials from this site results in the need for servicing, repair or correction of equipment or data, you assume any costs thereof.</p>

                                <h2 className="title font-size-24">License Types & Template Usage</h2>
                                <p className="py-3">All our templates inherit the GNU general public license from HTML. All .PSD & CSS files are packaged separately and are not licensed under the GPL 2.0. Instead, these files inherit Evolo Personal Use License. These files are given to all Clients on a personal use basis. You may not offer them, modified or unmodified, for redistribution or resale of any kind. You can’t use one of our themes on a HTML domain. More on HTML Vs CSS, you can read here. You can use our templates do develop sites for your clients.</p>

                                <p className="py-3">Services help our customers promote their products and services, marketing and advertising; engaging audiences; scheduling and publishing messages; and analyze the results.</p>

                                <h2 className="title font-size-24">Designer Membership And How It Applies</h2>
                                <p className="py-3">By using any of the Services, or submitting or collecting any Personal Information via the Services, you consent to the collection, transfer, storage disclosure, and use of your Personal Information in the manner set out in this Privacy Policy. If you do not consent to the use of your Personal Information in these ways, please stop using the Services.</p>

                                <h2 className="title font-size-24">Assets Used In The Live Preview Content</h2>
                                <p className="py-3">Evolo Landing Page uses tracking technology on the landing page, in the Applications, and in the Platforms, including mobile application identifiers and a unique Hootsuite user ID to help us recognize you across different Services, to monitor usage and web traffic routing for the Services, and to customize and improve the Services. By visiting Evolo or using the Services you agree to the use of cookies in your browser and HTML-based emails. Cookies are small text files placed on your device when you visit a web site in order to track use of the site and to improve your user experience.</p>
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

export default TermsAndConditions;