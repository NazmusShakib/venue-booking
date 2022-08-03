import React, {Component} from 'react';
import {Link} from "react-router-dom";
import OwlCarousel from 'react-owl-carousel';

const options = {
    autoplay: true,
    loop: true,
    rewind: true,
    items: 3,
    nav: true,
    dots: true,
    smartSpeed: 700,
    active: true,
    margin: 30,
    navElement:'div',
    navText: ['<i class="la la-angle-left"></i>', '<i class="la la-angle-right"></i>'],
    responsive: { 0: { items: 1 }, 768: { items: 2 }, 992: { items: 3 } },
};

class PopularVenuesSlider extends Component {
    constructor() {
        super();
        this.state = {}
    }

    render() {
        return (
            <>
                <div className="hotel-card-wrap">
                    { this.props.venues.length < 1 &&
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

                    {this.props.venues.length > 0 &&
                        <OwlCarousel className='carousel-action' {...options}>
                        {
                            this.props.venues.map((venue, index) => (
                                <React.Fragment key={index}>
                                    <div className="card-item">
                                        <div className="card-img">
                                            <Link to={`/venue/details/${venue.slug}`} className="d-block">
                                                <img style={{'height': '265px'}} src={venue.thumbnail}
                                                     alt={venue.name}/>
                                            </Link>

                                            <div className="add-to-wishlist icon-element" data-toggle="tooltip"
                                                 data-placement="top" title="Bookmark">
                                                <i className="la la-heart-o"></i>
                                            </div>
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
                                </React.Fragment>
                            ))
                        }
                    </OwlCarousel>
                    }
                </div>
            </>
        );
    }
}

export default PopularVenuesSlider;