import React, {Component} from 'react';
import Sidebar from "./Sidebar";
import EventCalendar from "./partials/EventCalendar";
import Orders from "./partials/Orders";
class Dashboard extends Component {



    render() {
        return (
            <>
                <section>
                    <div className="container-fluid padding-right-100px padding-left-100px padding-top-50px padding-bottom-50px">
                        <div className="row">
                            <Sidebar/>
                            <div className="col-lg-10">
                                {/*<EventCalendar/>*/}
                                <Orders/>
                            </div>
                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default Dashboard;

