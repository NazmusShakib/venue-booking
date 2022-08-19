import React, {Component} from 'react';
import {Routes, Route, BrowserRouter} from "react-router-dom";
import Home from "../pages/Home";
import AboutUs from "../pages/AboutUs";
import Header from "../components/common/Header";
import Footer from "../components/common/Footer";
import Venues from "../pages/Venue/Venues";
import Blog from "../pages/Blog";
import HelpAndSupport from "../pages/HelpAndSupport";
import Faq from "../pages/Faq";
import PrivacyPolicy from "../pages/PrivacyPolicy";
import TermsAndConditions from "../pages/TermsAndConditions";
import Login from "../pages/authentication/Login";
import Register from "../pages/authentication/Register";
import Dashboard from "../pages/dashboard/Dashboard";
import Profile from "../pages/dashboard/Profile";
import AuthRoutes from "../_utility/AuthRoutes";
import GuestRoutes from "../_utility/GuestRoutes";
import VenueDetails from "../pages/Venue/VenueDetails";
import VenueBooking from "../pages/Venue/VenueBooking";
import PersonalOrders from "../pages/dashboard/PersonalOrders";
import EventCalendar from "../pages/dashboard/property/EventCalendar";
import PropertyManage from "../pages/dashboard/property/PropertyManage";
import Organization from "../pages/dashboard/property/organization/Organization";
import PropertyOrders from "../pages/dashboard/property/PropertyOrders";
import {Navigate} from "react-router";
import OrganizationCreate from "../pages/dashboard/property/organization/OrganizationCreate";
import PropertyList from "../pages/dashboard/property/PropertyList";
import PropertyCreate from "../pages/dashboard/property/PropertyCreate";
import ListYourProperty from "../pages/ListYourProperty";

class AppRoute extends Component {
    render() {
        return (
            <>
                <BrowserRouter>
                    <Header/>
                    <Routes>
                        <Route path="/" element={<Home />} />
                        <Route path="about-us" element={<AboutUs />} />
                        <Route path="blog" element={<Blog />} />
                        <Route path="contact-us" element={<HelpAndSupport />} />
                        <Route path="faq" element={<Faq />} />
                        <Route path="privacy-policy" element={<PrivacyPolicy />} />
                        <Route path="terms-and-conditions" element={<TermsAndConditions />} />
                        <Route path="property-listing" element={<ListYourProperty />} />
                        <Route element={<GuestRoutes/>}>
                            <Route path="login" element={<Login />} />
                            <Route path="register" element={<Register />} />
                        </Route>
                        <Route element={<AuthRoutes/>}>
                            <Route path="dashboard" element={<Dashboard />} />
                            <Route path="profile" element={<Profile />} />
                            <Route path="orders" element={<PersonalOrders />} />

                            <Route path="/manage/property" element={<PropertyManage />} />
                            <Route path="/manage/property/list" element={<PropertyList />} />
                            <Route path="/manage/property/create" element={<PropertyCreate />} />
                            <Route path="/manage/property/calendar" element={<EventCalendar />} />
                            <Route path="/property">
                                <Route index element={ <Navigate to="/manage/property" /> }/>
                                <Route path="organization" element={<Organization />} />
                                <Route path="organization/create" element={<OrganizationCreate />} />
                                <Route path="orders" element={<PropertyOrders />} />
                            </Route>
                        </Route>

                        <Route path="/venues">
                            <Route index element={<Venues />} />
                            <Route path=":category" element={<Venues />} />
                        </Route>
                        <Route path="/venue/details/:venue_slug" element={<VenueDetails />} />
                        <Route path="/venue/booking/:venue_slug" element={<VenueBooking />} />

                    </Routes>
                    <Footer/>
                </BrowserRouter>
            </>
        );
    }
}

export default AppRoute;