import React from 'react';
import ImportScripts from "../../hooks/ImportScripts";

const HomePageScripts = () => {
    ImportScripts('/assets/js/jquery.superslides.min.js', '!function(e){"use strict";jQuery("#fullscreen-slide-contain").superslides({play:4e3,pagination:!1,animation_speed:500,animation:"fade"})}();');
    return (<></>);
};

export default HomePageScripts;