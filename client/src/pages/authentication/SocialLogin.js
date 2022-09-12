import React, {useState, useEffect} from 'react';
import axios from "axios";

function SocialLogin() {
    const [googleLoginUrl, setGoogleLoginUrl] = useState(null);
    const [facebookLoginUrl, setFacebookLoginUrl] = useState(null);
    const [instagramLoginUrl, setInstagramLoginUrl] = useState(null);

    useEffect(() => {
        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.post('/api/auth/facebook').then(res => {
                setFacebookLoginUrl(res.data.url);
            }).catch((error)=>{
                console.log(error);
            });

            axios.post('/api/auth/instagram').then(res => {
                setInstagramLoginUrl(res.data.url);
            }).catch((error)=>{
                console.log(error);
            });

            axios.post('/api/auth/google').then(res => {
                setGoogleLoginUrl(res.data.url);
            }).catch((error)=>{
                console.log(error);
            });
        });
    }, []);

    return (
    <div className="action-box text-center">
        <p className="font-size-14 mb-2">Or</p>
        {facebookLoginUrl !== null && (
            <a href={facebookLoginUrl} className="btn-primary btn m-2 text-white" title="Continue with facebook"> <i className="lab la-facebook-f font-size-20"></i> Facebook</a>
        )}

        {instagramLoginUrl !== null && (
            <a href={instagramLoginUrl} className="btn btn-warning text-white m-2" title="Continue with google"> <i className="lab la-instagram  font-size-20"></i> Instagram</a>
        )}

        {googleLoginUrl !== null && (
            <a href={googleLoginUrl} className="btn btn-danger text-white m-2" title="Continue with google"> <i className="lab la-google-plus  font-size-20"></i> Google</a>
        )}
    </div>
    );
}

export default SocialLogin;