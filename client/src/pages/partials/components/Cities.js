import React, {Component} from 'react';
import axios from "axios";
let cities = [];
let responseCities=[];
class Cities extends Component {
    constructor() {
        super();
        this.state={
            cities:[]
        }
    }

    handleCityFilter(e){
        if(e.target.checked === true)
        {
            cities.push(e.target.value);
        }
        else
        {
            cities = cities.filter(function(city){
                return city !== e.target.value;
            });
        }
        responseCities['responsedCities'] = cities;
        this.props.receiveCityFilterResponse(responseCities);
    }

    componentDidMount() {
        cities = [];
        axios.get('/api/cities').then(res => {
            this.setState({cities:res.data.data});
        }).catch((error)=>{});
    }

    render() {
        return (
            <>
                {
                    this.state.cities.map((city, index) => (
                        <React.Fragment key={index}>
                            <div className="custom-checkbox">
                                <input  onClick={this.handleCityFilter.bind(this)} type="checkbox" value={city.slug} name="category" id={city.slug}/>
                                <label htmlFor={city.slug}>{city.name}</label>
                            </div>
                        </React.Fragment>
                    ))
                }
            </>
        );
    }
}

export default Cities;