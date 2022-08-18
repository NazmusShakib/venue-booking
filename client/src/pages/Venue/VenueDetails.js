import React, {Component} from 'react';
import {Link} from "react-router-dom";
import axios from "axios";
import OwlCarousel from 'react-owl-carousel';
import ReactHtmlParser, { processNodes, convertNodeToElement, htmlparser2 } from 'react-html-parser';
import Moment from 'moment';
import DateRangePicker from 'react-bootstrap-daterangepicker';
import SessionHelper from "../../session/SessionHelper";
import WithRouter from "../../_utility/WithRouter";
const options = {
    loop: true,
    items: 1,
    nav: true,
    dots: false,
    smartSpeed: 700,
    active: 'true',
    autoplay: true,
    margin: 0,
    navElement:'div',
    navText: ['<i class="la la-angle-left"></i>', '<i class="la la-angle-right"></i>'],
};

class VenueDetails extends Component {
    constructor() {
        super();
        this.state = {
            loading:true,
            venue:[],
            images:[],
            amenities:[],
            startDate:'',
            endDate:'',
            bookNowBtn:true,
            available_dates:[],
            message:''
        }
    }

    componentDidMount() {
        window.scrollTo(0, 0);
        let slug = this.props.params.venue_slug;
        axios.get('/api/venue/details/'+slug,).then(res => {
            this.setState({loading:false});
            this.setState({venue:res.data.venue});
            this.setState({images:res.data.venue.images});
            this.setState({amenities:res.data.venue.amenities});
        }).catch((error)=>{});
    }

    handleDateRangeEvent(event, picker) {
        if(event.type.toString() === 'apply')
        {
            picker.element.val(
                picker.startDate.format('MM/DD/YYYY') +
                ' - ' +
                picker.endDate.format('MM/DD/YYYY')
            );
            this.setState({startDate:Moment(picker.startDate).format('YYYY-MM-DD')});
            this.setState({endDate:Moment(picker.endDate).format('YYYY-MM-DD')});
        }

        if(event.type.toString() === 'cancel')
        {
            picker.element.val('');
            this.setState({startDate:''});
            this.setState({endDate:''});
        }
    }

