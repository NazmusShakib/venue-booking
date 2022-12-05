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
import EventCalendar from "../pages/dashboard/venue/EventCalendar";
import VenueManage from "../pages/dashboard/venue/VenueManage";
import Organization from "../pages/dashboard/venue/organization/Organization";
import VenueOrders from "../pages/dashboard/venue/VenueOrders";
//import {Navigate} from "react-router";
import OrganizationCreate from "../pages/dashboard/venue/organization/OrganizationCreate";
import VenueList from "../pages/dashboard/venue/VenueList";
import VenueCreate from "../pages/dashboard/venue/VenueCreate";
import ListYourVenue from "../pages/ListYourVenue";
import SocialLoginCallback from "../pages/authentication/SocialLoginCallback";
import VenueEdit from "../pages/dashboard/venue/VenueEdit";
import OrganizationEdit from "../pages/dashboard/venue/organization/OrganizationEdit";
import PaymentCallback from "../pages/payment/PaymentCallback";
import NotFound from "../pages/errors/NotFound";
import VenueOwnerRoutes from "../_utility/VenueOwnerRoutes";

class AppRoute extends Component {
    render() {
        return (
            <>
                <BrowserRouter>
                    <Header/>
                    <Routes>
                        <Route path="*" element={<NotFound/>} />
                        <Route path="/" element={<Home />} />
                        <Route path="about-us" element={<AboutUs />} />
                        <Route path="blog" element={<Blog />} />
                        <Route path="contact-us" element={<HelpAndSupport />} />
                        <Route path="faq" element={<Faq />} />
                        <Route path="privacy-policy" element={<PrivacyPolicy />} />
                        <Route path="terms-and-conditions" element={<TermsAndConditions />} />
                        <Route path="venue-listing" element={<ListYourVenue />} />
                        <Route path="payment/callback" element={<PaymentCallback />} />
                        <Route element={<GuestRoutes/>}>
                            <Route path="login" element={<Login />} />
                            <Route path="register" element={<Register />} />
                            <Route path="auth/:provider/callback" element={<SocialLoginCallback />} />
                        </Route>
                        <Route element={<AuthRoutes/>}>
                            <Route path="dashboard" element={<Dashboard />} />
                            <Route path="profile" element={<Profile />} />
                            <Route path="orders" element={<PersonalOrders />} />

                            <Route path="/manage/venue">
                                <Route path="organization/create" element={<OrganizationCreate />} />
                                <Route element={<VenueOwnerRoutes/>}>
                                    <Route index element={<VenueManage />} />
                                    <Route path="organization" element={<Organization />} />
                                    <Route path="organization/:organization_slug/edit" element={<OrganizationEdit />} />
                                    <Route path="list" element={<VenueList />} />
                                    <Route path="create" element={<VenueCreate />} />
                                    <Route path=":venue_slug/edit" element={<VenueEdit />} />
                                    <Route path="orders" element={<VenueOrders />} />
                                    <Route path="calendar" element={<EventCalendar />} />
                                </Route>
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