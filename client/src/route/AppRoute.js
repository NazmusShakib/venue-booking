import React, {Component} from 'react';
import {Routes, Route, BrowserRouter} from "react-router-dom";
import Home from "../pages/Home";

class AppRoute extends Component {
    render() {
        return (
            <>
                <BrowserRouter>
                    <Routes>
                        <Route path="/" element={<Home />} />
                    </Routes>
                </BrowserRouter>
            </>
        );
    }
}

export default AppRoute;