import React, {Component} from 'react';
import axios from "axios";
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
                return cat != e.target.value;
            });
        }
        responseAmenities['responsedAmenities'] = amenities;
        this.props.receiveAmenitiesFilterResponse(responseAmenities);
    }

    componentDidMount() {
        axios.get('/api/amenities').then(res => {this.setState({amenities:res.data.data});}).catch((error)=>{});
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