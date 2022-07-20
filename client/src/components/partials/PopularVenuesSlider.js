import React, {Component} from 'react';
import AppendScripts from "../../hooks/AppendScripts";
import {Link} from "react-router-dom";

const PopularVenuesScripts = () => {
    let scripts = 'setTimeout(function(){ $(".hotel-card-carousel-2").owlCarousel({\n' +
        '            loop: !0,\n' +
        '            items: 3,\n' +
        '            nav: !0,\n' +
        '            dots: !0,\n' +
        '            smartSpeed: 700,\n' +
        '            autoplay: !1,\n' +
        '            active: !0,\n' +
        '            margin: 30,\n' +
        '            navText: [\'<i class="la la-angle-left"></i>\', \'<i class="la la-angle-right"></i>\'],\n' +
        '            responsive: { 0: { items: 1 }, 768: { items: 2 }, 992: { items: 3 } },\n' +
        '        });}, 1500);';
    AppendScripts(scripts);
}

class PopularVenuesSlider extends Component {
    constructor() {
        super();
        this.state = {
            venues:[]
        }
    }

    render() {
        console.log(this.props.venues);
        return (
            <>
                <div className="hotel-card-wrap">
                    <div className="hotel-card-carousel-2 carousel-action">

                        {
                            this.props.venues.map((venue, index) => (
                                <React.Fragment key={index}>
                                    <div className="card-item">

                                        <div className="card-img">
                                            <Link to={`/venue/details/${venue.slug}`} className="d-block">
                                                <img style={{'minHeight':'265px'}} src={venue.thumbnail} alt={venue.name}/>
                                            </Link>

                                            <div className="add-to-wishlist icon-element" data-toggle="tooltip" data-placement="top" title="Bookmark">
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
                                </React.Fragment>
                            ))
                        }
                    </div>
                </div>
                <PopularVenuesScripts/>
            </>
        );
    }
}

export default PopularVenuesSlider;