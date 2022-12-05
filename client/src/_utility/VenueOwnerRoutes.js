import React from 'react';
import SessionHelper from "../session/SessionHelper";
import { Navigate, Outlet } from "react-router-dom";
const VenueOwnerRoutes = () => {
    let auth = SessionHelper.GetAuthSession();
    return (auth.type === 'Venue Owner' ? <Outlet /> : <Navigate to="/dashboard" replace/>);
}
export default VenueOwnerRoutes;