    formSubmit(e) {
        e.preventDefault();
        this.setState({bookNowBtn:false});
        let data = {
            'venue_id':this.state.venue.id,
            'check_in' : this.state.startDate,
            'check_out' : this.state.endDate
        }

        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.post('/api/booking/availability/checking', data).then(res => {
                console.log(res);
                if (res.data.status === 200)
                {
                    if(res.data.availability === true)
                    {
                        SessionHelper.SetFilterSession({
                            'startDate' : this.state.startDate,
                            'endDate' : this.state.endDate
                        });
                        this.props.navigate('/venue/booking/'+this.state.venue.slug);
                    }

                    if(res.data.availability === false){
                        this.setState(previousState => ({
                            message: res.data.message,
                            available_dates: res.data.available_dates,
                        }), () => {
                            document.getElementById('availableDatesModal').classList.add('show');
                            document.getElementById("availableDatesModal").style.display = "block";
                        });
                    }
                }
                this.setState({bookNowBtn:true});
            }).catch((error)=>{});
        });
    }

    closeModal = (e) =>{
        document.getElementById('availableDatesModal').classList.remove('show');
        document.getElementById("availableDatesModal").style.display = "none";
    }

    render() {
        return (
            <>
                <div className="modal fade" id="availableDatesModal">
                    <div className="modal-dialog modal-dialog-centered" role="document">
                        <div className="modal-content">
                            <div className="modal-header">
                                <h5 className="modal-title" id="exampleModalLongTitle">Available Dates</h5>
                                <button type="button" className="close" onClick={this.closeModal}>
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div className="modal-body">
                                <p className="text-info">{this.state.message}</p>
                                <br/>
                                {
                                    this.state.available_dates.map((date, index) => (
                                        <React.Fragment key={index}>
                                            <span className="badge badge-primary p-2 mr-2 mb-2">{date}</span>
                                        </React.Fragment>
                                    ))
                                }
                            </div>
                            <div className="modal-footer">
                                <button type="button" className="btn btn-danger" onClick={this.closeModal}> Close </button>
                            </div>
                        </div>
                    </div>
                </div>

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
                                    { this.state.loading === true &&
                                        <div className="row">
                                            <div className="col-lg-12 responsive-column">
                                                <div className="ph-item">
                                                    <div className="ph-col-12">
                                                        <div className="ph-picture"></div>
                                                        <div className="ph-row">
                                                            <div className="ph-col-6 big"></div>
                                                            <div className="ph-col-2 big"></div>
                                                            <div className="ph-col-4"></div>
                                                            <div className="ph-col-6"></div>
                                                            <div className="ph-col-12"></div>
                                                            <div className="ph-col-6 big"></div>
                                                            <div className="ph-col-2 big"></div>
                                                            <div className="ph-col-4"></div>
                                                            <div className="ph-col-6"></div>
                                                            <div className="ph-col-12"></div>
                                                            <div className="ph-col-6 big"></div>
                                                            <div className="ph-col-2 big"></div>
                                                            <div className="ph-col-4"></div>
                                                            <div className="ph-col-6"></div>
                                                            <div className="ph-col-12"></div>
                                                            <div className="ph-col-6 big"></div>
                                                            <div className="ph-col-2 big"></div>
                                                            <div className="ph-col-4"></div>
                                                            <div className="ph-col-6"></div>
                                                            <div className="ph-col-12"></div>
                                                            <div className="ph-col-6 big"></div>
                                                            <div className="ph-col-2 big"></div>
                                                            <div className="ph-col-4"></div>
                                                            <div className="ph-col-6"></div>
                                                            <div className="ph-col-12"></div>
                                                            <div className="ph-col-6 big"></div>
                                                            <div className="ph-col-2 big"></div>
                                                            <div className="ph-col-4"></div>
                                                            <div className="ph-col-6"></div>
                                                            <div className="ph-col-12"></div>
                                                            <div className="ph-col-6 big"></div>
                                                            <div className="ph-col-2 big"></div>
                                                            <div className="ph-col-4"></div>
                                                            <div className="ph-col-6"></div>
                                                            <div className="ph-col-12"></div>
                                                            <div className="ph-col-6 big"></div>
                                                            <div className="ph-col-2 big"></div>
                                                            <div className="ph-col-4"></div>
                                                            <div className="ph-col-6"></div>
                                                            <div className="ph-col-12"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    }

                                    {this.state.loading === false &&
                                        <div className="single-content-wrap padding-top-60px">
                                        <div id="description" className="page-scroll">
                                            <div className="single-content-item padding-bottom-40px">
                                                <h1 className="title font-size-35 mb-3">
                                                    About {this.state.venue.name}
                                                </h1>
                                                {ReactHtmlParser(this.state.venue.description)}
                                            </div>
                                            <div className="section-block"></div>
                                            <div id="amenities" className="page-scroll">
                                                <div
                                                    className="single-content-item padding-top-40px padding-bottom-20px">
                                                    <h3 className="title font-size-20">Amenities</h3>
                                                    <div className="amenities-feature-item pt-4">
                                                        {
                                                            this.state.amenities.map((amenity, index) => (
                                                                <React.Fragment key={index}>
                                                                    <span
                                                                        className="badge badge-primary p-2 mr-2 mb-2">{amenity.name}</span>
                                                                </React.Fragment>
                                                            ))
                                                        }
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    }
                                </div>
                                <div className="col-lg-4">
                                    <div className="sidebar single-content-sidebar mb-0">
                                        <div className="sidebar-widget single-content-widget">
                                            <div className="sidebar-widget-item">
                                                <div className="contact-form-action">
                                                    <form onSubmit={this.formSubmit.bind(this)}>
                                                        <div className="input-box">
                                                            <h3 className="title stroke-shape">Book Now</h3>
                                                            <div className="form-group">
                                                                <span className="la la-calendar form-icon"></span>
                                                                <DateRangePicker
                                                                    initialSettings={{ autoUpdateInput: false,locale: {cancelLabel: 'Clear'}}}
                                                                    onEvent={this.handleDateRangeEvent.bind(this)}
                                                                >
                                                                    <input required type="text" className="form-control" placeholder="Check in - Check out"/>
                                                                </DateRangePicker>
                                                            </div>
                                                        </div>

                                                        <div className="btn-box pt-2">
                                                            {this.state.bookNowBtn === true ? (
                                                                <button type="submit" id="bookNowBtn" className="theme-btn text-center w-100 mb-2 btn-outline-none">
                                                                    <i className="la la-shopping-cart mr-2 font-size-18"></i> Book Now
                                                                </button>

                                                            ) : (
                                                                <button type="submit" id="bookNowBtn" className="disabled theme-btn text-center w-100 mb-2 btn-outline-none">
                                                                    <i className="las la-spin la-spinner mr-2 font-size-18"></i> Processing
                                                                </button>
                                                            )}
                                                        </div>
                                                    </form>
                                                </div>
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
                                                        <i className="la la-dollar icon-element mr-2"></i>No-hassle best price guarantee
                                                    </li>
                                                    <li>
                                                        <i className="la la-microphone icon-element mr-2"></i> Customer care available 24/7
                                                    </li>
                                                    <li>
                                                        <i className="la la-thumbs-up icon-element mr-2"></i> Hand-picked Tours & Activities
                                                    </li>
                                                    <li>
                                                        <i className="la la-file-text icon-element mr-2"></i>Free Travel Insureance
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

export default WithRouter(VenueDetails);