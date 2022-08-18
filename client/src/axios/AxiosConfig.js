import axios from "axios";
import SessionHelper from "../session/SessionHelper";

axios.defaults.baseURL = process.env.REACT_APP_API_DOMAIN;
axios.defaults.headers.post['Accept'] = 'application/json';
axios.defaults.headers.post['Content-Type'] = 'application/json';
axios.defaults.withCredentials = true;
axios.interceptors.request.use(function (config) {
    const token = (SessionHelper.GetAuthSession() !== null) ? SessionHelper.GetAuthSession().token : '';
    config.headers.Authorization = token ? `Bearer ${token}` : '';
    return config;
});
axios.interceptors.response.use(response => response, error =>{
    if (error.response.status === 401){
        SessionHelper.RemoveAuthSession();
        return Promise.reject();
    }
    return Promise.reject(error);
});