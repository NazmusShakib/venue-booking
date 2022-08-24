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
import Rating from "react-rating";
import WithRouter from "../../../_utility/WithRouter";

class PropertyCreate extends Component {
    constructor() {
        super();
        this.state = {
            featured_image:[],
            property_images:[],
            organizationLists:[],
            organization_id:'',
            name:'',
            star_rating:'',
            description:'',
            categoryLists:[],
            categories_id:[],
            occasionLists:[],
            occasions_id:[],
            amenityLists:[],
            amenities_id:[],
            price_type:'',
            price:'',
            capacity:'',
            divisionLists:[],
            division_id:'',
            districtLists:[],
            selected_district_option:'',
            district_id:'',
            cityLists:[],
            selected_city_option:'',
            city_id:'',
            address:'',
            processing:false,
            message:'',
            errors:[]
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

    handleInput = (e) =>{
        e.persist();
        this.setState({[e.target.name] : e.target.value});
    }

    handleDivisionSelect = (selectedOption) =>{
        let data = {'value_field_as':'id', 'confirm_parent_division':'Yes', 'division_id':selectedOption.value}
        this.setState({selected_district_option : '', selected_city_option : '', districtLists : [], cityLists : []});
        axios.post('/api/district/lists/for/dropdown', data).then(res => {
            this.setState({division_id : selectedOption.value, districtLists:res.data.districts});
        }).catch((error)=>{});
    }

    handleDistrictSelect = (selectedOption) =>{
        let data = {'value_field_as':'id', 'confirm_parent_district':'Yes', 'district_id':selectedOption.value}
        this.setState({selected_district_option : selectedOption, selected_city_option : '', cityLists : []});
        axios.post('/api/city/lists/for/dropdown', data).then(res => {
            this.setState({district_id : selectedOption.value, cityLists:res.data.cities});
        }).catch((error)=>{});
    }

    price_types = [{ value: 'per-day', label: 'Per Day' },{ value: 'per-night', label: 'Per Night' }]

    formSubmit = (e) =>{
        e.preventDefault();
        let data ={
            featured_image  :   this.state.featured_image.length > 0 ? this.state.featured_image[0].data_url : '',
            property_images :   Array.from(this.state.property_images, img => img.data_url),
            organization_id :   this.state.organization_id,
            name            :   this.state.name,
            star_rating     :   this.state.star_rating,
            description     :   this.state.description,
            categories_id   :   this.state.categories_id,
            occasions_id    :   this.state.occasions_id,
            amenities_id    :   this.state.amenities_id,
            price_type      :   this.state.price_type,
            price           :   this.state.price,
            capacity        :   this.state.capacity,
            division_id     :   this.state.division_id,
            district_id     :   this.state.district_id,
            city_id         :   this.state.city_id,
            address         :   this.state.address,
            is_enabled      :   0,
            creator_type    :   'User',
            created_by      :   SessionHelper.GetAuthUserId()
        }

        console.log(data);

        this.setState({processing : true, errors:[], message:''});
        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.post('/api/venue/store', data).then(res => {
                if (res.data.status === 400)
                {
                    this.setState({processing:false, message:res.data.message, errors:res.data.errors});
                    toast.warn(res.data.message);
                }
                else if(res.data.status === 200)
                {
                    this.setState({processing:false, errors:[], message:res.data.message});
                    toast.success(res.data.message);
                    this.props.navigate('/manage/property/list');
                }
            }).catch((error)=>{
                console.log(error);
                this.setState({processing:false, message:'Sorry! something went wrong.'});
            });
        });
    }

