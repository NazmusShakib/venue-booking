import React, {Component} from 'react';
import PopularHotelsSlider from "../common/PopularHotelsSlider";

class PopularHotels extends Component {
    render() {
        return (
            <>
                <section className="hotel-area section-bg padding-top-100px padding-bottom-200px overflow-hidden">
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12">
                                <div className="section-heading text-center">
                                    <h2 className="sec__title line-height-55">
                                        Popular Hotel Destinations <br/>
                                        You Might Like
                                    </h2>
                                </div>
                            </div>
                        </div>
                        <div className="row padding-top-50px">
                            <div className="col-lg-12">
                                <PopularHotelsSlider/>
                            </div>
                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default PopularHotels;