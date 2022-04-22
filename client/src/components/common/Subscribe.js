import React, {Component} from 'react';

class Subscribe extends Component {
    render() {
        return (
            <>
                <section
                    className="cta-area subscriber-area section-bg-2 padding-top-60px padding-bottom-60px"
                >
                    <div className="container">
                        <div className="row align-items-center">
                            <div className="col-lg-7">
                                <div className="section-heading">
                                    <p className="sec__desc text-white-50 pb-1">Newsletter Sign up</p>
                                    <h2 className="sec__title font-size-30 text-white">
                                        Subscribe to Get Special Offers
                                    </h2>
                                </div>
                            </div>
                            <div className="col-lg-5">
                                <div className="subscriber-box">
                                    <div className="contact-form-action">
                                        <form action="#">
                                            <div className="input-box">
                                                <label className="label-text text-white"
                                                >Enter email address</label
                                                >
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
                                                        Subscribe
                                                    </button>
                                                    <span className="font-size-14 pt-1 text-white-50"
                                                    ><i className="la la-lock mr-1"></i>Don't worry your
                        information is safe with us.</span
                                                    >
                                                </div>
                                            </div>
                                        </form>
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

export default Subscribe;