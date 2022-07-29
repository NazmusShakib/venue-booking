import React, {Component} from 'react';
import Cities from "./components/Cities";
import Categories from "./components/Categories";
import Occasions from "./components/Occasions";
import Amenities from "./components/Amenities";
import DateRangePicker from "react-bootstrap-daterangepicker";
import PriceRangeSlider from 'react-rangeslider';
import Moment from "moment";

let cities = [];
let cats = [];
let occasions = [];
let amenities = [];
let date = [];
let price = [];
class Sidebar extends Component {
    constructor() {
        super();
        this.state={
            accordianId:'',
            priceValue:10,
            start_date: Moment().format('YYYY-MM-DD'),
            end_date: Moment().format('YYYY-MM-DD')
        }
    }

    handleOnClickForAccordian(e){
        let accordianId = e.target.getAttribute('data-target');
        this.setState({accordianId:accordianId});
    }

    receiveCityFilterResponse(response){
        cities['filteredCities'] = response.responsedCities;
        this.props.receiveFilterResponseFromSidebar('cities', cities);
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
        this.setState({
            start_date: Moment(picker.startDate).format('YYYY-MM-DD'),
            end_date: Moment(picker.endDate).format('YYYY-MM-DD')
        });
    }

    receiveDateRangeFilterResponse(){
        date['filteredDate'] = {
            'check_in' : this.state.start_date,
            'check_out' : this.state.end_date
        }

        this.props.receiveFilterResponseFromSidebar('date', date);
    }

    handlePriceRangeOnChange = (value) => {
        this.setState({priceValue: value});
    }

    handleChangeComplete = () => {
        price['filteredPrice'] = this.state.priceValue;
        this.props.receiveFilterResponseFromSidebar('price', price);
    };

    render() {
        let formatPrice = value => '৳ '+value;
        return (
            <>
                <div className="sidebar mb-0 p-0">
                    <div className="sidebar-widget p-4">
                        <h3 className="title stroke-shape">Search Venues</h3>
                        <div className="sidebar-widget-item">
                            <div className="contact-form-action">
                                <form action="#">
                                    <div className="input-box">
                                        <label className="label-text">Check in - Check out</label>
                                        <div className="form-group">
                                            <span className="la la-calendar form-icon"></span>
                                            <DateRangePicker onEvent={this.handleDateRangeEvent.bind(this)}>
                                                <input type="text" className="form-control" />
                                            </DateRangePicker>
                                            <span className="form-icon" style={{'top':'6px', 'right':'6px', 'left':'auto'}}>
                                                <button onClick={this.receiveDateRangeFilterResponse.bind(this)} type="button" className="btn btn-xs btn-primary">Go</button>
                                            </span>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div className="sidebar-widget border-bottom-0 p-0 pl-4 pr-4 pb-1">
                        <h3 className="title stroke-shape">Filter by Price</h3>
                        <div className="sidebar-price-range">
                            <div className="main-search-input-item slider custom-labels mb-5">
                                <div className="price-slider-amount padding-bottom-20px">
                                    <h3 className='text-center text-success'>৳{this.state.priceValue}</h3>
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
                                    format={formatPrice}
                                    handleLabel={''}
                                    onChange={this.handlePriceRangeOnChange}
                                    onChangeComplete={this.handleChangeComplete}
                                />
                            </div>
                        </div>
                    </div>
                    <div className="sidebar-widget p-0">
                        <div className="accordion" id="accordionExample">
                            <div className="sidebar-category pl-4 pr-4">
                                <button onClick={this.handleOnClickForAccordian.bind(this)} id="headingCity" className="mb-3 text-decoration-none btn btn-link btn-block text-left title stroke-shape mb-0 pl-0" type="button" data-toggle="collapse" data-target="#collapseCity" aria-expanded="true" aria-controls="headingCity">
                                    City
                                </button>
                                <div id="collapseCity" className={(this.state.accordianId == '#collapseCity' || this.state.accordianId == '') ? 'collapse show' : 'collapse'} aria-labelledby="headingCity"
                                     data-parent="#accordionExample">
                                    <Cities receiveCityFilterResponse={this.receiveCityFilterResponse.bind(this)}/>
                                </div>
                            </div>

                            <div className="sidebar-category pl-4 pr-4">
                                <button onClick={this.handleOnClickForAccordian.bind(this)} id="headingOne" className="mb-3 text-decoration-none btn btn-link btn-block text-left title stroke-shape mb-0 pl-0" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="headingOne">
                                    Category
                                </button>
                                <div id="collapseOne" className={this.state.accordianId == '#collapseOne' ? 'collapse show' : 'collapse'} aria-labelledby="headingOne"
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