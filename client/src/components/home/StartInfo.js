import React, {Component} from 'react';

class StartInfo extends Component {
    render() {
        return (
            <>
                <section
                    className="info-area info-bg info-area2 padding-top-80px padding-bottom-45px"
                >
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-3 responsive-column">
                                <div className="icon-box icon-layout-2 d-flex">
                                    <div className="info-icon flex-shrink-0 bg-rgb text-color-2">
                                        <i className="las la-radiation"></i>
                                    </div>
                                    <div className="info-content">
                                        <h4 className="info__title">Unique Atmosphere</h4>
                                        <p className="info__desc">Varius quam quisque id diam vel quam</p>
                                    </div>
                                </div>
                            </div>
                            <div className="col-lg-3 responsive-column">
                                <div className="icon-box icon-layout-2 d-flex">
                                    <div className="info-icon flex-shrink-0 bg-rgb-2 text-color-3">
                                        <i className="la la-tree"></i>
                                    </div>
                                    <div className="info-content">
                                        <h4 className="info__title">Environment</h4>
                                        <p className="info__desc">Varius quam quisque id diam vel quam</p>
                                    </div>
                                </div>
                            </div>
                            <div className="col-lg-3 responsive-column">
                                <div className="icon-box icon-layout-2 d-flex">
                                    <div className="info-icon flex-shrink-0 bg-rgb-3 text-color-4">
                                        <i className="las la-map-marked-alt"></i>
                                    </div>
                                    <div className="info-content">
                                        <h4 className="info__title">Great Location</h4>
                                        <p className="info__desc">Varius quam quisque id diam vel quam</p>
                                    </div>
                                </div>
                            </div>
                            <div className="col-lg-3 responsive-column">
                                <div className="icon-box icon-layout-2 d-flex">
                                    <div className="info-icon flex-shrink-0 bg-rgb-4 text-color-5">
                                        <i className="las la-bed"></i>
                                    </div>
                                    <div className="info-content">
                                        <h4 className="info__title">Homey Comfort</h4>
                                        <p className="info__desc">Varius quam quisque id diam vel quam</p>
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

export default StartInfo;