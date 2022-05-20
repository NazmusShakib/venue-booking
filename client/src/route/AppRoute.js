import React, {Component} from 'react';
import {Routes, Route, BrowserRouter} from "react-router-dom";
import Home from "../pages/Home";
import AboutUs from "../pages/AboutUs";
import Header from "../components/common/Header";
import Footer from "../components/common/Footer";
import Hotels from "../pages/Hotels";
import Resorts from "../pages/Resorts";
import Venues from "../pages/Venues";

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
                    </Routes>
                    <Footer/>
                </BrowserRouter>
            </>
        );
    }
}

export default AppRoute;