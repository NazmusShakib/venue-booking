import React, {Component} from 'react';
import Sidebar from "./Sidebar";

class Profile extends Component {
    render() {
        return (
            <>
                <section className="card-area">
                    <div className="header-menu-wrapper padding-left-100px padding-right-100px padding-top-50px padding-bottom-50px">
                        <div className="container-fluid">
                            <div className="row">
                                <Sidebar/>
                                <div className="col-lg-10">

                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default Profile;