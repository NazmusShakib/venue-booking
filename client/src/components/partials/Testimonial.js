import React, {Component} from 'react';
import OwlCarousel from 'react-owl-carousel';
const options = {
    loop: true,
    items: 2,
    nav: true,
    dots: false,
    smartSpeed: 700,
    autoplay: true,
    margin: 30,
    navText: ['<i class="la la-angle-left"></i>', '<i class="la la-angle-right"></i>'],
    navElement:'div',
    responsive: { 0: { items: 1 }, 900: { items: 2 } },
};

class Testimonial extends Component {
    render() {
        return (
            <>
                <section className="testimonial-area padding-top-45px padding-bottom-100px">
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12">
                                <div className="section-heading text-center mb-0">
                                    <h2 className="sec__title line-height-50">
                                        What Our Customers <br/>
                                        are Saying Us?
                                    </h2>
                                </div>
                            </div>
                        </div>
                        <div className="row padding-top-50px">
                            <div className="col-lg-12">
                                <OwlCarousel className='carousel-action' {...options}>
                                        <div className="testimonial-card">
                                            <div className="testi-desc-box">
                                                <p className="testi__desc">
                                                    Excepteur sint occaecat cupidatat non proident sunt in culpa
                                                    officia deserunt mollit anim laborum sint occaecat cupidatat
                                                    non proident. Occaecat cupidatat non proident des.
                                                </p>
                                            </div>
                                            <div className="author-content d-flex align-items-center">
                                                <div className="author-img">
                                                    <img src="assets/images/team8.jpg" alt="testimonial"/>
                                                </div>
                                                <div className="author-bio">
                                                    <h4 className="author__title">Leroy Bell</h4>
                                                    <span className="author__meta">United States</span>
                                                    <span className="ratings d-flex align-items-center">
                          <i className="la la-star"></i>
                          <i className="la la-star"></i>
                          <i className="la la-star"></i>
                          <i className="la la-star"></i>
                          <i className="la la-star"></i>
                        </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div className="testimonial-card">
                                            <div className="testi-desc-box">
                                                <p className="testi__desc">
                                                    Excepteur sint occaecat cupidatat non proident sunt in culpa
                                                    officia deserunt mollit anim laborum sint occaecat cupidatat
                                                    non proident. Occaecat cupidatat non proident des.
                                                </p>
                                            </div>
                                            <div className="author-content d-flex align-items-center">
                                                <div className="author-img">
                                                    <img src="assets/images/team9.jpg" alt="testimonial"/>
                                                </div>
                                                <div className="author-bio">
                                                    <h4 className="author__title">Richard Pam</h4>
                                                    <span className="author__meta">Canada</span>
                                                    <span className="ratings d-flex align-items-center">
                          <i className="la la-star"></i>
                          <i className="la la-star"></i>
                          <i className="la la-star"></i>
                          <i className="la la-star"></i>
                          <i className="la la-star"></i>
                        </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div className="testimonial-card">
                                            <div className="testi-desc-box">
                                                <p className="testi__desc">
                                                    Excepteur sint occaecat cupidatat non proident sunt in culpa
                                                    officia deserunt mollit anim laborum sint occaecat cupidatat
                                                    non proident. Occaecat cupidatat non proident des.
                                                </p>
                                            </div>
                                            <div className="author-content d-flex align-items-center">
                                                <div className="author-img">
                                                    <img src="assets/images/team10.jpg" alt="testimonial"/>
                                                </div>
                                                <div className="author-bio">
                                                    <h4 className="author__title">Luke Jacobs</h4>
                                                    <span className="author__meta">Australia</span>
                                                    <span className="ratings d-flex align-items-center">
                          <i className="la la-star"></i>
                          <i className="la la-star"></i>
                          <i className="la la-star"></i>
                          <i className="la la-star"></i>
                          <i className="la la-star"></i>
                        </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div className="testimonial-card">
                                            <div className="testi-desc-box">
                                                <p className="testi__desc">
                                                    Excepteur sint occaecat cupidatat non proident sunt in culpa
                                                    officia deserunt mollit anim laborum sint occaecat cupidatat
                                                    non proident. Occaecat cupidatat non proident des.
                                                </p>
                                            </div>
                                            <div className="author-content d-flex align-items-center">
                                                <div className="author-img">
                                                    <img src="assets/images/team8.jpg" alt="testimonial"/>
                                                </div>
                                                <div className="author-bio">
                                                    <h4 className="author__title">Chulbul Panday</h4>
                                                    <span className="author__meta">Italy</span>
                                                    <span className="ratings d-flex align-items-center">
                          <i className="la la-star"></i>
                          <i className="la la-star"></i>
                          <i className="la la-star"></i>
                          <i className="la la-star"></i>
                          <i className="la la-star"></i>
                        </span>
                                                </div>
                                            </div>
                                        </div>
                                    </OwlCarousel>
                            </div>
                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default Testimonial;