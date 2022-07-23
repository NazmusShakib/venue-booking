import React, {Component} from 'react';
import Select from 'react-select';
import axios from "axios";
class SearchForm extends Component {
    constructor() {
        super();
        this.state = {
            city_id:'',
            cityLists:[],
            category_id:'',
            categoryLists:[],
            occasion_id:'',
            occasionLists:[]
        }
    }

    componentDidMount() {
        let data = {};
        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.post('/api/city/lists/for/dropdown', data).then(res => {
                this.setState({cityLists:res.data.cities});
            }).catch((error)=>{});
            axios.post('/api/category/lists/for/dropdown', data).then(res => {
                this.setState({categoryLists:res.data.categories});
            }).catch((error)=>{});
            axios.post('/api/occasion/lists/for/dropdown', data).then(res => {
                this.setState({occasionLists:res.data.occasions});
            }).catch((error)=>{});
        });
    }

    handleCitySelect = (selectedOption) =>{
        this.setState({city_id : selectedOption.value});
    }

    handleCategorySelect = (selectedOption) =>{
        this.setState({category_id : selectedOption.value});
    }

    handleOccasionSelect = (selectedOption) =>{
        this.setState({occasion_id : selectedOption.value});
    }

    render() {
        return (
            <>
                <div className="search-fields-container">
                    <div className="contact-form-action">
                        <form action="/venues" className="row">
                            <div className="col-lg-4 pr-0">
                                <div className="input-box">
                                    <label className="label-text">City</label>
                                    <div className="form-group">
                                        <Select
                                            name="city_id"
                                            options={this.state.cityLists}
                                            onChange={this.handleCitySelect}
                                        />
                                    </div>
                                </div>
                            </div>

                            <div className="col-lg-3 pr-0">
                                <div className="input-box">
                                    <label className="label-text">Category</label>
                                    <div className="form-group">
                                        <Select
                                            name="category_id"
                                            options={this.state.categoryLists}
                                            onChange={this.handleCategorySelect}
                                        />
                                    </div>
                                </div>
                            </div>

                            <div className="col-lg-3 pr-0">
                                <div className="input-box">
                                    <label className="label-text">Occasion</label>
                                    <div className="form-group">
                                        <Select
                                            name="occasion_id"
                                            options={this.state.occasionLists}
                                            onChange={this.handleOccasionSelect}
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
                                            style={{'height': '43px', 'lineHeight': '43px'}}
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