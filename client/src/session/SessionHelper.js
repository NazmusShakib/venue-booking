import React, {Component} from 'react';

class SessionHelper extends Component {
    static SetAuthSession(data){
        sessionStorage.setItem('AuthUser', JSON.stringify(data));
    }

    static GetAuthSession(){
        return JSON.parse(sessionStorage.getItem('AuthUser'));
    }

    static GetAuthUserId(){
        return this.GetAuthSession().user_id;
    }

    static RemoveAuthSession(){
        sessionStorage.removeItem('AuthUser');
    }
}

export default SessionHelper;