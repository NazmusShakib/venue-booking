import {useLocation, useNavigate, useParams} from "react-router-dom";
import React from "react";

const WithRouter = (Component) => {
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

export default WithRouter;