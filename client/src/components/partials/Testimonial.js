import React, {Component} from 'react';
import OwlCarousel from 'react-owl-carousel';
import SessionHelper from "../../session/SessionHelper";
import axios from "axios";
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
    constructor() {
        super();
        this.state={
            testmonials:[]
        }
    }

    componentDidMount() {
        let testmonials = SessionHelper.GetTestmonialsSession();
        if(testmonials === null)
        {
            axios.get('/sanctum/csrf-cookie').then(response => {
                axios.get('/api/testmonials').then(res => {
                    this.setState({testmonials: res.data.data});
                    SessionHelper.SetTestmonialsSession(res.data.data);
                }).catch((error) => {});
            });
        }else{
            this.setState({testmonials: testmonials});
        }

    }

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
                            { this.state.testmonials.length < 1 &&
                                <div className="col-sm-12 loaderPlaceholder">
                                <div className="row">
                                    <div className="col-lg-6 responsive-column">
                                        <div className="ph-item">
                                            <div className="ph-col-12">
                                                <div className="ph-picture"></div>
                                                <div className="ph-row">
                                                    <div className="ph-col-6 big"></div>
                                                    <div className="ph-col-4 empty big"></div>
                                                    <div className="ph-col-2 big"></div>
                                                    <div className="ph-col-4"></div>
                                                    <div className="ph-col-8 empty"></div>
                                                    <div className="ph-col-6"></div>
                                                    <div className="ph-col-6 empty"></div>
                                                    <div className="ph-col-12"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="col-lg-6 responsive-column">
                                        <div className="ph-item">
                                            <div className="ph-col-12">
                                                <div className="ph-picture"></div>
                                                <div className="ph-row">
                                                    <div className="ph-col-6 big"></div>
                                                    <div className="ph-col-4 empty big"></div>
                                                    <div className="ph-col-2 big"></div>
                                                    <div className="ph-col-4"></div>
                                                    <div className="ph-col-8 empty"></div>
                                                    <div className="ph-col-6"></div>
                                                    <div className="ph-col-6 empty"></div>
                                                    <div className="ph-col-12"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            }
                            <div className="col-lg-12">
                                {this.state.testmonials.length > 0 &&
                                    <OwlCarousel className='carousel-action' {...options}>
                                        {
                                            this.state.testmonials.map((testmonial, index) => (
                                                <React.Fragment key={index}>
                                                    <div className="testimonial-card">
                                                        <div className="testi-desc-box">
                                                            <p className="testi__desc">{testmonial.body}</p>
                                                        </div>
                                                        <div className="author-content d-flex align-items-center">
                                                            <div className="author-img">
                                                                <img src={testmonial.thumbnail} alt="testimonial"/>
                                                            </div>
                                                            <div className="author-bio">
                                                                <h4 className="author__title">{testmonial.name}</h4>
                                                                <span className="author__meta">{testmonial.country_name}</span>
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
                                                </React.Fragment>
                                            ))
                                        }
                                    </OwlCarousel>
                                }
                            </div>
                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default Testimonial;