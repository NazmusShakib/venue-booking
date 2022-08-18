import React, {Component} from 'react';
import axios from "axios";
import SessionHelper from "../../../session/SessionHelper";

let amenities = [];
let responseAmenities=[];
class Amenities extends Component {
    state={
        amenities:[]
    };

    handleAmenitiesFilter(e){
        if(e.target.checked === true)
        {
            amenities.push(e.target.value);
        }
        else
        {
            amenities = amenities.filter(function(cat){
                return cat !== e.target.value;
            });
        }
        responseAmenities['responsedAmenities'] = amenities;
        this.props.receiveAmenitiesFilterResponse(responseAmenities);
    }

    componentDidMount() {
        let sessionAmenities = SessionHelper.GetAmenitiesSession();
        if(sessionAmenities === null){
            axios.get('/sanctum/csrf-cookie').then(response => {
                axios.get('/api/amenities').then(res => {
                    this.setState({amenities:res.data.data});
                    SessionHelper.SetAmenitiesSession(res.data.data);
                }).catch((error)=>{});
            });
        }else{
            this.setState({amenities:sessionAmenities});
        }
    }

    render() {
        return (
            <>
                {
                    this.state.amenities.map((amenity, index) => (
                        <React.Fragment key={index}>
                            <div className="custom-checkbox" key={index}>
                                <input onClick={this.handleAmenitiesFilter.bind(this)} type="checkbox" value={amenity.slug} name="amenity" id={amenity.slug}/>
                                <label htmlFor={amenity.slug}>{amenity.name}</label>
                            </div>
                        </React.Fragment>
                    ))
                }
            </>
        );
    }
}

export default Amenities;