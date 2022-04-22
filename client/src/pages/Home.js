import React, {Component} from 'react';
import Header from "../components/common/Header";
import Footer from "../components/common/Footer";
import Subscribe from "../components/common/Subscribe";
import Hero from "../components/home/Hero";
import HomePageScripts from "../components/home/HomePageScripts";
import StartInfo from "../components/home/StartInfo";
import PopularHotels from "../components/home/PopularHotels";
import DiscountBanner from "../components/common/DiscountBanner";
import TopVisitedPlaces from "../components/home/TopVisitedPlaces";
import Testimonial from "../components/common/Testimonial";
import IntroduceBanner from "../components/home/IntroduceBanner";
import LatestBlog from "../components/common/LatestBlog";
class Home extends Component {
    render() {
        return (
            <>
                <HomePageScripts/>
                <Header/>
                <Hero/>
                <StartInfo/>
                <PopularHotels/>
                <DiscountBanner/>
                <TopVisitedPlaces/>
                <Testimonial/>
                <IntroduceBanner/>
                <LatestBlog/>
                <Subscribe/>
                <Footer/>
            </>
        );
    }
}

export default Home;