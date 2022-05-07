import React from 'react';
import ImportScript from './ImportScripts';
const Daterange = () => {
    let scripts = '$("input[name=\'daterange\']").daterangepicker({ opens: "right", locale: { format: "DD/MM/YYYY" } });$("input[name=\'daterange-single\']").daterangepicker({ singleDatePicker: !0, opens: "right", locale: { format: "DD/MM/YYYY" } })';
    ImportScript('/assets/js/daterangepicker.js', scripts);
    return (<></>);
};

export default Daterange;