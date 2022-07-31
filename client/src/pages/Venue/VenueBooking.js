import React, {Component} from 'react';
import InfoSection from "../../components/partials/InfoSection";
import Subscribe from "../../components/partials/Subscribe";
import axios from "axios";
import WithRouter from "../../_utility/WithRouter";
import {Link} from "react-router-dom";
import SessionHelper from "../../session/SessionHelper";
import Moment from "moment";
import Select from "react-select";

class VenueBooking extends Component {
    constructor() {
        super();
        this.state = {
            venue:[],
            images:[],
            amenities:[],
            categoryLists:[],
            occasionLists:[],
            loading:true,
            category_id:'',
            occasion_id:'',
            name:SessionHelper.GetAuthSession() !== null ? SessionHelper.GetAuthSession().name : '',
            email:SessionHelper.GetAuthSession() !== null ? SessionHelper.GetAuthSession().email : '',
            receive_promotional_offers:false,
            agree:false
        }
    }

    componentDidMount() {
        //console.log(SessionHelper.GetAuthSession());
        window.scrollTo(0, 0);
        let slug = this.props.params.venue_slug;
        let data = {};
        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.get('/api/venue/details/'+slug,).then(res => {
                this.setState({venue:res.data.venue});
                this.setState({images:res.data.venue.images});
                this.setState({amenities:res.data.venue.amenities});
                this.setState({loading:false});
            }).catch((error)=>{});
            axios.post('/api/category/lists/for/dropdown', data).then(res => {
                this.setState({categoryLists:res.data.categories});
            }).catch((error)=>{});
            axios.post('/api/occasion/lists/for/dropdown', data).then(res => {
                this.setState({occasionLists:res.data.occasions});
            }).catch((error)=>{});
        });
    }

    handleCategorySelect = (selectedOption) =>{
        this.setState({category_id : selectedOption.value});
    }

    handleOccasionSelect = (selectedOption) =>{
        this.setState({occasion_id : selectedOption.value});
    }

    handleInput = (e) =>{
        e.persist();
        this.setState({[e.target.name] : e.target.value});

        if(e.target.name.toString() === 'receive_promotional_offers')
        {
            this.setState({receive_promotional_offers : e.target.checked});
        }

        if(e.target.name.toString() === 'agree')
        {
            this.setState({agree : e.target.checked});
        }
    }

    formSubmit(e) {
        e.preventDefault();
        let data = {
            'venue_id':this.state.venue.id,
            'user_id':SessionHelper.GetAuthUserId(),
            'start_date':Moment(SessionHelper.GetFilterSession().startDate).format('YYYY-MM-DD'),
            'end_date':Moment(SessionHelper.GetFilterSession().endDate).format('YYYY-MM-DD'),
            'capacity':this.state.venue.capacity,
            'name':this.state.name,
            'email':this.state.email,
            'category_id':this.state.category_id,
            'occasion_id':this.state.occasion_id,
            'mobile_number':this.state.mobile_number,
            'address':this.state.address,
            'total_guests':this.state.total_guests,
            'price_type':this.state.venue.price_type,
            'net_total_price':this.state.venue.price_integer_value,
            'receive_promotional_offers':this.state.receive_promotional_offers,
            'agree':this.state.agree,
            'status':'pending',
        }

        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.post('/api/order/store', data).then(res => {
                if (res.data.status === 200)
                {
                    this.props.navigate('/dashboard');
                }
            }).catch((error)=>{});
        });
    }

    render() {
        return (
            <>
                <section className="breadcrumb-area bread-bg-7">
                    <div className="breadcrumb-wrap">
                        <div className="container">
                            <div className="row align-items-center">
                                <div className="col-lg-6">
                                    <div className="breadcrumb-content">
                                        <div className="section-heading">
                                            <h2 className="sec__title text-white">Venue Booking</h2>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-6">
                                    <div className="breadcrumb-list text-right">
                                        <ul className="list-items">
                                            <li><Link to="/">Home</Link></li>
                                            <li><Link to="/venues">Venues</Link></li>
                                            <li><Link to={`/venue/details/${this.state.venue.slug}`}>{this.state.venue.name}</Link></li>
                                            <li>Booking</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div className="bread-svg-box">
                        <svg
                            className="bread-svg"
                            xmlns="http://www.w3.org/2000/svg"
                            viewBox="0 0 100 10"
                            preserveAspectRatio="none"
                        >
                            <polygon points="100 0 50 10 0 0 0 10 100 10"></polygon>
                        </svg>
                    </div>
                </section>

                <section className="booking-area padding-top-100px padding-bottom-70px">
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-8">
                                <div className="form-box">
                                    <div className="form-title-wrap">
                                        <h3 className="title">Your Booking Information</h3>
                                    </div>
                                    <div className="form-content">
                                        <div className="contact-form-action">
                                            {SessionHelper.GetAuthSession() !== null ? (
                                                <form onSubmit={this.formSubmit.bind(this)} method="post">
                                                    <div className="row">
                                                        <div className="col-lg-6 responsive-column">
                                                            <div className="input-box">
                                                                <label className="label-text">Category</label>
                                                                <div className="form-group">
                                                                    <Select
                                                                        name="category_id"
                                                                        options={this.state.categoryLists}
                                                                        onChange={this.handleCategorySelect}
                                                                    />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-6 responsive-column">
                                                            <div className="input-box">
                                                                <label className="label-text">Occasion</label>
                                                                <div className="form-group">
                                                                    <Select
                                                                        name="occasion_id"
                                                                        options={this.state.occasionLists}
                                                                        onChange={this.handleOccasionSelect}
                                                                    />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-6 responsive-column">
                                                            <div className="input-box">
                                                                <label className="label-text">Name</label>
                                                                <div className="form-group">
                                                                    <span className="la la-user form-icon"></span>
                                                                    <input onChange={this.handleInput} className="form-control" type="text" name="name" placeholder="Name" defaultValue={this.state.name}/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-6 responsive-column">
                                                            <div className="input-box">
                                                                <label className="label-text">Your Email</label>
                                                                <div className="form-group">
                                                                    <span className="la la-envelope-o form-icon"></span>
                                                                    <input onChange={this.handleInput} className="form-control" type="email" name="email" placeholder="Email address" defaultValue={this.state.email}/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-6 responsive-column">
                                                            <div className="input-box">
                                                                <label className="label-text">Mobile Number</label>
                                                                <div className="form-group">
                                                                    <span className="la la-phone form-icon"></span>
                                                                    <input onChange={this.handleInput} className="form-control" type="text" name="mobile_number" placeholder="Mobile Number"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-6 responsive-column">
                                                            <div className="input-box">
                                                                <label className="label-text">How many guests you are planning for event?*</label>
                                                                <div className="form-group">
                                                                    <span className="las la-users form-icon"></span>
                                                                    <input onChange={this.handleInput} className="form-control" type="number" name="total_guests" placeholder="Total Guests" min="0" max={this.state.venue.capacity}/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-12">
                                                            <div className="input-box">
                                                                <label className="label-text">Address Line</label>
                                                                <div className="form-group">
                                                                    <span className="la la-map-marked form-icon"></span>
                                                                    <textarea onChange={this.handleInput} className="form-control" type="text" name="address" placeholder="Address line"></textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div className="col-lg-12">
                                                            <div className="input-box">
                                                                <div className="custom-checkbox mb-0">
                                                                    <input onChange={this.handleInput} name="receive_promotional_offers" type="checkbox" id="receiveChb"/>
                                                                    <label htmlFor="receiveChb">I want to receive promotional offers in the future</label>
                                                                </div>
                                                            </div>
                                                            <div className="input-box">
                                                                <div className="form-group">
                                                                    <div className="custom-checkbox">
                                                                        <input onChange={this.handleInput} name="agree" type="checkbox" id="agreechb"/>
                                                                        <label htmlFor="agreechb">By continuing, you agree to the <Link to='/terms-and-conditions'>Terms & Conditions</Link>.</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div className="btn-box">
                                                                <button className="theme-btn" type="submit">
                                                                    Confirm Booking
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            ) : (
                                                <div className="col-lg-12 flex-direction-column text-center" style={{"height": '500px'}}>
                                                    <h3>Before continue please <Link to={`/login?redirect=/venue/booking/${this.state.venue.slug}`}>Login</Link> or <Link to={`/register?redirect=/venue/booking/${this.state.venue.slug}`}>Register</Link></h3>
                                                </div>
                                            )}
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="col-lg-4">
                                <div className="form-box booking-detail-form">
                                    <div className="form-title-wrap">
                                        <h3 className="title">Booking Details</h3>
                                    </div>

                                    <div className="form-content">
                                        <div className="card-item shadow-none radius-none mb-0">
                                            { this.state.loading === true &&
                                                <div className="col-sm-12 loaderPlaceholder">
                                                    <div className="row">
                                                        <div className="col-lg-12 responsive-column">
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

                                            { this.state.loading !== true &&
                                                <div className="card-img pb-4">
                                                    <Link to={`/venue/details/${this.state.venue.slug}`} className="d-block">
                                                        <img src={this.state.venue.thumbnail} alt={this.state.venue.name}/>
                                                    </Link>
                                                </div>
                                            }

                                            {this.state.loading !== true &&
                                                <div className="card-body p-0">
                                                    <div className="d-flex justify-content-between">
                                                        <div>
                                                            <h3 className="card-title">{this.state.venue.name}</h3>
                                                            <p className="card-meta">{this.state.venue.division}, {this.state.venue.district}, {this.state.venue.city}</p>
                                                        </div>
                                                    </div>
                                                    <div className="section-block"></div>
                                                    <div id="amenities" className="page-scroll">
                                                        <div className="single-content-item padding-top-20px padding-bottom-20px">
                                                            <h3 className="title font-size-20">Amenities</h3>
                                                            <div className="amenities-feature-item pt-4">
                                                                {
                                                                    this.state.amenities.map((amenity, index) => (
                                                                        <React.Fragment key={index}>
                                                                            <span className="badge badge-primary p-2 mr-2">{amenity.name}</span>
                                                                        </React.Fragment>
                                                                    ))
                                                                }
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div className="section-block"></div>
                                                    <h3 className="card-title pt-3 pb-2 font-size-15">
                                                        <Link to={`/venue/details/${this.state.venue.slug}`}>
                                                            Order Details
                                                        </Link>
                                                    </h3>
                                                    <div className="section-block"></div>
                                                    <ul className="list-items list-items-2 py-3">
                                                        <li>
                                                            <span>Check in:</span>{Moment(SessionHelper.GetFilterSession().startDate).format('DD MMMM YYYY')}
                                                        </li>
                                                        <li>
                                                            <span>Check out:</span>{Moment(SessionHelper.GetFilterSession().endDate).format('DD MMMM YYYY')}
                                                        </li>
                                                        <li><span>capacity:</span><i className="las la-users font-size-18"></i> {this.state.venue.capacity}</li>
                                                        <li><span>Total Price:</span>{this.state.venue.price}</li>
                                                    </ul>
                                                </div>
                                            }
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <InfoSection/>
                <Subscribe/>
            </>
        );
    }
}

export default WithRouter(VenueBooking);