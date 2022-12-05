import React, {Component} from 'react';

class SessionHelper extends Component {
    static SetAuthSession(data){
        localStorage.setItem('AuthUser', JSON.stringify(data));
    }

    static SetAuthUserType(type){
        let data = this.GetAuthSession();
        data.type = type;
        this.SetAuthSession(data);
    }

    static GetAuthSession(){
        return JSON.parse(localStorage.getItem('AuthUser'));
    }

    static GetAuthUserId(){
        return this.GetAuthSession() !== null ? this.GetAuthSession().user_id : '';
    }

    static RemoveAuthSession(){
        localStorage.removeItem('AuthUser');
    }

    //Need to minimize those sessions
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
        return (this.GetFilterSession() !== null && this.GetFilterSession().city !== undefined && this.GetFilterSession().city !== null) ? this.GetFilterSession().city : [];
    }

    static GetSessionFilterCategory(){
        return (this.GetFilterSession() !== null && this.GetFilterSession().category !== undefined && this.GetFilterSession().category !== null) ? this.GetFilterSession().category : [];
    }

    static GetSessionFilterOccasion(){
        return (this.GetFilterSession() !== null && this.GetFilterSession().occasion !== undefined && this.GetFilterSession().occasion !== null) ? this.GetFilterSession().occasion : [];
    }
    //Need to minimize those sessions

    static SetCityListForDropdownSession(data){
        sessionStorage.setItem('city_lists_for_dropdown', JSON.stringify(data));
    }

    static GetCityListForDropdownSession(){
        return JSON.parse(sessionStorage.getItem('city_lists_for_dropdown'));
    }

    static SetCategoryListForDropdownSession(data){
        sessionStorage.setItem('category_lists_for_dropdown', JSON.stringify(data));
    }

    static GetCategoryListForDropdownSession(){
        return JSON.parse(sessionStorage.getItem('category_lists_for_dropdown'));
    }

    static SetOccasionListForDropdownSession(data){
        sessionStorage.setItem('occasion_lists_for_dropdown', JSON.stringify(data));
    }

    static GetOccasionListForDropdownSession(){
        return JSON.parse(sessionStorage.getItem('occasion_lists_for_dropdown'));
    }

    static SetCitiesSession(data){
        sessionStorage.setItem('cities', JSON.stringify(data));
    }

    static GetCitiesSession(){
        return JSON.parse(sessionStorage.getItem('cities'));
    }

    static SetCategoriesSession(data){
        sessionStorage.setItem('categories', JSON.stringify(data));
    }

    static GetCategoriesSession(){
        return JSON.parse(sessionStorage.getItem('categories'));
    }

    static SetAmenitiesSession(data){
        sessionStorage.setItem('amenities', JSON.stringify(data));
    }

    static GetAmenitiesSession(){
        return JSON.parse(sessionStorage.getItem('amenities'));
    }

    static SetOccasionsSession(data){
        sessionStorage.setItem('occasions', JSON.stringify(data));
    }

    static GetOccasionsSession(){
        return JSON.parse(sessionStorage.getItem('occasions'));
    }

    static SetPopularVenuesSession(data){
        sessionStorage.setItem('popular_venues', JSON.stringify(data));
    }

    static GetPopularVenuesSession(){
        return JSON.parse(sessionStorage.getItem('popular_venues'));
    }

    static SetTopVisitedVenuesSession(data){
        sessionStorage.setItem('top_visited_venues', JSON.stringify(data));
    }

    static GetTopVisitedVenuesSession(){
        return JSON.parse(sessionStorage.getItem('top_visited_venues'));
    }

    static SetTestmonialsSession(data){
        sessionStorage.setItem('testmonials', JSON.stringify(data));
    }

    static GetTestmonialsSession(){
        return JSON.parse(sessionStorage.getItem('testmonials'));
    }
}

export default SessionHelper;