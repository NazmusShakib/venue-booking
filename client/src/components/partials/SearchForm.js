import React, {Component} from 'react';

class SearchForm extends Component {
    render() {
        return (
            <>
                <div className="search-fields-container">
                    <div className="contact-form-action">
                        <form action="#" className="row">
                            <div className="col-lg-4 pr-0">
                                <div className="input-box">
                                    <label className="label-text"
                                    >Destination / Hotel name</label
                                    >
                                    <div className="form-group">
                                        <span className="la la-map-marker form-icon"></span>
                                        <input
                                            className="form-control"
                                            type="text"
                                            placeholder="Enter City or property"
                                        />
                                    </div>
                                </div>
                            </div>
                            <div className="col-lg-3 pr-0">
                                <div className="input-box">
                                    <label className="label-text">Check in</label>
                                    <div className="form-group">
                                        <span className="la la-calendar form-icon"></span>
                                        <input
                                            className="date-range form-control"
                                            type="text"
                                            name="daterange-single"
                                            readOnly
                                        />
                                    </div>
                                </div>
                            </div>
                            <div className="col-lg-3 pr-0">
                                <div className="input-box">
                                    <label className="label-text">Check out</label>
                                    <div className="form-group">
                                        <span className="la la-calendar form-icon"></span>
                                        <input
                                            className="date-range form-control"
                                            type="text"
                                            name="daterange-single"
                                            readOnly
                                        />
                                    </div>
                                </div>
                            </div>
                            <div className="col-lg-2 pr-0">
                                <div className="input-box">
                                    <label className="label-text"></label>
                                    <div className="form-group pr-3">
                                        <input
                                            type="submit"
                                            className="theme-btn btn-block mt-2"
                                            value="Search Now"
                                        />
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </>
        );
    }
}

export default SearchForm;