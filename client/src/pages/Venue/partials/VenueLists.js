import React, {Component} from 'react';
import axios from "axios";
import {Link} from "react-router-dom";
import SessionHelper from "../../../session/SessionHelper";

class VenueLists extends Component {
    constructor(props) {
        super(props);
        this.state={
            venues:[],
            venuesLoading:true
        }
    }

    componentDidMount() {
        window.scrollTo(0, 0);
        this.getData('', []);
    }

    doVenueListFilter(filter){
        let cat = filter.category;
        let formatFilter = Object.assign({}, filter);
        formatFilter = JSON.stringify(formatFilter);
        console.log(formatFilter);
        this.getData(cat, formatFilter);
    }

    componentDidUpdate(prevProps, prevState, snapshot) {
        if (prevProps.category !== this.props.category)
        {
            let cat = this.props.category;
            this.getData(cat, []);
        }
    }

    getData(cat, filter=[]){
        this.setState({venuesLoading:true});
        if(!cat){
            axios.post('/api/venues', filter).then(res => {
                this.setState({venues:res.data.data});
                this.setState({venuesLoading:false});
            }).catch((error)=>{});
        }else{
            axios.post('/api/venues/'+cat, filter).then(res => {
                this.setState({venues:res.data.data});
                this.setState({venuesLoading:false});
            }).catch((error)=>{});
        }
    }

    render() {
        return (
            <>
                { this.state.venuesLoading === true &&
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

                {
                    this.state.venues.map((venue, index) => (
                        <React.Fragment key={index}>
                            <div className="col-lg-6 responsive-column">
                                <div className="card-item">

                                    <div className="card-img">
                                        <Link to={`/venue/details/${venue.slug}`} className="d-block">
                                            <img style={{'minHeight':'285px'}} src={venue.thumbnail} alt={venue.name}/>
                                        </Link>
                                    </div>
                                    <div className="card-body">
                                        <h3 className="card-title">
                                            <Link to={`/venue/details/${venue.slug}`}>
                                                {venue.name}
                                            </Link>
                                        </h3>
                                        <p className="card-meta">{venue.district}, {venue.division}</p>
                                        <div className="card-rating">
                                            <i className="las la-users font-size-18"></i><span className="review__text">{venue.capacity}</span>
                                        </div>
                                        <div className="card-price d-flex align-items-center justify-content-between">
                                            <p>
                                                <span className="price__num mr-1">{venue.price}</span>
                                                <span>{venue.price_type}</span>
                                            </p>
                                            <Link to={`/venue/details/${venue.slug}`} className="btn-text">
                                                See details<i className="la la-angle-right"></i>
                                            </Link>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </React.Fragment>
                    ))
                }

                { this.state.venuesLoading === false && this.state.venues.length > 0 &&
                    <div className="col-lg-12">
                        <div className="btn-box mt-3 text-center">
                            <button type="button" className="theme-btn"><i className="la la-refresh mr-1"></i>Load More</button>
                            <p className="font-size-13 pt-2">Showing 1 - 6 of 2224 Hotels</p>
                        </div>
                    </div>
                }
            </>
        );
    }
}

export default VenueLists;