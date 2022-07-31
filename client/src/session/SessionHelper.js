import React, {Component} from 'react';

class SessionHelper extends Component {
    static SetAuthSession(data){
        sessionStorage.setItem('AuthUser', JSON.stringify(data));
    }

    static GetAuthSession(){
        return JSON.parse(sessionStorage.getItem('AuthUser'));
    }

    static GetAuthUserId(){
        return this.GetAuthSession() !== null ? this.GetAuthSession().user_id : '';
    }

    static RemoveAuthSession(){
        sessionStorage.removeItem('AuthUser');
    }

    static SetFilterSession(data){
        sessionStorage.setItem('filter', JSON.stringify(data));
    }

    static GetFilterSession(){
        return JSON.parse(sessionStorage.getItem('filter'));
    }

    static RemoveFilterSessionItem(key){
        let filter = {};
        if(key === 'cities')
        {
            filter = {
                'occasion' : (SessionHelper.GetFilterSession() !== '' || SessionHelper.GetFilterSession() !== null) ? SessionHelper.GetFilterSession().occasion : [],
                'category' : (SessionHelper.GetFilterSession() !== '' || SessionHelper.GetFilterSession() !== null) ? SessionHelper.GetFilterSession().category : [],
                'city' : []
            };
        }

        if(key === 'categories')
        {
            filter = {
                'occasion' : (SessionHelper.GetFilterSession() !== '' || SessionHelper.GetFilterSession() !== null) ? SessionHelper.GetFilterSession().occasion : [],
                'city' : (SessionHelper.GetFilterSession() !== '' || SessionHelper.GetFilterSession() !== null) ? SessionHelper.GetFilterSession().city : [],
                'category' : []
            };
        }

        if(key === 'occasions')
        {
            filter = {
                'category' : (SessionHelper.GetFilterSession() !== '' || SessionHelper.GetFilterSession() !== null) ? SessionHelper.GetFilterSession().category : [],
                'city' : (SessionHelper.GetFilterSession() !== '' || SessionHelper.GetFilterSession() !== null) ? SessionHelper.GetFilterSession().city : [],
                'occasion' : []
            };
        }

        this.SetFilterSession(filter);
    }

    static GetSessionFilterCity(){
        return (this.GetFilterSession().city !== undefined && this.GetFilterSession().city !== null) ? this.GetFilterSession().city : [];
    }

    static GetSessionFilterCategory(){
        return (this.GetFilterSession().category !== undefined && this.GetFilterSession().category !== null) ? this.GetFilterSession().category : [];
    }

    static GetSessionFilterOccasion(){
        return (this.GetFilterSession().occasion !== undefined && this.GetFilterSession().occasion !== null) ? this.GetFilterSession().occasion : [];
    }
}

export default SessionHelper;