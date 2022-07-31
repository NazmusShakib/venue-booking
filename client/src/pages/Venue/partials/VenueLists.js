import React, {Component} from 'react';
import axios from "axios";
import {Link} from "react-router-dom";
import SessionHelper from "../../../session/SessionHelper";
let defaultSearchFormSessionFilter = {};
class VenueLists extends Component {
    constructor(props) {
        super(props);
        this.state={
            venues:[],
            page:1,
            current_page:1,
            last_page:0,
            category:'',
            venuesLoading:true,
        }
    }

    componentDidMount() {
        defaultSearchFormSessionFilter = {
            'cities': SessionHelper.GetSessionFilterCity(),
            'categories': SessionHelper.GetSessionFilterCategory(),
            'occasions': SessionHelper.GetSessionFilterOccasion()
        };
        this.getData('', JSON.stringify(defaultSearchFormSessionFilter));
    }

    doVenueListFilter(filter){
        this.setState({category:filter.category});
        let cat = filter.category;
        let formatFilter = Object.assign({}, filter);
        defaultSearchFormSessionFilter = formatFilter;
        formatFilter = JSON.stringify(formatFilter);
        //console.log(formatFilter);
        this.setState(previousState => ({
            page: 1,
        }), () => {
            this.getData(cat, formatFilter);
        });
    }

    componentDidUpdate(prevProps, prevState, snapshot) {
        if (prevProps.category !== this.props.category)
        {
            this.setState({category:this.props.category});
            let cat = this.props.category;
            this.setState(previousState => ({
                page: 1,
            }), () => {
                this.getData(cat, JSON.stringify(defaultSearchFormSessionFilter));
            });
        }
    }

    getData(cat, filter=[]){
        this.setState({venuesLoading:true});
        if(!cat){
            axios.post(`/api/venues?page=${this.state.page}`, filter).then(res => {
                if(this.state.page <= this.state.last_page)
                {
                    this.setState({page: this.state.page+1});
                }
                this.setState({current_page:res.data.meta.current_page});
                this.setState({last_page:res.data.meta.last_page});
                this.setState({venues:res.data.data});
                this.setState({venuesLoading:false});
            }).catch((error)=>{});
        }else{
            axios.post(`/api/venues/${cat}?page=${this.state.page}`, filter).then(res => {
                if(this.state.page <= this.state.last_page)
                {
                    this.setState({page: this.state.page+1});
                }
                this.setState({current_page:res.data.meta.current_page});
                this.setState({last_page:res.data.meta.last_page});
                this.setState({venues:res.data.data});
                this.setState({venuesLoading:false});
            }).catch((error)=>{});
        }
    }

    loadMore(e){
        this.setState({venuesLoading:true});
        let cat = this.state.category;
        let filter = JSON.stringify(defaultSearchFormSessionFilter);
        if(!cat){
            axios.post(`/api/venues?page=${this.state.page}`, filter).then(res => {
                if(this.state.page <= this.state.last_page)
                {
                    this.setState({page: this.state.page+1});
                }
                this.setState({current_page:res.data.meta.current_page});
                this.setState({last_page:res.data.meta.last_page});
                this.setState({ venues: [...this.state.venues, ...res.data.data] });
                this.setState({venuesLoading:false});
            }).catch((error)=>{});
        }else{
            axios.post(`/api/venues/${cat}?page=${this.state.page}`, filter).then(res => {
                if(this.state.page <= this.state.last_page)
                {
                    this.setState({page: this.state.page+1});
                }
                this.setState({current_page:res.data.meta.current_page});
                this.setState({last_page:res.data.meta.last_page});
                this.setState({ venues: [...this.state.venues, ...res.data.data] });
                this.setState({venuesLoading:false});
            }).catch((error)=>{});
        }
    }

    render() {
        return (
            <>
                { this.state.venuesLoading === true &&
                    <div className="row">
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
                    </div>
                }

                {this.state.venuesLoading === false &&
                    <>
                        <div className="row">
                            {
                                this.state.venues.map((venue, index) => (
                                    <React.Fragment key={index}>
                                        <div className="col-lg-6 responsive-column">
                                            <div className="card-item">

                                                <div className="card-img">
                                                    <Link to={`/venue/details/${venue.slug}`} className="d-block">
                                                        <img style={{'minHeight': '285px'}} src={venue.thumbnail}
                                                             alt={venue.name}/>
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
                                                        <i className="las la-users font-size-18"></i><span
                                                        className="review__text">{venue.capacity}</span>
                                                    </div>
                                                    <div
                                                        className="card-price d-flex align-items-center justify-content-between">
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
                        </div>
                        <div className="row">
                            { this.state.current_page !== this.state.last_page &&
                            <div className="col-lg-12">
                                <div className="btn-box mt-3 text-center">
                                    <button type="button" onClick={this.loadMore.bind(this)} className="theme-btn"><i className="la la-refresh mr-1"></i>Load More</button>
                                </div>
                            </div>
                            }
                        </div>
                    </>
                }
            </>
        );
    }
}

export default VenueLists;