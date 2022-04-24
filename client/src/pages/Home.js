import React, {Component} from 'react';
import Subscribe from "../components/partials/Subscribe";
import Hero from "../components/home/Hero";
import HomePageScripts from "../components/home/HomePageScripts";
import StartInfo from "../components/home/StartInfo";
import PopularHotels from "../components/home/PopularHotels";
import DiscountBanner from "../components/partials/DiscountBanner";
import TopVisitedPlaces from "../components/home/TopVisitedPlaces";
import Testimonial from "../components/partials/Testimonial";
import IntroduceBanner from "../components/home/IntroduceBanner";
import LatestBlog from "../components/partials/LatestBlog";
class Home extends Component {
    render() {
        return (
            <>
                <HomePageScripts/>
                <Hero/>
                <StartInfo/>
                <PopularHotels/>
                <DiscountBanner/>
                <TopVisitedPlaces/>
                <Testimonial/>
                <IntroduceBanner/>
                <LatestBlog/>
                <Subscribe/>
            </>
        );
    }
}

export default Home;