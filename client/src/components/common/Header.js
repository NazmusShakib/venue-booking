import React, {Component} from 'react';
import {Link} from "react-router-dom";

class Header extends Component {
    render() {
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
                                                    <a href="#"
                                                    ><i className="la la-phone mr-1"></i>(123) 123-456</a
                                                    >
                                                </li>
                                                <li>
                                                    <a href="#"
                                                    ><i className="la la-envelope mr-1"></i
                                                    >trizen@example.com</a
                                                    >
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-6">
                                    <div className="header-top-content">
                                        <div className="header-right-action text-right">
                                            <a
                                                href="#"
                                                className="theme-btn theme-btn-small theme-btn-transparent mr-1"
                                                data-toggle="modal"
                                                data-target="#signupPopupForm"
                                            >Sign Up</a
                                            >
                                            <a
                                                href="#"
                                                className="theme-btn theme-btn-small"
                                                data-toggle="modal"
                                                data-target="#loginPopupForm"
                                            >Login</a
                                            >
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
                                        <a href="#" className="down-button"
                                        ><i className="la la-angle-down"></i
                                        ></a>
                                        <div className="logo">
                                            <Link to="/"><img src="assets/images/logo.png" alt="logo" style={{'maxWidth': '130px'}}/></Link>
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
                                                    <li><Link to="resorts">Resorts</Link> </li>
                                                    <li><Link to="hotels">Hotels</Link> </li>
                                                    <li><Link to="destination-weeding">Destination Weeding</Link></li>
                                                </ul>
                                            </nav>
                                        </div>
                                        <div className="nav-btn">
                  <span className="theme-btn"
                  ><i className="la la-phone mr-1"></i> +8801685562958</span
                  >
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
}

export default Header;