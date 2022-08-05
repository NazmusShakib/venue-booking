import React, {Component} from 'react';
import axios from "axios";
import {Link} from "react-router-dom";
import SessionHelper from "../../session/SessionHelper";

class TopVisitedPlaces extends Component {
    constructor() {
        super();
        this.state = {
            venues:[],
            loading:true
        }
    }
    componentDidMount() {
        let topVisitedVenues = SessionHelper.GetTopVisitedVenuesSession();
        if(topVisitedVenues === null)
        {
            axios.get('/sanctum/csrf-cookie').then(response => {
                axios.get('/api/top/visited/venues').then(res => {
                    this.setState({venues: res.data.data});
                    this.setState({loading: false});
                    SessionHelper.SetTopVisitedVenuesSession(res.data.data);
                }).catch((error) => {});
            });
        }else{
            this.setState({loading: false});
            this.setState({venues: topVisitedVenues});
        }
    }

    render() {
        return (
            <>
                <section className="destination-area padding-top-100px padding-bottom-45px">
                    <div className="container">
                        <div className="row align-items-center">
                            <div className="col-lg-8">
                                <div className="section-heading">
                                    <h2 className="sec__title">Top Visited Places</h2>
                                    <p className="sec__desc pt-3">
                                        Top Visited Places
                                    </p>
                                </div>
                            </div>
                            <div className="col-lg-4">
                                <div className="btn-box btn--box text-right">
                                    <Link to={`/venues`} className="theme-btn">
                                        Discover More
                                    </Link>
                                </div>
                            </div>
                        </div>
                        <div className="row padding-top-50px">
                            { this.state.loading === true &&
                                <div className="col-sm-12 loaderPlaceholder">
                                    <div className="row">
                                        <div className="col-lg-4 responsive-column">
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
                                        <div className="col-lg-4 responsive-column">
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
                                        <div className="col-lg-4 responsive-column">
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

                            {
                                this.state.venues.map((venue, index)=>(
                                    <React.Fragment key={index}>
                                        <div className="col-lg-4">
                                            <div className="card-item destination-card">
                                                <div className="card-img">
                                                    <img style={{'minHeight':'265px', 'maxHeight':'265px'}} src={venue.thumbnail} alt={venue.name}/>
                                                    <span className="badge">{venue.district}</span>
                                                </div>
                                                <div className="card-body">
                                                    <h3 className="card-title">
                                                        <Link to={`/venue/details/${venue.slug}`}>
                                                            {venue.name}
                                                        </Link>
                                                    </h3>
                                                    <div className="card-price d-flex align-items-center justify-content-between">
                                                        <p className="tour__text">50 Tours</p>
                                                        <p>
                                                            <span className="price__from">Price</span>
                                                            <span className="price__num">{venue.price}</span>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </React.Fragment>
                                ))
                            }

                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default TopVisitedPlaces;