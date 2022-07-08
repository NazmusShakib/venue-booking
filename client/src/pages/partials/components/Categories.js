import React, {Component} from 'react';
import axios from "axios";
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
                return cat != e.target.value;
            });
        }
        responseCats['responsedCategories'] = cats;
        this.props.receiveCategoryFilterResponse(responseCats);
    }

    componentDidMount() {
        cats = [];
        axios.get('/api/categories').then(res => {this.setState({categories:res.data.data});}).catch((error)=>{});
    }

    render() {
        return (
            <>
                {
                    this.state.categories.map((category, index) => (

                        <React.Fragment key={index}>
                            <div className="custom-checkbox">
                                <input  onClick={this.handleCategoryFilter.bind(this)} type="checkbox" value={category.slug} name="category" id={category.slug}/>
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