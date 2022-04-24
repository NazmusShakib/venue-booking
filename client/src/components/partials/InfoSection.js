import React, {Component} from 'react';

class InfoSection extends Component {
    render() {
        return (
            <>
                <section className="info-area info-bg padding-top-90px padding-bottom-70px">
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-4 responsive-column">
                                <a href="#" className="icon-box icon-layout-2 d-flex">
                                    <div className="info-icon flex-shrink-0 bg-rgb text-color-2">
                                        <i className="la la-phone"></i>
                                    </div>
                                    <div className="info-content">
                                        <h4 className="info__title">Need Help? Contact us</h4>
                                        <p className="info__desc">
                                            Lorem ipsum dolor sit amet, consectetur adipisicing
                                        </p>
                                    </div>
                                </a>
                            </div>
                            <div className="col-lg-4 responsive-column">
                                <a href="#" className="icon-box icon-layout-2 d-flex">
                                    <div className="info-icon flex-shrink-0 bg-rgb-2 text-color-3">
                                        <i className="la la-money"></i>
                                    </div>
                                    <div className="info-content">
                                        <h4 className="info__title">Payments</h4>
                                        <p className="info__desc">
                                            Lorem ipsum dolor sit amet, consectetur adipisicing
                                        </p>
                                    </div>
                                </a>
                            </div>
                            <div className="col-lg-4 responsive-column">
                                <a href="#" className="icon-box icon-layout-2 d-flex">
                                    <div className="info-icon flex-shrink-0 bg-rgb-3 text-color-4">
                                        <i className="la la-times"></i>
                                    </div>
                                    <div className="info-content">
                                        <h4 className="info__title">Cancel Policy</h4>
                                        <p className="info__desc">
                                            Lorem ipsum dolor sit amet, consectetur adipisicing
                                        </p>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default InfoSection;