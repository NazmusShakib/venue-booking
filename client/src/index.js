import React from 'react';
import ReactDOM from "react-dom/client";
import App from './App';
import '../src/assets/css/bootstrap.min.css';
import '../src/assets/css/bootstrap-select.min.css';
import '../src/assets/css/line-awesome.css';
import '../src/assets/css/owl.carousel.min.css';
import '../src/assets/css/owl.theme.default.min.css';
import '../src/assets/css/jquery.fancybox.min.css';
import '../src/assets/css/daterangepicker.css';
import '../src/assets/css/animated-headline.css';
import '../src/assets/css/jquery-ui.css';
import '../src/assets/css/placeholder-loading.min.css';
import '../src/assets/css/style.css';
import '../src/assets/css/custom.css';
import * as serviceWorkerRegistration from './serviceWorkerRegistration';
import reportWebVitals from './reportWebVitals';
import '../src/_utility/Helper';


const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
    <React.StrictMode>
        <App />
    </React.StrictMode>
);

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://cra.link/PWA
serviceWorkerRegistration.unregister();

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
