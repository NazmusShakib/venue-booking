import React, {Component} from 'react';
import {Routes, Route, BrowserRouter} from "react-router-dom";
import Home from "../pages/Home";
import AboutUs from "../pages/AboutUs";
import Header from "../components/common/Header";
import Footer from "../components/common/Footer";
import Hotels from "../pages/Hotels";
import Resorts from "../pages/Resorts";
import Venues from "../pages/Venues";
import Blog from "../pages/Blog";
import HelpAndSupport from "../pages/HelpAndSupport";
import Faq from "../pages/Faq";
import PrivacyPolicy from "../pages/PrivacyPolicy";
import TermsAndConditions from "../pages/TermsAndConditions";
import DestinationWeeding from "../pages/DestinationWeeding";
import Login from "../pages/auths/Login";
import Register from "../pages/auths/Register";

class AppRoute extends Component {
    render() {
        return (
            <>
                <BrowserRouter>
                    <Header/>
                    <Routes>
                        <Route path="/" element={<Home />} />
                        <Route path="about-us" element={<AboutUs />} />
                        <Route path="hotels" element={<Hotels />} />
                        <Route path="resorts" element={<Resorts />} />
                        <Route path="venues" element={<Venues />} />
                        <Route path="destination-weeding" element={<DestinationWeeding />} />
                        <Route path="login" element={<Login />} />
                        <Route path="register" element={<Register />} />
                        <Route path="blog" element={<Blog />} />
                        <Route path="contact-us" element={<HelpAndSupport />} />
                        <Route path="faq" element={<Faq />} />
                        <Route path="privacy-policy" element={<PrivacyPolicy />} />
                        <Route path="terms-and-conditions" element={<TermsAndConditions />} />
                    </Routes>
                    <Footer/>
                </BrowserRouter>
            </>
        );
    }
}

export default AppRoute;