import React from 'react';
import SessionHelper from "../session/SessionHelper";
import { Navigate, Outlet } from "react-router-dom";
const AuthRoutes = () => {
    let auth = SessionHelper.GetAuthSession();
    return (auth !== null ? <Outlet /> : <Navigate to="/" replace/>);
}
export default AuthRoutes;