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
        return (this.GetFilterSession() !== null && this.GetFilterSession().city !== undefined && this.GetFilterSession().city !== null) ? this.GetFilterSession().city : [];
    }

    static GetSessionFilterCategory(){
        return (this.GetFilterSession() !== null && this.GetFilterSession().category !== undefined && this.GetFilterSession().category !== null) ? this.GetFilterSession().category : [];
    }

    static GetSessionFilterOccasion(){
        return (this.GetFilterSession() !== null && this.GetFilterSession().occasion !== undefined && this.GetFilterSession().occasion !== null) ? this.GetFilterSession().occasion : [];
    }

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
}

export default SessionHelper;