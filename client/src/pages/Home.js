import React, {Component} from 'react';
import Subscribe from "../components/partials/Subscribe";
import Hero from "../components/home/Hero";
import StartInfo from "../components/home/StartInfo";
import PopularVenues from "../components/home/PopularVenues";
import DiscountBanner from "../components/partials/DiscountBanner";
import TopVisitedPlaces from "../components/home/TopVisitedPlaces";
import Testimonial from "../components/partials/Testimonial";
import IntroduceBanner from "../components/home/IntroduceBanner";
//import LatestBlog from "../components/partials/LatestBlog";
class Home extends Component {
    componentDidMount() {
        window.scrollTo(0, 0);
    }

    render() {
        return (
            <>
                <Hero/>
                <StartInfo/>
                <PopularVenues/>
                <DiscountBanner/>
                <TopVisitedPlaces/>
                <IntroduceBanner/>
                {/*<LatestBlog/>*/}
                <Testimonial/>
                <Subscribe/>
            </>
        );
    }
}

export default Home;