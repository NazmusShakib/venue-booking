import React, {Component} from 'react';
import Testimonial from "../components/partials/Testimonial";
import OurTeam from "../components/partials/OurTeam";

class AboutUs extends Component {
    componentDidMount() {
        window.scrollTo(0, 0);
    }

    render() {
        return (
            <>
                <section className="breadcrumb-area bread-bg-9">
                    <div className="breadcrumb-wrap">
                        <div className="container">
                            <div className="row">
                                <div className="col-lg-12">
                                    <div className="breadcrumb-content">
                                        <div className="section-heading">
                                            <h2 className="sec__title line-height-50 text-white">Trizen.com is Your Trusted <br/> Travel Companion.</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div className="bread-svg-box">
                        <svg className="bread-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 10" preserveAspectRatio="none"><polygon points="100 0 50 10 0 0 0 10 100 10"></polygon></svg>
                    </div>
                </section>

                <section className="info-area padding-top-100px padding-bottom-70px">
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-4 responsive-column">
                                <div className="card-item" data-toggle="tooltip" data-placement="top" title="hello word">
                                    <div className="card-img">
                                        <img src="assets/images/img21.jpg" alt="about-img"/>
                                    </div>
                                    <div className="card-body">
                                        <h3 className="card-title mb-2">Who We Are?</h3>
                                        <p className="card-text">
                                            Duis cursus lectus sed dui imperdiet, id pharetra nunc ullamcorper donec luctus.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div className="col-lg-4 responsive-column">
                                <div className="card-item ">
                                    <div className="card-img">
                                        <img src="assets/images/img22.jpg" alt="about-img"/>
                                    </div>
                                    <div className="card-body">
                                        <h3 className="card-title mb-2">What We Do?</h3>
                                        <p className="card-text">
                                            Duis cursus lectus sed dui imperdiet, id pharetra nunc ullamcorper donec luctus.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div className="col-lg-4 responsive-column">
                                <div className="card-item ">
                                    <div className="card-img">
                                        <img src="assets/images/img23.jpg" alt="about-img"/>
                                    </div>
                                    <div className="card-body">
                                        <h3 className="card-title mb-2">Our Mission</h3>
                                        <p className="card-text">
                                            Duis cursus lectus sed dui imperdiet, id pharetra nunc ullamcorper donec luctus.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section className="about-area padding-bottom-90px overflow-hidden">
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-6">
                                <div className="section-heading margin-bottom-40px">
                                    <h2 className="sec__title">About Us</h2>
                                    <h4 className="title font-size-16 line-height-26 pt-4 pb-2">Since 2002, TRIZEN has been revolutionising the travel industry. Metasearch for travel? No one was doing it. Until we did.</h4>
                                    <p className="sec__desc font-size-16 pb-3">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
                                    <p className="sec__desc font-size-16 pb-3">Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.</p>
                                    <p className="sec__desc font-size-16">Vivamus a mauris vel nunc tristique volutpat. Aenean eu faucibus enim. Aenean blandit arcu lectus, in cursus elit porttitor non. Curabitur risus eros, </p>
                                </div>
                            </div>
                            <div className="col-lg-5 ml-auto">
                                <div className="image-box about-img-box">
                                    <img src="assets/images/img24.jpg" alt="about-img" className="img__item img__item-1"/>
                                        <img src="assets/images/img25.jpg" alt="about-img" className="img__item img__item-2"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section className="funfact-area padding-bottom-70px">
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12">
                                <div className="section-heading text-center">
                                    <h2 className="sec__title">Our Numbers Say Everything</h2>
                                </div>
                            </div>
                        </div>
                        <div className="counter-box counter-box-2 margin-top-60px mb-0">
                            <div className="row">
                                <div className="col-lg-3 responsive-column">
                                    <div className="counter-item counter-item-layout-2 d-flex">
                                        <div className="counter-icon flex-shrink-0">
                                            <i className="la la-users"></i>
                                        </div>
                                        <div className="counter-content">
                                            <div>
                                                <span className="counter" data-from="0" data-to="200"  data-refresh-interval="5">0</span>
                                                <span className="count-symbol">+</span>
                                            </div>
                                            <p className="counter__title">Partners</p>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-3 responsive-column">
                                    <div className="counter-item counter-item-layout-2 d-flex">
                                        <div className="counter-icon flex-shrink-0">
                                            <i className="la la-building"></i>
                                        </div>
                                        <div className="counter-content">
                                            <div>
                                                <span className="counter" data-from="0" data-to="3"  data-refresh-interval="5">0</span>
                                                <span className="count-symbol">k</span>
                                            </div>
                                            <p className="counter__title">Properties</p>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-3 responsive-column">
                                    <div className="counter-item counter-item-layout-2 d-flex">
                                        <div className="counter-icon flex-shrink-0">
                                            <i className="la la-globe"></i>
                                        </div>
                                        <div className="counter-content">
                                            <div>
                                                <span className="counter" data-from="0" data-to="400"  data-refresh-interval="5">0</span>
                                                <span className="count-symbol">+</span>
                                            </div>
                                            <p className="counter__title">Destinations</p>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-3 responsive-column">
                                    <div className="counter-item counter-item-layout-2 d-flex">
                                        <div className="counter-icon flex-shrink-0">
                                            <i className="la la-check-circle"></i>
                                        </div>
                                        <div className="counter-content">
                                            <div>
                                                <span className="counter" data-from="0" data-to="40"  data-refresh-interval="5">0</span>
                                                <span className="count-symbol">k</span>
                                            </div>
                                            <p className="counter__title">Booking</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <Testimonial/>

                <OurTeam/>

                <section className="cta-area cta-bg-2 bg-fixed section-padding text-center">
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12">
                                <div className="section-heading">
                                    <h2 className="sec__title mb-3 text-white">Interested in a career <br/> at Trizen.</h2>
                                    <p className="sec__desc text-white">We’re always looking for talented individuals and
                                        <br/> people who are hungry to do great work.
                                    </p>
                                </div>
                                <div className="btn-box padding-top-35px">
                                    <a href="#" className="theme-btn border-0">Join Our Team</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default AboutUs;