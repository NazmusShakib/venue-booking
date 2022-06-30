import React from 'react';
import SessionHelper from "../session/SessionHelper";
import { Navigate, Outlet } from "react-router-dom";
const GuestRoutes = () => {
    let auth = SessionHelper.GetAuthSession();
    return (auth !== null ? <Navigate to="/dashboard" replace/>  : <Outlet />);
}
export default GuestRoutes;