    render() {
        return (
            <>
                <section>
                    <div className="container-fluid full-with-section-padding-lr padding-top-70px padding-bottom-100px">
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

                                            <div className="col-sm-12 responsive-column">
                                                <div className="input-box">
                                                    <div className="form-group mt-3 mb-4">
                                                        <ImageUploading
                                                            multiple={false}
                                                            onChange={(imageList, addUpdateIndex) => this.setState({featured_image:imageList})}
                                                            value={this.state.featured_image}
                                                            maxNumber={1}
                                                            dataURLKey="data_url"
                                                            acceptType={['jpg', 'jpeg', 'png']}
                                                            maxFileSize={563200}
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
                                                                    <label className="label-text mb-0 line-height-20 mr-2">Featured Image</label>
                                                                    <button
                                                                    type="button"
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
                                                                                <button type="button" className="btn btn-primary btn-sm mr-2" onClick={() => onImageUpdate(index)}>Update</button>
                                                                                <button type="button" className="btn btn-danger btn-sm" onClick={() => onImageRemove(index)}>Remove</button>
                                                                            </div>
                                                                        </div>
                                                                    ))}
                                                                </div>
                                                            )}
                                                        </ImageUploading>
                                                        <p className="text-danger">{this.state.errors.featured_image}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-sm-12 responsive-column">
                                                <div className="input-box">
                                                    <div className="form-group mt-3">
                                                        <ImageUploading
                                                            multiple={true}
                                                            onChange={(imageList, addUpdateIndex) => this.setState({property_images:imageList})}
                                                            value={this.state.property_images}
                                                            maxNumber={10}
                                                            dataURLKey="data_url"
                                                            acceptType={['jpg', 'jpeg', 'png']}
                                                            maxFileSize={563200}
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
                                                                    type="button"
                                                                    className="btn btn-info btn-sm mr-2"
                                                                    style={isDragging ? { color: 'red' } : undefined}
                                                                    onClick={onImageUpload}
                                                                    {...dragProps}
                                                                >
                                                                    <i className="las la-upload"></i> {isDragging ? "Drop here" : "Upload"}
                                                                </button>
                                                                    <button type="button" className="btn btn-danger btn-sm" onClick={onImageRemoveAll}> <i className="las la-trash"></i> Remove All</button>
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
                                                                                        <button type="button" title="Update" className="btn btn-primary btn-sm mr-2" onClick={() => onImageUpdate(index)}><i className="las la-sync"></i></button>
                                                                                        <button type="button" title="Remove" className="btn btn-danger btn-sm" onClick={() => onImageRemove(index)}><i className="las la-times"></i></button>
                                                                                    </div>
                                                                                </div>
                                                                            ))}
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            )}
                                                        </ImageUploading>
                                                        <p className="text-danger">{this.state.errors.property_images}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-sm-12 responsive-column">
                                                <div className="input-box">
                                                    <label className="label-text">Organization</label>
                                                    <div className="form-group">
                                                        <Select
                                                            name="organization_id"
                                                            options={this.state.organizationLists}
                                                            onChange={(option) => this.setState({organization_id: option.value})}
                                                            placeholder='--Select Organization--'
                                                        />
                                                        <p className="text-danger">{this.state.errors.organization_id}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-sm-12 responsive-column">
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

                                            <div className="col-sm-12 responsive-column">
                                                <div className="input-box">
                                                    <label className="label-text mr-2">Rating</label>
                                                    <div className="form-group" style={{'color':'#ffc107'}}>
                                                        <Rating
                                                            onChange={(rate) => this.setState({star_rating: rate})}
                                                            initialRating={this.state.star_rating}
                                                            stop={5}
                                                            emptySymbol={'lar la-star la-2x'}
                                                            fullSymbol={'las la-star la-2x'}
                                                        />
                                                        <p className="text-danger">{this.state.errors.star_rating}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-sm-12 responsive-column">
                                                <div className="input-box">
                                                    <label className="label-text">Description</label>
                                                    <div className="form-group">
                                                        <QuillEditorToolbar />
                                                        <ReactQuill
                                                            theme="snow"
                                                            onChange={(description)=>this.setState({description : description})}
                                                            value={this.state.description}
                                                            placeholder={"Write something awesome..."}
                                                            modules={modules}
                                                            formats={formats}
                                                        />
                                                        <p className="text-danger">{this.state.errors.description}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-sm-12 responsive-column">
                                                <div className="input-box">
                                                    <label className="label-text">Category</label>
                                                    <div className="form-group">
                                                        <Select
                                                            isMulti
                                                            name="categories_id"
                                                            onChange={(selectedOption)=>this.setState({categories_id:Array.from(selectedOption, option => option.value)})}
                                                            options={this.state.categoryLists}
                                                            placeholder='--Select Categories--'
                                                        />
                                                        <p className="text-danger">{this.state.errors.categories_id}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-sm-12 responsive-column">
                                                <div className="input-box">
                                                    <label className="label-text">Occasion</label>
                                                    <div className="form-group">
                                                        <Select
                                                            isMulti
                                                            name="occasions_id"
                                                            onChange={(selectedOption)=>this.setState({occasions_id:Array.from(selectedOption, option => option.value)})}
                                                            options={this.state.occasionLists}
                                                            placeholder='--Select Occasions--'
                                                        />
                                                        <p className="text-danger">{this.state.errors.occasions_id}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-sm-12 responsive-column">
                                                <div className="input-box">
                                                    <label className="label-text">Amenity</label>
                                                    <div className="form-group">
                                                        <Select
                                                            isMulti
                                                            name="amenities_id"
                                                            onChange={(selectedOption)=>this.setState({amenities_id:Array.from(selectedOption, option => option.value)})}
                                                            options={this.state.amenityLists}
                                                            placeholder='--Select Amenities--'
                                                        />
                                                        <p className="text-danger">{this.state.errors.amenities_id}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-sm-12 responsive-column">
                                                <div className="input-box">
                                                    <label className="label-text">Price Type</label>
                                                    <div className="form-group">
                                                        <Select
                                                            name="price_type"
                                                            options={this.price_types}
                                                            onChange={(option) => this.setState({price_type: option.value})}
                                                            placeholder='--Select Price Type--'
                                                        />
                                                        <p className="text-danger">{this.state.errors.price_type}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-sm-12 responsive-column">
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
                                            <div className="col-sm-12 responsive-column">
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

                                            <div className="col-sm-12 responsive-column">
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

                                            <div className="col-sm-12 responsive-column">
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

                                            <div className="col-sm-12 responsive-column">
                                                <div className="input-box">
                                                    <label className="label-text">City</label>
                                                    <div className="form-group">
                                                        <Select
                                                            name="city_id"
                                                            options={this.state.cityLists}
                                                            onChange={(option) => this.setState({selected_city_option : option, city_id : option.value})}
                                                            value={this.state.selected_city_option}
                                                            placeholder='--Select City--'
                                                        />
                                                        <p className="text-danger">{this.state.errors.city_id}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-sm-12">
                                                <div className="input-box">
                                                    <label className="label-text mb-0 line-height-20">Address</label>
                                                    <div className="form-group">
                                                        <span className="la la-pencil form-icon"></span>
                                                        <textarea onChange={this.handleInput} className="message-control form-control" name="address" placeholder="In English only, no HTML, no web, no ALL CAPS"></textarea>
                                                        <p className="text-danger">{this.state.errors.address}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="col-sm-12 responsive-column">
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

export default WithRouter(PropertyCreate);