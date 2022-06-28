import React from 'react';
import {Link} from "react-router-dom";
import {useLocation} from "react-router";

const Sidebar = () => {
    const location = useLocation();
    const { pathname } = location;
    const splitLocation = pathname.split("/");

    return (
        <>
            <div className="col-lg-2">
                <nav id="sidebarMenu" className="collapse d-lg-block sidebar collapse bg-white" style={{'padding':0}}>
                    <div className="position-sticky">
                        <div className="list-group list-group-flush mx-3 mt-4 mb-4">
                            <Link to="/dashboard" className={splitLocation[1] === "dashboard" ? "list-group-item list-group-item-action py-2 ripple active" : "list-group-item list-group-item-action py-2 ripple"}>
                                <i className="las la-tachometer-alt font-size-18 mr-2"></i><span>Dashboard</span>
                            </Link>
                            <Link to="/profile" className={splitLocation[1] === "profile" ? "list-group-item list-group-item-action py-2 ripple active" : "list-group-item list-group-item-action py-2 ripple"}>
                                <i className="las la-user font-size-18 mr-2"></i><span>Profile</span>
                            </Link>
                        </div>
                    </div>
                </nav>
            </div>
        </>
    );
}

export default Sidebar;