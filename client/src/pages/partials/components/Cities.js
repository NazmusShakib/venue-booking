import React, {Component} from 'react';
import axios from "axios";
import SessionHelper from "../../../session/SessionHelper";

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

            let reCity = SessionHelper.GetSessionFilterCity();
            if(reCity.toString() === e.target.value){
                SessionHelper.RemoveFilterSessionItem('cities');
            }
        }

        responseCities['responsedCities'] = cities;
        this.props.receiveCityFilterResponse(responseCities);
    }

    componentDidMount() {
        cities = SessionHelper.GetSessionFilterCity();
        let sessionCities = SessionHelper.GetCitiesSession();
        if(sessionCities === null){
            axios.get('/sanctum/csrf-cookie').then(response => {
                axios.get('/api/cities').then(res => {
                    this.setState({cities:res.data.data});
                    SessionHelper.SetCitiesSession(res.data.data);
                }).catch((error)=>{});
            });
        }else{
            this.setState({cities:sessionCities});
        }
    }

    render() {
        return (
            <>
                {
                    this.state.cities.map((city, index) => (
                        <React.Fragment key={index}>
                            <div className="custom-checkbox">
                                {
                                    (cities.includes(city.slug) === true) &&
                                    <input  onClick={this.handleCityFilter.bind(this)} defaultChecked  type="checkbox" value={city.slug} name="city" id={city.slug}/>
                                }
                                {
                                    (cities.includes(city.slug) === false) &&
                                    <input  onClick={this.handleCityFilter.bind(this)}  type="checkbox" value={city.slug} name="city" id={city.slug}/>
                                }

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