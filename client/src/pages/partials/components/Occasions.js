import React, {Component} from 'react';
import axios from "axios";
import SessionHelper from "../../../session/SessionHelper";

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
            occasions = occasions.filter(function(occasion){
                return occasion !== e.target.value;
            });

            let reOccasion = SessionHelper.GetSessionFilterOccasion();
            if(reOccasion.toString() === e.target.value){
                SessionHelper.RemoveFilterSessionItem('occasions');
            }
        }
        responseOccasions['responsedOccasions'] = occasions;
        this.props.receiveOccasionsFilterResponse(responseOccasions);
    }

    componentDidMount() {
        occasions = SessionHelper.GetSessionFilterOccasion();
        let sessionOccasions = SessionHelper.GetOccasionsSession();
        if(sessionOccasions === null){
            axios.get('/sanctum/csrf-cookie').then(response => {
                axios.get('/api/occasions').then(res => {
                    this.setState({occasions:res.data.data});
                    SessionHelper.SetOccasionsSession(res.data.data);
                }).catch((error)=>{});
            });
        }else{
            this.setState({occasions:sessionOccasions});
        }
    }

    render() {
        return (
            <>
                {
                    this.state.occasions.map((occasion, index) => (
                        <React.Fragment key={index}>
                            <div className="custom-checkbox">
                                {
                                    (occasions.includes(occasion.slug) === true) &&
                                    <input onClick={this.handleOccasionFilter.bind(this)} defaultChecked type="checkbox" value={occasion.slug} name="occasion" id={occasion.slug}/>
                                }
                                {
                                    (occasions.includes(occasion.slug) === false) &&
                                    <input onClick={this.handleOccasionFilter.bind(this)} type="checkbox" value={occasion.slug} name="occasion" id={occasion.slug}/>
                                }

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