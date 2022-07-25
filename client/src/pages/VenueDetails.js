import React, {Component} from 'react';
import {Link, useLocation, useNavigate, useParams} from "react-router-dom";
import axios from "axios";
import OwlCarousel from 'react-owl-carousel';
import ReactHtmlParser, { processNodes, convertNodeToElement, htmlparser2 } from 'react-html-parser';
// import Daterange from "../hooks/Daterange";
import DateRangePicker from 'react-bootstrap-daterangepicker';
const options = {
    loop: true,
    items: 1,
    nav: true,
    dots: false,
    smartSpeed: 700,
    autoplay: true,
    margin: 0,
    navElement:'div',
    navText: ['<i class="la la-angle-left"></i>', '<i class="la la-angle-right"></i>'],
};

class VenueDetails extends Component {
    constructor() {
        super();
        this.state = {
            venue:[],
            images:[]
        }
    }

    componentDidMount() {
        window.scrollTo(0, 0);
        let slug = this.props.params.venue_slug;
        axios.get('/api/venue/details/'+slug,).then(res => {
            this.setState({venue:res.data.venue});
            this.setState({images:res.data.venue.images});
        }).catch((error)=>{});
    }

    render() {
        return (
            <>
                {/*<Daterange/>*/}
                <section className="hero-wrapper hero-wrapper2">
                    { this.state.images.length < 1 &&
                        <div className="loaderPlaceholder p-0">
                            <div className="ph-item p-0">
                                <div className="ph-picture m-0" style={{'minHeight':'512px'}}></div>
                            </div>
                        </div>
                    }

                    {this.state.images.length > 0 &&
                        <OwlCarousel className='carousel-action venue-details-carousel-action fullscreen-slide-contain' {...options}>
                            {
                                this.state.images.map((image, index) => (
                                    <React.Fragment key={index}>
                                        <img src={image} alt="" style={{'minHeight':'512px'}}/>
                                    </React.Fragment>
                                ))
                            }
                        </OwlCarousel>
                    }
                </section>
                <section className="tour-detail-area padding-bottom-90px">
                    <div className="single-content-box">
                        <div className="container">
                            <div className="row">
                                <div className="col-lg-8">
                                    <div className="single-content-wrap padding-top-60px">
                                        <div id="description" className="page-scroll">
                                            <div className="single-content-item padding-bottom-40px">
                                                <h1 className="title font-size-35 mb-3">
                                                    About {this.state.venue.name}
                                                </h1>
                                                {ReactHtmlParser(this.state.venue.description)}
                                            </div>
                                            <div className="section-block"></div>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-4">
                                    <div className="sidebar single-content-sidebar mb-0">
                                        <div className="sidebar-widget single-content-widget">
                                            <div className="sidebar-widget-item">
                                                <div className="sidebar-book-title-wrap mb-3">
                                                    <h3>Popular</h3>
                                                    <p>
                                                        <span className="text-form">From</span>
                                                        <span className="text-value ml-2 mr-1">৳ 133399.00</span>
                                                        <span className="before-price">৳ 144412.00</span>
                                                    </p>
                                                </div>
                                            </div>
                                            <div className="sidebar-widget-item">
                                                <div className="contact-form-action">
                                                    <form action="#">
                                                        <div className="input-box">
                                                            <label className="label-text">Check in - Check out</label>

                                                            <div className="form-group">
                                                                <span className="la la-calendar form-icon"></span>
                                                                <DateRangePicker>
                                                                    <input type="text" className="form-control" />
                                                                </DateRangePicker>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>

                                            <div className="btn-box pt-2">
                                                <a href="hotel-booking.html" className="theme-btn text-center w-100 mb-2">
                                                    <i className="la la-shopping-cart mr-2 font-size-18"></i>
                                                    Book Now
                                                </a>
                                            </div>
                                        </div>
                                        <div className="sidebar-widget single-content-widget">
                                            <h3 className="title stroke-shape">Enquiry Form</h3>
                                            <div className="enquiry-forum">
                                                <div className="form-box">
                                                    <div className="form-content">
                                                        <div className="contact-form-action">
                                                            <form method="post">
                                                                <div className="input-box">
                                                                    <label className="label-text">Your Name</label>
                                                                    <div className="form-group">
                                                                        <span className="la la-user form-icon"></span>
                                                                        <input
                                                                            className="form-control"
                                                                            type="text"
                                                                            name="text"
                                                                            placeholder="Your name"
                                                                        />
                                                                    </div>
                                                                </div>
                                                                <div className="input-box">
                                                                    <label className="label-text">Your Email</label>
                                                                    <div className="form-group">
                                                                        <span
                                                                            className="la la-envelope-o form-icon"></span>
                                                                        <input
                                                                            className="form-control"
                                                                            type="email"
                                                                            name="email"
                                                                            placeholder="Email address"
                                                                        />
                                                                    </div>
                                                                </div>
                                                                <div className="input-box">
                                                                    <label className="label-text">Message</label>
                                                                    <div className="form-group">
                                                                        <span className="la la-pencil form-icon"></span>
                                                                        <textarea
                                                                            className="message-control form-control"
                                                                            name="message"
                                                                            placeholder="Write message"
                                                                        ></textarea>
                                                                    </div>
                                                                </div>
                                                                <div className="input-box">
                                                                    <div className="form-group">
                                                                        <div className="custom-checkbox mb-0">
                                                                            <input type="checkbox" id="agreeChb"/>
                                                                            <label htmlFor="agreeChb">
                                                                                I agree with <Link to='/terms-and-conditions'>Terms & Conditions</Link> and <Link to='/privacy-policy'>Privacy Policy</Link>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div className="btn-box">
                                                                    <button type="button" className="theme-btn">
                                                                        Submit Enquiry
                                                                    </button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div className="sidebar-widget single-content-widget">
                                            <h3 className="title stroke-shape">Why Book With Us?</h3>
                                            <div className="sidebar-list">
                                                <ul className="list-items">
                                                    <li>
                                                        <i className="la la-dollar icon-element mr-2"></i>No-hassle
                                                        best price guarantee
                                                    </li>
                                                    <li>
                                                        <i className="la la-microphone icon-element mr-2"></i
                                                        >Customer care available 24/7
                                                    </li>
                                                    <li>
                                                        <i className="la la-thumbs-up icon-element mr-2"></i
                                                        >Hand-picked Tours & Activities
                                                    </li>
                                                    <li>
                                                        <i className="la la-file-text icon-element mr-2"></i>Free
                                                        Travel Insureance
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div className="sidebar-widget single-content-widget">
                                            <h3 className="title stroke-shape">Get a Question?</h3>
                                            <p className="font-size-14 line-height-24">
                                                Do not hesitate to give us a call. We are an expert team and
                                                we are happy to talk to you.
                                            </p>
                                            <div className="sidebar-list pt-3">
                                                <ul className="list-items">
                                                    <li>
                                                        <i className="la la-phone icon-element mr-2"></i
                                                        ><a href="#">+ 61 23 8093 3400</a>
                                                    </li>
                                                    <li>
                                                        <i className="la la-envelope icon-element mr-2"></i
                                                        ><a href="mailto:info@trizen.com">info@trizen.com</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
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

const withRouter = (Component) => {
    const Wrapper = (props) => {
        let location = useLocation();
        let navigate = useNavigate();
        let params = useParams();

        return (
            <Component
                location={location}
                navigate={navigate}
                params={params}
                {...props}
            />
        );
    };

    return Wrapper;
};

export default withRouter(VenueDetails);