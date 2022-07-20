import React, {Component} from 'react';
import PopularVenuesSlider from "../partials/PopularVenuesSlider";
import axios from "axios";

class PopularVenues extends Component {
    constructor() {
        super();
        this.state={
            venues:[]
        }
    }

    componentDidMount() {
        let filter = [];
        axios.post('/api/venues', filter).then(res => {
            this.setState({venues:res.data.data});
        }).catch((error)=>{});
    }

    render() {
        return (
            <>
                <section className="hotel-area section-bg padding-top-100px padding-bottom-200px overflow-hidden">
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12">
                                <div className="section-heading text-center">
                                    <h2 className="sec__title line-height-55">
                                        Popular Destinations <br/>
                                        You Might Like
                                    </h2>
                                </div>
                            </div>
                        </div>
                        <div className="row padding-top-50px">
                            <div className="col-lg-12">
                                <PopularVenuesSlider venues={this.state.venues}/>
                            </div>
                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default PopularVenues;