import React, {useEffect} from 'react';
import {Link, useLocation} from "react-router-dom";
import queryString from 'query-string';

function PaymentCallback(){
    const {search} = useLocation();
    const {status, message} = queryString.parse(search);

    useEffect(() => {
        window.scrollTo(0, 0);
    }, []);

    return (
        <>
            <section className="faq-area padding-top-100px padding-bottom-60px">
                <div className="container">
                    <div className="row padding-top-60px">
                        <div className="col-sm-8 offset-sm-2 contact-form-action">
                            <div className="form-box">
                                <div className="form-content text-center mb-5 mt-5">
                                    {parseInt(status) === 200 ?(
                                        <i className="las la-check-circle la-8x text-success"></i>
                                    ):(
                                        <i className="las la-exclamation-circle text-danger la-8x"></i>
                                    )}
                                    <p className={parseInt(status) === 200 ? 'text-success font-weight-bold font-size-30 mt-4 mb-4' : 'text-danger font-weight-bold font-size-30 mt-3'}>{message}</p>
                                    <div className="col-lg-12 flex-direction-column text-center mt-5">
                                        <p>
                                            <Link className="line-height-40 theme-btn theme-btn-transparent mr-3" to='/'><i className="las la-home font-size-20 align-self-start mr-1"></i>Home</Link>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </>
    );
}

export default PaymentCallback;