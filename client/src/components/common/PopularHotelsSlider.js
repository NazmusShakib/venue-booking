import React, {Component} from 'react';

class PopularHotelsSlider extends Component {
    render() {
        return (
            <>
                <div className="hotel-card-wrap">
                    <div className="hotel-card-carousel-2 carousel-action">
                        <div className="card-item">
                            <div className="card-img">
                                <a href="hotel-single.html" className="d-block">
                                    <img src="assets/images/img1.jpg" alt="hotel-img"/>
                                </a>
                                <span className="badge">Bestseller</span>
                                <span className="badge badge-ribbon">30% off</span>
                            </div>
                            <div className="card-body">
                                <h3 className="card-title">
                                    <a href="hotel-single.html"
                                    >The Millennium Hilton New York</a
                                    >
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
                                        <span className="price__num">$90.00</span>
                                        <span className="price__num before-price color-text-3"
                                        >$120.00</span
                                        >
                                        <span className="price__text">Per night</span>
                                    </p>
                                    <a href="hotel-single.html" className="btn-text"
                                    >See details<i className="la la-angle-right"></i
                                    ></a>
                                </div>
                            </div>
                        </div>
                        <div className="card-item">
                            <div className="card-img">
                                <a href="hotel-single.html" className="d-block">
                                    <img src="assets/images/img2.jpg" alt="hotel-img"/>
                                </a>
                            </div>
                            <div className="card-body">
                                <h3 className="card-title">
                                    <a href="hotel-single.html"
                                    >Best Western Grant Park Hotel</a
                                    >
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
                        <div className="card-item">
                            <div className="card-img">
                                <a href="hotel-single.html" className="d-block">
                                    <img src="assets/images/img3.jpg" alt="hotel-img"/>
                                </a>
                                <span className="badge">Featured</span>
                                <span className="badge badge-ribbon">20% off</span>
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
                                        <span className="price__num">$80.00</span>
                                        <span className="price__num before-price color-text-3"
                                        >$100.00</span
                                        >
                                        <span className="price__text">Per night</span>
                                    </p>
                                    <a href="hotel-single.html" className="btn-text"
                                    >See details<i className="la la-angle-right"></i
                                    ></a>
                                </div>
                            </div>
                        </div>
                        <div className="card-item">
                            <div className="card-img">
                                <a href="hotel-single.html" className="d-block">
                                    <img src="assets/images/img4.jpg" alt="hotel-img"/>
                                </a>
                                <span className="badge">Popular</span>
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
                        <div className="card-item">
                            <div className="card-img">
                                <a href="hotel-single.html" className="d-block">
                                    <img src="assets/images/img5.jpg" alt="hotel-img"/>
                                </a>
                            </div>
                            <div className="card-body">
                                <h3 className="card-title">
                                    <a href="hotel-single.html"
                                    >Ibis Styles London Heathrow</a
                                    >
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
                        <div className="card-item">
                            <div className="card-img">
                                <a href="hotel-single.html" className="d-block">
                                    <img src="assets/images/img6.jpg" alt="hotel-img"/>
                                </a>
                                <span className="badge badge-ribbon">10% off</span>
                            </div>
                            <div className="card-body">
                                <h3 className="card-title">
                                    <a href="hotel-single.html"
                                    >Hotel Europe Saint Severin Paris</a
                                    >
                                </h3>
                                <p className="card-meta">
                                    38-40 Rue Saint Séverin, Paris, Paris
                                </p>
                                <div className="card-rating">
                                    <span className="badge text-white">4.4/5</span>
                                    <span className="review__text">Average</span>
                                    <span className="rating__text">(30 Reviews)</span>
                                </div>
                                <div
                                    className="card-price d-flex align-items-center justify-content-between"
                                >
                                    <p>
                                        <span className="price__num">$70.00</span>
                                        <span className="price__num before-price color-text-3"
                                        >$80.00</span
                                        >
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
            </>
        );
    }
}

export default PopularHotelsSlider;