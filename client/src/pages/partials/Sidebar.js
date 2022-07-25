import React, {Component} from 'react';
import Categories from "./components/Categories";
import Occasions from "./components/Occasions";
import Amenities from "./components/Amenities";
import DateRangePicker from "react-bootstrap-daterangepicker";
import PriceRangeSlider from 'react-rangeslider'

let cats = [];
let occasions = [];
let amenities = [];
class Sidebar extends Component {
    constructor() {
        super();
        this.state={
            accordianId:'',
            priceValue:10
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

    handleDateRangeEvent(event, picker) {
        console.log(picker.startDate);
    }
    handleDateRangeCallback(start, end, label) {
        console.log(start, end, label);
    }


    handlePriceRangeOnChange = (value) => {
        this.setState({
            priceValue: value
        })
    }

    render() {
        let formatUSD = value => value + ' $';
        return (
            <>
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
                                            <DateRangePicker onEvent={this.handleDateRangeEvent} onCallback={this.handleDateRangeCallback}>
                                                <input type="text" className="form-control" />
                                            </DateRangePicker>
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
                        <div className="sidebar-price-range overflow-hidden">
                            <div className="main-search-input-item slider custom-labels mb-5">
                                <div className="price-slider-amount padding-bottom-20px">
                                    <h3 className='text-center text-success'>{this.state.priceValue+'$'}</h3>
                                </div>

                                <PriceRangeSlider
                                    min={0}
                                    max={10000}
                                    value={this.state.priceValue}
                                    labels={{
                                        0: 'Low',
                                        5000: 'Medium',
                                        10000: 'High'
                                    }}
                                    format={formatUSD}
                                    handleLabel={''}
                                    onChange={this.handlePriceRangeOnChange}
                                />
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