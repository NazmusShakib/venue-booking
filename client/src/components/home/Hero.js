import React, {Component} from 'react';
import SearchForm from "../common/SearchForm";

class Hero extends Component {

    render() {
        return (
            <>
                <section className="hero-wrapper hero-wrapper2">
                    <div className="hero-box pb-0">
                        <div id="fullscreen-slide-contain">
                            <ul className="slides-container">
                                <li><img src="assets/images/hero-bg2.jpg" alt=""/></li>
                                <li><img src="assets/images/hero--bg2.jpg" alt=""/></li>
                                <li><img src="assets/images/hero--bg3.jpg" alt=""/></li>
                            </ul>
                        </div>
                        <div className="container">
                            <div className="row">
                                <div className="col-lg-12">
                                    <div className="hero-content pb-5">
                                        <div className="section-heading">
                                            <p className="sec__desc pb-2">Hotel stays, Dream getaways</p>
                                            <h2 className="sec__title">
                                                Find the Perfect Plase to Accomplishe your Dreams <br/>
                                                WE ARE YOUR ONLINE EVENT PLANNER
                                            </h2>
                                        </div>
                                    </div>
                                    <SearchForm/>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default Hero;