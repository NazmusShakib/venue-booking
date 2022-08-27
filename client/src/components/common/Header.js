import React from 'react';
import {Link} from "react-router-dom";
import SessionHelper from "../../session/SessionHelper";
import {useNavigate} from "react-router";
import axios from "axios";



const Header = () => {
    const navigate = useNavigate();
    const handleLogout = (e) =>{
        e.preventDefault();
        axios.post('/api/logout').then(res => {
            if (res.data.status === 200)
            {
                SessionHelper.RemoveAuthSession();
                navigate('/');
            }
            else
            {
                console.log('Sorry! something went wrong.');
            }
        }).catch((error)=>{console.log('Sorry! something went wrong.')});
    }

    return (
        <>
            <header className="header-area">
                <div className="header-top-bar padding-right-100px padding-left-100px">
                    <div className="container-fluid">
                        <div className="row align-items-center">
                            <div className="col-lg-6">
                                <div className="header-top-content">
                                    <div className="header-left">
                                        <ul className="list-items">
                                            <li>
                                                <a href="#"><i className="la la-phone mr-1"></i>(123) 123-456</a>
                                            </li>
                                            <li>
                                                <a href="#"><i className="la la-envelope mr-1"></i>trizen@example.com</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div className="col-lg-6">
                                <div className="header-top-content">
                                    <div className="header-right-action text-right">
                                        {SessionHelper.GetAuthSession() !== null ? (
                                            <>
                                                <Link to="/dashboard" className="theme-btn theme-btn-small theme-btn-transparent mr-1">Dashboard</Link>
                                                <Link className="theme-btn theme-btn-small theme-btn-transparent" to="" onClick={handleLogout}>
                                                    <i className="fas fa-sign-out-alt"></i> Logout
                                                </Link>
                                            </>
                                        ) : (
                                            <>
                                                <Link to="/register" className="theme-btn theme-btn-small theme-btn-transparent mr-1">Register</Link>
                                                <Link to="/login" className="theme-btn theme-btn-small">Login</Link>
                                            </>
                                        )}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="header-menu-wrapper padding-right-100px padding-left-100px">
                    <div className="container-fluid">
                        <div className="row">
                            <div className="col-lg-12">
                                <div className="menu-wrapper justify-content-between">
                                    <a href="#" className="down-button"><i className="la la-angle-down"></i></a>
                                    <div className="logo">
                                        <Link to="/"><img src={`${process.env.REACT_APP_CLIENT_DOMAIN}/assets/images/logo.png`} alt="logo" style={{'maxWidth': '130px'}}/></Link>
                                        <div className="menu-toggler">
                                            <i className="la la-bars"></i>
                                            <i className="la la-times"></i>
                                        </div>
                                    </div>
                                    <div className="main-menu-content pr-0 ml-0">
                                        <nav>
                                            <ul>
                                                <li>
                                                    <Link to="/">Home</Link>
                                                </li>
                                                <li><Link to="venues">Venues</Link> </li>
                                                <li><Link to="venues/resorts">Resorts</Link> </li>
                                                <li><Link to="venues/hotels">Hotels</Link> </li>
                                                <li><Link to="venues/destination-weeding">Destination Weeding</Link></li>
                                            </ul>
                                        </nav>
                                    </div>
                                    <div className="pull-right">
                                        <Link to="/venue-listing" className="theme-btn theme-btn-small"><i className="las la-list-alt"></i> List Your Venue</Link>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
        </>
    );
}

export default Header;