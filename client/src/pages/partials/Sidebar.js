import React, {Component} from 'react';
import Daterange from "../../hooks/Daterange";
import JqueryUi from "../../hooks/JqueryUi";
import Categories from "./components/Categories";
import Occasions from "./components/Occasions";
import Amenities from "./components/Amenities";
let cats = [];
let occasions = [];
let amenities = [];
class Sidebar extends Component {
    constructor() {
        super();
        this.state={
            accordianId:''
        }
    }

    handleOnClickForAccordian(e){
        let accordianId = e.target.getAttribute('data-target');
        this.setState({accordianId:accordianId});
    }

    receiveCategoryFilterResponse(response){
        cats['filteredCategories'] = response.responsedCategories;
        this.props.receiveFilterResponseFromSidebar('categories', cats);
    }

    receiveOccasionsFilterResponse(response){
        occasions['filteredOccasions'] = response.responsedOccasions;
        this.props.receiveFilterResponseFromSidebar('occasions', occasions);
    }

    receiveAmenitiesFilterResponse(response){
        amenities['filteredAmenities'] = response.responsedAmenities;
        this.props.receiveFilterResponseFromSidebar('amenities', amenities);
    }

    render() {
        return (
            <>
                <Daterange/>
                <JqueryUi/>
                <div className="sidebar mb-0 p-0">
                    <div className="sidebar-widget p-4">
                        <h3 className="title stroke-shape">Search Resorts</h3>
                        <div className="sidebar-widget-item">
                            <div className="contact-form-action">
                                <form action="#">
                                    <div className="input-box">
                                        <label className="label-text">Destination / Resort Name</label>
                                        <div className="form-group">
                                            <span className="la la-map-marker form-icon"></span>
                                            <input className="form-control" type="text" name="text" placeholder="Destination, hotel name"/>
                                        </div>
                                    </div>
                                    <div className="input-box">
                                        <label className="label-text">Check in - Check out</label>
                                        <div className="form-group">
                                            <span className="la la-calendar form-icon"></span>
                                            <input className="date-range form-control" type="text" name="daterange" readOnly/>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div className="btn-box pt-2">
                            <a href="hotel-search-result.html" className="theme-btn">Search Now</a>
                        </div>
                    </div>
                    <div className="sidebar-widget border-bottom-0 p-0 pl-4 pr-4">
                        <h3 className="title stroke-shape">Filter by Price</h3>
                        <div className="sidebar-price-range">
                            <div className="main-search-input-item">
                                <div className="price-slider-amount padding-bottom-20px">
                                    <label htmlFor="amount" className="filter__label">Price:</label>
                                    <input type="text" id="amount" className="amounts"/>
                                </div>
                                <div id="slider-range"></div>
                            </div>
                            <div className="btn-box pt-4">
                                <button className="theme-btn theme-btn-small theme-btn-transparent" type="button">Apply</button>
                            </div>
                        </div>
                    </div>
                    <div className="sidebar-widget p-0">
                        <div className="accordion" id="accordionExample">
                            <div className="sidebar-category pl-4 pr-4">
                                <button onClick={this.handleOnClickForAccordian.bind(this)} id="headingOne" className="mb-3 text-decoration-none btn btn-link btn-block text-left title stroke-shape mb-0 pl-0" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="headingOne">
                                    Category
                                </button>
                                <div id="collapseOne" className={(this.state.accordianId == '#collapseOne' || this.state.accordianId == '') ? 'collapse show' : 'collapse'} aria-labelledby="headingOne"
                                     data-parent="#accordionExample">
                                    <Categories receiveCategoryFilterResponse={this.receiveCategoryFilterResponse.bind(this)}/>
                                </div>
                            </div>

                            <div className="sidebar-category pl-4 pr-4">
                                <button onClick={this.handleOnClickForAccordian.bind(this)} className="mb-3 text-decoration-none btn btn-link btn-block text-left title stroke-shape mb-0 pl-0" type="button" data-toggle="collapse" data-target="#collapseOccasions" aria-expanded="true" aria-controls="collapseOccasions">
                                    Occasions
                                </button>
                                <div id="collapseOccasions" className={this.state.accordianId == '#collapseOccasions' ? 'collapse show' : 'collapse'} aria-labelledby="collapseOccasions"
                                     data-parent="#accordionExample">
                                    <Occasions receiveOccasionsFilterResponse={this.receiveOccasionsFilterResponse.bind(this)}/>
                                </div>
                            </div>

                            <div className="sidebar-category pl-4 pr-4">
                                <button onClick={this.handleOnClickForAccordian.bind(this)} className="mb-3 text-decoration-none btn btn-link btn-block text-left title stroke-shape mb-0 pl-0" type="button" data-toggle="collapse" data-target="#collapseAmenity" aria-expanded="true" aria-controls="collapseAmenity">
                                    Amenity
                                </button>
                                <div id="collapseAmenity" className={this.state.accordianId == '#collapseAmenity' ? 'collapse show' : 'collapse'} aria-labelledby="collapseAmenity"
                                     data-parent="#accordionExample">
                                    <Amenities receiveAmenitiesFilterResponse={this.receiveAmenitiesFilterResponse.bind(this)}/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </>
        );
    }
}

export default Sidebar;