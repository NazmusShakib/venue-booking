import React, {Component} from 'react';
import Select from 'react-select';
import axios from "axios";
import Moment from "moment";
import SessionHelper from "../../session/SessionHelper";
import WithRouter from "../../_utility/WithRouter";
class SearchForm extends Component {
    constructor() {
        super();
        this.state = {
            city:'',
            cityLists:[],
            category:'',
            categoryLists:[],
            occasion:'',
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
        this.setState({city : selectedOption.value});
    }

    handleCategorySelect = (selectedOption) =>{
        this.setState({category : selectedOption.value});
    }

    handleOccasionSelect = (selectedOption) =>{
        this.setState({occasion : selectedOption.value});
    }

    formSubmit(e) {
        let data = {
            'occasion' : [this.state.occasion],
            'category' : [this.state.category],
            'city' : [this.state.city]
        };
        SessionHelper.SetFilterSession(data);
        this.props.navigate('/venues');
    }

    render() {
        return (
            <>
                <div className="search-fields-container">
                    <div className="contact-form-action">
                        <form onSubmit={this.formSubmit.bind(this)} className="row">
                            <div className="col-lg-4 pr-0">
                                <div className="input-box">
                                    <label className="label-text">City</label>
                                    <div className="form-group">
                                        <Select
                                            name="city"
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
                                            name="category"
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
                                            name="occasion"
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

export default WithRouter(SearchForm);