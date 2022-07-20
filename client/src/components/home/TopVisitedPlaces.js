import React, {Component} from 'react';
import axios from "axios";
import {Link} from "react-router-dom";

class TopVisitedPlaces extends Component {
    constructor() {
        super();
        this.state = {
            venues:[]
        }
    }
    componentDidMount() {
        let filter = [];
        axios.post('/api/venues', filter).then(res => {
            console.log(res.data.data);
            this.setState({venues:res.data.data});
        }).catch((error)=>{});
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