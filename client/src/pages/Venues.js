import React, {Component} from 'react';
import InfoSection from "../components/partials/InfoSection";
import Subscribe from "../components/partials/Subscribe";
import {Link} from "react-router-dom";
import Sidebar from "./partials/Sidebar";
import VenueLists from "./components/VenueLists";
import {
    useLocation,
    useNavigate,
    useParams,
} from "react-router-dom";
let filteredCategories = [];
let filteredOccasions = [];
let filteredAmenities = [];
let data = [];
class Venues extends Component {

    constructor() {
        super();
        this.doVenueListFilter = React.createRef();
        this.state={
            category:''
        }

        this.receiveFilterResponseFromSidebar = this.receiveFilterResponseFromSidebar.bind(this);
    }
    componentDidMount() {
        window.scrollTo(0, 0);
    }

    receiveFilterResponseFromSidebar(responseType, filter){
        if(responseType.toString() == 'categories')
        {
            filteredCategories = filter.filteredCategories;
        }

        if(responseType.toString() == 'occasions')
        {
            filteredOccasions = filter.filteredOccasions;
        }

        if(responseType.toString() == 'amenities')
        {
            filteredAmenities = filter.filteredAmenities;
        }

        data['categories'] = filteredCategories;
        data['occasions'] = filteredOccasions;
        data['amenities'] = filteredAmenities;
        data['category'] = this.props.params.category;

        this.doVenueListFilter.current.doVenueListFilter(data);
    }

    componentDidUpdate(prevProps, prevState, snapshot) {
        if (prevProps.params.category !== this.props.params.category)
        {
            this.setState({category:this.props.params.category});
        }
    }

    render() {
        return (
            <>
                <section className="breadcrumb-area bread-bg-7">
                    <div className="breadcrumb-wrap">
                        <div className="container">
                            <div className="row align-items-center">
                                <div className="col-lg-6">
                                    <div className="breadcrumb-content">
                                        <div className="section-heading">
                                            <h2 className="sec__title text-white">
                                                {(() => {
                                                    if(!this.state.category)
                                                    {
                                                        return 'Venues';
                                                    }else if(this.state.category === 'resorts')
                                                    {
                                                        return 'Resorts';
                                                    }else if(this.state.category === 'hotels') {
                                                        return 'Hotels';
                                                    }else if(this.state.category === 'destination-weeding') {
                                                        return 'Destination Weeding';
                                                    }
                                                })()}
                                            </h2>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-6">
                                    <div className="breadcrumb-list text-right">
                                        <ul className="list-items">
                                            <li><Link to="/">Home</Link></li>
                                            <li>
                                                {(() => {
                                                    if(!this.state.category)
                                                    {
                                                        return 'Venues';
                                                    }else if(this.state.category === 'resorts')
                                                    {
                                                        return 'Resorts';
                                                    }else if(this.state.category === 'hotels') {
                                                        return 'Hotels';
                                                    }else if(this.state.category === 'destination-weeding') {
                                                        return 'Destination Weeding';
                                                    }
                                                })()}
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div className="bread-svg-box">
                        <svg className="bread-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 10"
                             preserveAspectRatio="none">
                            <polygon points="100 0 50 10 0 0 0 10 100 10"></polygon>
                        </svg>
                    </div>
                </section>

                <section className="card-area section--padding">
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-8">
                                <div className="row">
                                    <VenueLists category={this.state.category} ref={this.doVenueListFilter}/>
                                </div>
                            </div>
                            <div className="col-lg-4">
                                <Sidebar receiveFilterResponseFromSidebar={this.receiveFilterResponseFromSidebar}/>
                            </div>
                        </div>
                    </div>
                </section>

                <InfoSection/>
                <Subscribe/>
            </>
        );
    }
}

const withRouter = (Component) => {
    const Wrapper = (props) => {
        let location = useLocation();
        let navigate = useNavigate();
        let params = useParams();

        return (
            <Component
                location={location}
                navigate={navigate}
                params={params}
                {...props}
            />
        );
    };

    return Wrapper;
};

export default withRouter(Venues);