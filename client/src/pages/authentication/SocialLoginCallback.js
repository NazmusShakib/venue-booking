import React, {useEffect} from 'react';
import {Link, useLocation, useParams} from "react-router-dom";
import axios from "axios";
import SessionHelper from "../../session/SessionHelper";
import {useNavigate} from "react-router";

function SocialLoginCallback(){
    const location = useLocation();
    const params = useParams();
    const navigate = useNavigate();

    useEffect(() => {
        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.post('/api/auth/'+params.provider+'/callback'+location.search).then(res => {
                if(res.data.user)
                {
                    SessionHelper.SetAuthSession(res.data.user);
                    navigate('/dashboard');
                }
            }).catch((error)=>{
                console.log(error);
            });
        });
    }, []);

    return (
        <>
            <section className="faq-area padding-top-100px padding-bottom-60px">
                <div className="container">
                    <div className="row padding-top-60px">
                        <div className="col-sm-6 offset-sm-3 contact-form-action">
                            <div className="form-box">
                                <div className="form-content text-center mb-5 mt-5">
                                    <i className="las la-spin la-spinner la-3x text-info"></i>
                                    <p className="text-info font-weight-bold font-size-20 mt-3">Please wait while we are processing your request..</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </>
    );
}

export default SocialLoginCallback;