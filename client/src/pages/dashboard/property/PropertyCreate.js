import React, {Component} from 'react';
import {Link} from "react-router-dom";
import SessionHelper from "../../../session/SessionHelper";
import axios from "axios";
import {toast} from "react-toastify";
import Select from "react-select";
import ImageUploading from 'react-images-uploading';
import ReactQuill from 'react-quill';
import 'react-quill/dist/quill.snow.css';
import QuillEditorToolbar, { modules, formats } from "../../../_utility/QuillEditorToolbar";

class PropertyCreate extends Component {
    constructor() {
        super();
        this.state = {
            processing:false,
            message:'',
            errors:[],
            organizationLists:[],
            categoryLists:[],
            occasionLists:[],
            amenityLists:[],
            organization_id:'',
            categories_id:[],
            occasions_id:[],
            amenities_id:[],
            featured_image:[],
            property_images:[],
            divisionLists:[],
            division_id:'',
            districtLists:[],
            district_id:'',
            cityLists:[],
            city_id:'',
            selected_district_option:'',
            selected_city_option:'',
            description:''
        }
    }

    componentDidMount() {
        let data = {
            'user_id' : SessionHelper.GetAuthUserId(),
            'value_field_as':'id',
        };
        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.post('/api/organizations/lists/for/dropdown', data).then(res => {
                this.setState({organizationLists:res.data.organizations});
            }).catch((error)=>{});

            axios.post('/api/category/lists/for/dropdown', data).then(res => {
                this.setState({categoryLists:res.data.categories});
            }).catch((error)=>{});

            axios.post('/api/occasion/lists/for/dropdown', data).then(res => {
                this.setState({occasionLists:res.data.occasions});
            }).catch((error)=>{});

            axios.post('/api/amenity/lists/for/dropdown', data).then(res => {
                this.setState({amenityLists:res.data.amenities});
            }).catch((error)=>{});

            axios.post('/api/division/lists/for/dropdown', data).then(res => {
                this.setState({divisionLists:res.data.divisions});
            }).catch((error)=>{});
        });

    }

    featuredImagesOnChange = (imageList, addUpdateIndex) => {
        // data for submit
        //console.log(imageList, addUpdateIndex);
        this.setState({featured_image:imageList});
    };

    propertyImagesOnChange = (imageList, addUpdateIndex) => {
        // data for submit
        console.log(imageList, addUpdateIndex);
        this.setState({property_images:imageList});
    };

    handleInput = (e) =>{
        e.persist();
        this.setState({[e.target.name] : e.target.value});
        console.log(e.target.value);
    }

    handleOrganizationSelect = (selectedOption) =>{
        this.setState({organization_id : selectedOption.value});
        console.log(selectedOption.value);
    }

    handleCategorySelect = (selectedOption) =>{
        let categories = Array.from(selectedOption, option => option.value);
        this.setState({categories_id : categories});
        console.log(categories);
    }

    handleOccasionSelect = (selectedOption) =>{
        let occasions = Array.from(selectedOption, option => option.value);
        this.setState({occasions_id : occasions});
        console.log(occasions);
    }

    handleAmenitySelect = (selectedOption) =>{
        let amenities = Array.from(selectedOption, option => option.value);
        this.setState({amenities_id : amenities});
        console.log(amenities);
    }

    handleDivisionSelect = (selectedOption) =>{
        let data = {'value_field_as':'id', 'confirm_parent_division':'Yes', 'division_id':selectedOption.value}
        this.setState({selected_district_option : ''});
        this.setState({selected_city_option : ''});
        this.setState({districtLists : []});
        this.setState({cityLists : []});
        axios.post('/api/district/lists/for/dropdown', data).then(res => {
            this.setState({division_id : selectedOption.value});
            this.setState({districtLists:res.data.districts});
        }).catch((error)=>{});
    }

    handleDistrictSelect = (selectedOption) =>{
        let data = {'value_field_as':'id', 'confirm_parent_district':'Yes', 'district_id':selectedOption.value}
        this.setState({selected_district_option : selectedOption});
        this.setState({selected_city_option : ''});
        this.setState({cityLists : []});
        axios.post('/api/city/lists/for/dropdown', data).then(res => {
            this.setState({district_id : selectedOption.value});
            this.setState({cityLists:res.data.cities});
        }).catch((error)=>{});
    }

    handleCitySelect = (selectedOption) =>{
        this.setState({selected_city_option : selectedOption});
        this.setState({city_id : selectedOption.value});
    }

    setDescription = (description) =>{
        this.setState({description : description});
        console.log(description);
    }

    formSubmit = (e) =>{
        e.preventDefault();
        let data ={}

    }

    render() {
        return (
            <>
                <section>
                    <div className="container padding-top-70px padding-bottom-100px">
                        <div className="row">
                            <div className="col-sm-12 mb-5" style={{'display': 'flex', 'justifyContent': 'space-between', 'alignItems': 'center'}}>
                                <div>
                                    <h1 className="text-black mb-1">Property</h1>
                                    <p>Add New Property</p>
                                </div>
                                <div>
                                    <nav aria-label="breadcrumb">
                                        <ol className="breadcrumb custom-breadcrumb">
                                            <li className="breadcrumb-item"><Link to='/dashboard'>Dashboard</Link></li>
                                            <li className="breadcrumb-item"><Link to='/manage/property'>Manage Property</Link></li>
                                            <li className="breadcrumb-item"><Link to='/manage/property/list'>Property</Link></li>
                                            <li className="breadcrumb-item active">Create</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                            <div className="col-sm-12">
                                <div className="form-box">
                                    <div className="form-title-wrap">
                                        <h3 className="title"><i className="la la-building mr-2 text-gray"></i>Property Information</h3>
                                    </div>
                                    <div className="form-content contact-form-action">
                                        <form className="row" onSubmit={this.formSubmit}>
                                            {this.state.message !== '' ? (
                                                <>
                                                    <div className="form-group col-lg-12 text-center">
                                                        <div className="alert alert-danger" role="alert">{this.state.message}</div>
                                                    </div>
                                                </>
                                            ) : (
                                                <></>
                                            )}

                                            <div className="col-lg-12 responsive-column">
                                                <div className="input-box">
                                                    <div className="form-group mt-3 mb-4">
                                                        <ImageUploading
                                                            multiple={false}
                                                            value={this.state.featured_image}
                                                            onChange={this.featuredImagesOnChange.bind(this)}
                                                            maxNumber={1}
                                                            dataURLKey="data_url"
                                                        >
                                                            {({
                                                                  imageList,
                                                                  onImageUpload,
                                                                  onImageUpdate,
                                                                  onImageRemove,
                                                                  isDragging,
                                                                  dragProps,
                                                              }) => (
                                                                // write your building UI
                                                                <div className="upload__image-wrapper">
                                                                    <label className="label-text mb-0 line-height-20 mr-2">Featured Image</label> <button
                                                                    className="btn btn-info btn-sm"
                                                                    style={isDragging ? { color: 'red' } : undefined}
                                                                    onClick={onImageUpload}
                                                                    {...dragProps}
                                                                >
                                                                    <i className="las la-upload"></i> {isDragging ? "Drop here" : "Upload"}
                                                                </button>
                                                                    &nbsp;
                                                                    {imageList.map((image, index) => (
                                                                        <div key={index} className="image-item">
                                                                            <img className="img-thumbnail mt-3 mb-3" src={image['data_url']} alt="" style={{'width':'150px','height':'150px'}}/>
                                                                            <div className="image-item__btn-wrapper">
                                                                                <button className="btn btn-primary btn-sm mr-2" onClick={() => onImageUpdate(index)}>Update</button>
                                                                                <button className="btn btn-danger btn-sm" onClick={() => onImageRemove(index)}>Remove</button>
                                                                            </div>
                                                                        </div>
                                                                    ))}
                                                                </div>
                                                            )}
                                                        </ImageUploading>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-lg-12 responsive-column">
                                                <div className="input-box">
                                                    <div className="form-group mt-3">
                                                        <ImageUploading
                                                            multiple={true}
                                                            value={this.state.property_images}
                                                            onChange={this.propertyImagesOnChange.bind(this)}
                                                            maxNumber={10}
                                                            dataURLKey="data_url"
                                                            acceptType={['jpg', 'jpeg', 'png']}
                                                            maxFileSize={550000}
                                                        >
                                                            {({
                                                                  imageList,
                                                                  onImageUpload,
                                                                  onImageRemoveAll,
                                                                  onImageUpdate,
                                                                  onImageRemove,
                                                                  isDragging,
                                                                  dragProps,
                                                                  errors
                                                              }) => (
                                                                // write your building UI
                                                                <div className="upload__image-wrapper">
                                                                    <label className="label-text mb-0 line-height-20 mr-2">Property Images</label> <button
                                                                    className="btn btn-info btn-sm mr-2"
                                                                    style={isDragging ? { color: 'red' } : undefined}
                                                                    onClick={onImageUpload}
                                                                    {...dragProps}
                                                                >
                                                                    <i className="las la-upload"></i> {isDragging ? "Drop here" : "Upload"}
                                                                </button>
                                                                    <button className="btn btn-danger btn-sm" onClick={onImageRemoveAll}> <i className="las la-trash"></i> Remove All</button>
                                                                    &nbsp;
                                                                    <div className="col-sm-12 mt-4">
                                                                        <div className="row">
                                                                            {errors && <>
                                                                                <div className="form-group">
                                                                                    <ul className="list-items list-items-bullet">
                                                                                        {errors.maxNumber && <li className='text-danger'>Number of selected images exceed maxNumber</li>}
                                                                                        {errors.acceptType && <li className='text-danger'>Your selected file type is not allow</li>}
                                                                                        {errors.maxFileSize && <li className='text-danger'>Selected file size exceed max File Size 500KB</li>}
                                                                                        {errors.resolution && <li className='text-danger'>Selected file is not match your desired resolution</li>}
                                                                                    </ul>
                                                                                </div>
                                                                            </>}
                                                                            {imageList.map((image, index) => (
                                                                                <div key={index} className="img-thumbnail image-item mr-2 mb-3">
                                                                                    <img src={image['data_url']} alt="" style={{'width':'100px','height':'100px'}}/>
                                                                                    <div className="image-item__btn-wrapper mt-2 text-center">
                                                                                        <button title="Update" className="btn btn-primary btn-sm mr-2" onClick={() => onImageUpdate(index)}><i className="las la-sync"></i></button>
                                                                                        <button title="Remove" className="btn btn-danger btn-sm" onClick={() => onImageRemove(index)}><i className="las la-times"></i></button>
                                                                                    </div>
                                                                                </div>
                                                                            ))}
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            )}
                                                        </ImageUploading>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-lg-12 responsive-column">
                                                <div className="input-box">
                                                    <label className="label-text">Organization</label>
                                                    <div className="form-group">
                                                        <Select
                                                            name="organization_id"
                                                            options={this.state.organizationLists}
                                                            onChange={this.handleOrganizationSelect}
                                                            placeholder='--Select Organization--'
                                                        />
                                                        <p className="text-danger">{this.state.errors.name}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-lg-12 responsive-column">
                                                <div className="input-box">
                                                    <label className="label-text">Name</label>
                                                    <div className="form-group">
                                                        <span className="la la-building form-icon"></span>
                                                        <input onChange={this.handleInput} className="form-control" type="text" name="name"
                                                               placeholder="Property Name"/>
                                                        <p className="text-danger">{this.state.errors.name}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-lg-12 responsive-column">
                                                <div className="input-box">
                                                    <label className="label-text">Description</label>
                                                    <div className="form-group">
                                                        <QuillEditorToolbar />
                                                        <ReactQuill
                                                            theme="snow"
                                                            value={this.state.description}
                                                            onChange={this.setDescription.bind(this)}
                                                            placeholder={"Write something awesome..."}
                                                            modules={modules}
                                                            formats={formats}
                                                        />
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-lg-12 responsive-column">
                                                <div className="input-box">
                                                    <label className="label-text">Category</label>
                                                    <div className="form-group">
                                                        <Select
                                                            isMulti
                                                            name="categories_id"
                                                            options={this.state.categoryLists}
                                                            onChange={this.handleCategorySelect}
                                                            placeholder='--Select Categories--'
                                                        />
                                                        <p className="text-danger">{this.state.errors.name}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-lg-12 responsive-column">
                                                <div className="input-box">
                                                    <label className="label-text">Occasion</label>
                                                    <div className="form-group">
                                                        <Select
                                                            isMulti
                                                            name="occasions_id"
                                                            options={this.state.occasionLists}
                                                            onChange={this.handleOccasionSelect}
                                                            placeholder='--Select Occasions--'
                                                        />
                                                        <p className="text-danger">{this.state.errors.name}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-lg-12 responsive-column">
                                                <div className="input-box">
                                                    <label className="label-text">Amenity</label>
                                                    <div className="form-group">
                                                        <Select
                                                            isMulti
                                                            name="amenities_id"
                                                            options={this.state.amenityLists}
                                                            onChange={this.handleAmenitySelect}
                                                            placeholder='--Select Amenities--'
                                                        />
                                                        <p className="text-danger">{this.state.errors.name}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-lg-12 responsive-column">
                                                <div className="input-box">
                                                    <label className="label-text">Price</label>
                                                    <div className="form-group">
                                                        <span className="la la-dollar-sign form-icon"></span>
                                                        <input onChange={this.handleInput} className="form-control" type="number" min="0" name="price"
                                                               placeholder="Price"/>
                                                        <p className="text-danger">{this.state.errors.price}</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div className="col-lg-12 responsive-column">
                                                <div className="input-box">
                                                    <label className="label-text">Capacity</label>
                                                    <div className="form-group">
                                                        <span className="la la-users form-icon"></span>
                                                        <input onChange={this.handleInput} className="form-control" type="number" min="0" name="capacity"
                                                               placeholder="Capacity"/>
                                                        <p className="text-danger">{this.state.errors.capacity}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-lg-12 responsive-column">
                                                <div className="input-box">
                                                    <label className="label-text">Division</label>
                                                    <div className="form-group">
                                                        <Select
                                                            name="division_id"
                                                            options={this.state.divisionLists}
                                                            onChange={this.handleDivisionSelect}
                                                            placeholder='--Select Division--'
                                                        />
                                                        <p className="text-danger">{this.state.errors.division_id}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-lg-12 responsive-column">
                                                <div className="input-box">
                                                    <label className="label-text">District</label>
                                                    <div className="form-group">
                                                        <Select
                                                            name="district_id"
                                                            options={this.state.districtLists}
                                                            onChange={this.handleDistrictSelect}
                                                            value={this.state.selected_district_option}
                                                            placeholder='--Select District--'
                                                        />
                                                        <p className="text-danger">{this.state.errors.district_id}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-lg-12 responsive-column">
                                                <div className="input-box">
                                                    <label className="label-text">City</label>
                                                    <div className="form-group">
                                                        <Select
                                                            name="city_id"
                                                            options={this.state.cityLists}
                                                            onChange={this.handleCitySelect}
                                                            value={this.state.selected_city_option}
                                                            placeholder='--Select City--'
                                                        />
                                                        <p className="text-danger">{this.state.errors.city_id}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-lg-12">
                                                <div className="input-box">
                                                    <label className="label-text mb-0 line-height-20">Address</label>
                                                    <div className="form-group">
                                                        <span className="la la-pencil form-icon"></span>
                                                        <textarea onChange={this.handleInput} className="message-control form-control" name="address" placeholder="In English only, no HTML, no web, no ALL CAPS"></textarea>
                                                        <p className="text-danger">{this.state.errors.address}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-lg-12 responsive-column">
                                                <div className="btn-box pt-3">
                                                    {this.state.processing === true ? (
                                                        <>
                                                            <button type="submit" className="theme-btn btn-danger disabled float-right"><i className="las la-spin la-spinner"></i> Save</button>
                                                        </>
                                                    ) : (
                                                        <button type="submit" className="theme-btn float-right"><i className="la la-save ml-1"></i> Save</button>
                                                    )}
                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default PropertyCreate;