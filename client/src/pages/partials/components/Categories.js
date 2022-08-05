import React, {Component} from 'react';
import axios from "axios";
import SessionHelper from "../../../session/SessionHelper";

let cats = [];
let responseCats=[];
class Categories extends Component {
    constructor() {
        super();
        this.state={
            categories:[]
        }
    }

    handleCategoryFilter(e){
        if(e.target.checked === true)
        {
            cats.push(e.target.value);
        }
        else
        {
            cats = cats.filter(function(cat){
                return cat !== e.target.value;
            });

            let reCat = SessionHelper.GetSessionFilterCategory();
            if(reCat.toString() === e.target.value){
                SessionHelper.RemoveFilterSessionItem('categories');
            }
        }
        responseCats['responsedCategories'] = cats;
        this.props.receiveCategoryFilterResponse(responseCats);
    }

    componentDidMount() {
        cats = SessionHelper.GetSessionFilterCategory();
        let sessionCategories = SessionHelper.GetCategoriesSession();
        if(sessionCategories === null){
            axios.get('/sanctum/csrf-cookie').then(response => {
                axios.get('/api/categories').then(res => {
                    this.setState({categories:res.data.data});
                    SessionHelper.SetCategoriesSession(res.data.data);
                }).catch((error)=>{});
            });
        }else{
            this.setState({categories:sessionCategories});
        }
    }

    render() {
        return (
            <>
                {
                    this.state.categories.map((category, index) => (

                        <React.Fragment key={index}>
                            <div className="custom-checkbox">
                                {cats.includes(category.slug) === true &&
                                    <input  onClick={this.handleCategoryFilter.bind(this)} defaultChecked type="checkbox" value={category.slug} name="category" id={category.slug}/>
                                }

                                {cats.includes(category.slug) === false &&
                                    <input  onClick={this.handleCategoryFilter.bind(this)} type="checkbox" value={category.slug} name="category" id={category.slug}/>
                                }

                                <label htmlFor={category.slug}>{category.name}</label>
                            </div>
                        </React.Fragment>
                    ))
                }
            </>
        );
    }
}

export default Categories;