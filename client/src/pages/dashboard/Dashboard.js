import React, {Component} from 'react';
import Sidebar from "./Sidebar";
import EventCalendar from "./partials/EventCalendar";
import Orders from "./partials/Orders";
import SessionHelper from "../../session/SessionHelper";
class Dashboard extends Component {
    render() {
        return (
            <>
                <section>
                    <div className="container-fluid padding-right-100px padding-left-100px padding-top-50px padding-bottom-50px">
                        <div className="row">
                            <Sidebar/>
                            <div className="col-lg-10">
                                {SessionHelper.GetAuthSession().type === 1 && (<EventCalendar/>)}
                                {SessionHelper.GetAuthSession().type === 0 && (<Orders/>)}
                            </div>
                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default Dashboard;