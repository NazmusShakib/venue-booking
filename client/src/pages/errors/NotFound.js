import React, {Component} from 'react';
import {Link} from "react-router-dom";

class NotFound extends Component {
    render() {
        return (
            <>
                <section className="faq-area padding-top-100px padding-bottom-60px">
                    <div className="container">
                        <div className="row">
                            <div className="col-sm-12 text-center">
                                <img src={`${process.env.REACT_APP_CLIENT_DOMAIN}/assets/images/errors/404.png`} alt="404 not found" style={{'maxWidth': '600px'}}/>
                                <div className="col-lg-12 flex-direction-column text-center mt-5">
                                    <p>
                                        <Link className="btn btn-primary btn-lg" to='/'><i className="las la-home font-size-20 align-self-start mr-1"></i> Go To Homepage</Link>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default NotFound;