import React from 'react';
import ImportScript from './ImportScripts';
const Select2 = () => {
    let scripts = '$(".select-contain-select").selectpicker({ liveSearch: !0, liveSearchPlaceholder: "Search", liveSearchStyle: "contains", size: 5 })';
    ImportScript('/assets/js/bootstrap-select.min.js', scripts);
    return (<></>);
};

export default Select2;