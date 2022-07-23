import React from 'react';
import AppRoute from "./route/AppRoute";
import './axios/AxiosConfig';
window.$ = window.jQuery = require('jquery');

function App() {
  return (
    <>
        <AppRoute/>
    </>
  );
}

export default App;
