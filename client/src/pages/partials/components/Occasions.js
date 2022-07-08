import React, {Component} from 'react';
import axios from "axios";
let occasions = [];
let responseOccasions=[];
class Occasions extends Component {
    state={
        occasions:[]
    };

    handleOccasionFilter(e){
        if(e.target.checked === true)
        {
            occasions.push(e.target.value);
        }
        else
        {
            occasions = occasions.filter(function(cat){
                return cat != e.target.value;
            });
        }
        responseOccasions['responsedOccasions'] = occasions;
        this.props.receiveOccasionsFilterResponse(responseOccasions);
    }

    componentDidMount() {
        axios.get('/api/occasions').then(res => {this.setState({occasions:res.data.data});}).catch((error)=>{});
    }

    render() {
        return (
            <>
                {
                    this.state.occasions.map((occasion, index) => (
                        <React.Fragment key={index}>
                            <div className="custom-checkbox">
                                <input onClick={this.handleOccasionFilter.bind(this)} type="checkbox" value={occasion.slug} name="occasion" id={occasion.slug}/>
                                <label htmlFor={occasion.slug}>{occasion.name}</label>
                            </div>
                        </React.Fragment>
                    ))
                }
            </>
        );
    }
}

export default Occasions;