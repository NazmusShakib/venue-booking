import React, {Component} from 'react';
import {Link} from "react-router-dom";

class Blog extends Component {
    render() {
        return (
            <>
                <section class="breadcrumb-area bread-bg-9">
                    <div class="breadcrumb-wrap">
                        <div class="container">
                            <div class="row align-items-center">
                                <div class="col-lg-6">
                                    <div class="breadcrumb-content">
                                        <div class="section-heading">
                                            <h2 class="sec__title text-white">Blog</h2>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="breadcrumb-list text-right">
                                        <ul class="list-items">
                                            <li><Link to="/">Home</Link></li>
                                            <li>Blog</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="bread-svg-box">
                        <svg class="bread-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 10" preserveAspectRatio="none"><polygon points="100 0 50 10 0 0 0 10 100 10"></polygon></svg>
                    </div>
                </section>

                <section class="card-area section--padding">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="row">
                                    <div class="col-lg-6 responsive-column">
                                        <div class="card-item blog-card">
                                            <div class="card-img">
                                                <img src="assets/images/blog-img.jpg" alt="blog-img"/>
                                                    <div class="post-format icon-element">
                                                        <i class="la la-photo"></i>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="post-categories">
                                                            <a href="#" class="badge">Travel</a>
                                                            <a href="#" class="badge">lifestyle</a>
                                                        </div>
                                                        <h3 class="card-title line-height-26"><a href="blog-single.html">When Traveling Avoid Expensive Hotels & Resorts</a></h3>
                                                        <p class="card-meta">
                                                            <span class="post__date"> 1 January, 2020</span>
                                                            <span class="post-dot"></span>
                                                            <span class="post__time">5 Mins read</span>
                                                        </p>
                                                    </div>
                                            </div>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <div class="author-content d-flex align-items-center">
                                                    <div class="author-img">
                                                        <img src="assets/images/small-team1.jpg" alt="testimonial image"/>
                                                    </div>
                                                    <div class="author-bio">
                                                        <a href="#" class="author__title">Leroy Bell</a>
                                                    </div>
                                                </div>
                                                <div class="post-share">
                                                    <ul>
                                                        <li>
                                                            <i class="la la-share icon-element"></i>
                                                            <ul class="post-share-dropdown d-flex align-items-center">
                                                                <li><a href="#"><i class="lab la-facebook-f"></i></a></li>
                                                                <li><a href="#"><i class="lab la-twitter"></i></a></li>
                                                                <li><a href="#"><i class="lab la-instagram"></i></a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 responsive-column">
                                        <div class="card-item blog-card">
                                            <div class="card-img">
                                                <img src="assets/images/blog-img2.jpg" alt="blog-img"/>
                                                    <div class="post-format icon-element">
                                                        <i class="la la-play"></i>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="post-categories">
                                                            <a href="#" class="badge">Video</a>
                                                        </div>
                                                        <h3 class="card-title line-height-26"><a href="blog-single.html">My Best Travel Tips: The Ultimate Travel Guide</a></h3>
                                                        <p class="card-meta">
                                                            <span class="post__date"> 1 February, 2020</span>
                                                            <span class="post-dot"></span>
                                                            <span class="post__time">4 Mins read</span>
                                                        </p>
                                                    </div>
                                            </div>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <div class="author-content d-flex align-items-center">
                                                    <div class="author-img">
                                                        <img src="assets/images/small-team2.jpg" alt="testimonial image"/>
                                                    </div>
                                                    <div class="author-bio">
                                                        <a href="#" class="author__title">Phillip Hunt</a>
                                                    </div>
                                                </div>
                                                <div class="post-share">
                                                    <ul>
                                                        <li>
                                                            <i class="la la-share icon-element"></i>
                                                            <ul class="post-share-dropdown d-flex align-items-center">
                                                                <li><a href="#"><i class="lab la-facebook-f"></i></a></li>
                                                                <li><a href="#"><i class="lab la-twitter"></i></a></li>
                                                                <li><a href="#"><i class="lab la-instagram"></i></a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 responsive-column">
                                        <div class="card-item blog-card">
                                            <div class="card-img">
                                                <img src="assets/images/blog-img3.jpg" alt="blog-img"/>
                                                    <div class="post-format icon-element">
                                                        <i class="la la-music"></i>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="post-categories">
                                                            <a href="#" class="badge">audio</a>
                                                        </div>
                                                        <h3 class="card-title line-height-26"><a href="blog-single.html">By all Means, Travel to Popular Sites & Don’t Rule Out Other Locations</a></h3>
                                                        <p class="card-meta">
                                                            <span class="post__date"> 1 March, 2020</span>
                                                            <span class="post-dot"></span>
                                                            <span class="post__time">3 Mins read</span>
                                                        </p>
                                                    </div>
                                            </div>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <div class="author-content d-flex align-items-center">
                                                    <div class="author-img">
                                                        <img src="assets/images/small-team3.jpg" alt="testimonial image"/>
                                                    </div>
                                                    <div class="author-bio">
                                                        <a href="#" class="author__title">Luke Jacobs</a>
                                                    </div>
                                                </div>
                                                <div class="post-share">
                                                    <ul>
                                                        <li>
                                                            <i class="la la-share icon-element"></i>
                                                            <ul class="post-share-dropdown d-flex align-items-center">
                                                                <li><a href="#"><i class="lab la-facebook-f"></i></a></li>
                                                                <li><a href="#"><i class="lab la-twitter"></i></a></li>
                                                                <li><a href="#"><i class="lab la-instagram"></i></a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 responsive-column">
                                        <div class="card-item blog-card">
                                            <div class="card-img">
                                                <img src="assets/images/blog-img.jpg" alt="blog-img"/>
                                                    <div class="post-format icon-element">
                                                        <i class="la la-photo"></i>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="post-categories">
                                                            <a href="#" class="badge">Travel</a>
                                                            <a href="#" class="badge">lifestyle</a>
                                                        </div>
                                                        <h3 class="card-title line-height-26"><a href="blog-single.html">When Traveling Avoid Expensive Hotels & Resorts</a></h3>
                                                        <p class="card-meta">
                                                            <span class="post__date"> 1 January, 2020</span>
                                                            <span class="post-dot"></span>
                                                            <span class="post__time">5 Mins read</span>
                                                        </p>
                                                    </div>
                                            </div>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <div class="author-content d-flex align-items-center">
                                                    <div class="author-img">
                                                        <img src="assets/images/small-team3.jpg" alt="testimonial image"/>
                                                    </div>
                                                    <div class="author-bio">
                                                        <a href="#" class="author__title">Alex Smith</a>
                                                    </div>
                                                </div>
                                                <div class="post-share">
                                                    <ul>
                                                        <li>
                                                            <i class="la la-share icon-element"></i>
                                                            <ul class="post-share-dropdown d-flex align-items-center">
                                                                <li><a href="#"><i class="lab la-facebook-f"></i></a></li>
                                                                <li><a href="#"><i class="lab la-twitter"></i></a></li>
                                                                <li><a href="#"><i class="lab la-instagram"></i></a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 responsive-column">
                                        <div class="card-item blog-card">
                                            <div class="card-img">
                                                <img src="assets/images/blog-img2.jpg" alt="blog-img"/>
                                                    <div class="post-format icon-element">
                                                        <i class="la la-play"></i>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="post-categories">
                                                            <a href="#" class="badge">Video</a>
                                                        </div>
                                                        <h3 class="card-title line-height-26"><a href="blog-single.html">My Best Travel Tips: The Ultimate Travel Guide</a></h3>
                                                        <p class="card-meta">
                                                            <span class="post__date"> 1 February, 2020</span>
                                                            <span class="post-dot"></span>
                                                            <span class="post__time">4 Mins read</span>
                                                        </p>
                                                    </div>
                                            </div>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <div class="author-content d-flex align-items-center">
                                                    <div class="author-img">
                                                        <img src="assets/images/small-team5.jpg" alt="testimonial image"/>
                                                    </div>
                                                    <div class="author-bio">
                                                        <a href="#" class="author__title">Abraham Doe</a>
                                                    </div>
                                                </div>
                                                <div class="post-share">
                                                    <ul>
                                                        <li>
                                                            <i class="la la-share icon-element"></i>
                                                            <ul class="post-share-dropdown d-flex align-items-center">
                                                                <li><a href="#"><i class="lab la-facebook-f"></i></a></li>
                                                                <li><a href="#"><i class="lab la-twitter"></i></a></li>
                                                                <li><a href="#"><i class="lab la-instagram"></i></a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 responsive-column">
                                        <div class="card-item blog-card">
                                            <div class="card-img">
                                                <img src="assets/images/blog-img3.jpg" alt="blog-img"/>
                                                    <div class="post-format icon-element">
                                                        <i class="la la-music"></i>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="post-categories">
                                                            <a href="#" class="badge">audio</a>
                                                        </div>
                                                        <h3 class="card-title line-height-26"><a href="blog-single.html">By all Means, Travel to Popular Sites & Don’t Rule Out Other Locations</a></h3>
                                                        <p class="card-meta">
                                                            <span class="post__date"> 1 March, 2020</span>
                                                            <span class="post-dot"></span>
                                                            <span class="post__time">3 Mins read</span>
                                                        </p>
                                                    </div>
                                            </div>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <div class="author-content d-flex align-items-center">
                                                    <div class="author-img">
                                                        <img src="assets/images/small-team6.jpg" alt="testimonial image"/>
                                                    </div>
                                                    <div class="author-bio">
                                                        <a href="#" class="author__title">David Martin</a>
                                                    </div>
                                                </div>
                                                <div class="post-share">
                                                    <ul>
                                                        <li>
                                                            <i class="la la-share icon-element"></i>
                                                            <ul class="post-share-dropdown d-flex align-items-center">
                                                                <li><a href="#"><i class="lab la-facebook-f"></i></a></li>
                                                                <li><a href="#"><i class="lab la-twitter"></i></a></li>
                                                                <li><a href="#"><i class="lab la-instagram"></i></a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 responsive-column">
                                        <div class="card-item blog-card">
                                            <div class="card-img">
                                                <img src="assets/images/blog-img2.jpg" alt="blog-img"/>
                                                    <div class="post-format icon-element">
                                                        <i class="la la-play"></i>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="post-categories">
                                                            <a href="#" class="badge">Video</a>
                                                        </div>
                                                        <h3 class="card-title line-height-26"><a href="blog-single.html">My Best Travel Tips: The Ultimate Travel Guide</a></h3>
                                                        <p class="card-meta">
                                                            <span class="post__date"> 1 February, 2020</span>
                                                            <span class="post-dot"></span>
                                                            <span class="post__time">4 Mins read</span>
                                                        </p>
                                                    </div>
                                            </div>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <div class="author-content d-flex align-items-center">
                                                    <div class="author-img">
                                                        <img src="assets/images/small-team2.jpg" alt="testimonial image"/>
                                                    </div>
                                                    <div class="author-bio">
                                                        <a href="#" class="author__title">Phillip Hunt</a>
                                                    </div>
                                                </div>
                                                <div class="post-share">
                                                    <ul>
                                                        <li>
                                                            <i class="la la-share icon-element"></i>
                                                            <ul class="post-share-dropdown d-flex align-items-center">
                                                                <li><a href="#"><i class="lab la-facebook-f"></i></a></li>
                                                                <li><a href="#"><i class="lab la-twitter"></i></a></li>
                                                                <li><a href="#"><i class="lab la-instagram"></i></a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 responsive-column">
                                        <div class="card-item blog-card">
                                            <div class="card-img">
                                                <img src="assets/images/blog-img3.jpg" alt="blog-img"/>
                                                    <div class="post-format icon-element">
                                                        <i class="la la-music"></i>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="post-categories">
                                                            <a href="#" class="badge">audio</a>
                                                        </div>
                                                        <h3 class="card-title line-height-26"><a href="blog-single.html">By all Means, Travel to Popular Sites & Don’t Rule Out Other Locations</a></h3>
                                                        <p class="card-meta">
                                                            <span class="post__date"> 1 March, 2020</span>
                                                            <span class="post-dot"></span>
                                                            <span class="post__time">3 Mins read</span>
                                                        </p>
                                                    </div>
                                            </div>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <div class="author-content d-flex align-items-center">
                                                    <div class="author-img">
                                                        <img src="assets/images/small-team3.jpg" alt="testimonial image"/>
                                                    </div>
                                                    <div class="author-bio">
                                                        <a href="#" class="author__title">Luke Jacobs</a>
                                                    </div>
                                                </div>
                                                <div class="post-share">
                                                    <ul>
                                                        <li>
                                                            <i class="la la-share icon-element"></i>
                                                            <ul class="post-share-dropdown d-flex align-items-center">
                                                                <li><a href="#"><i class="lab la-facebook-f"></i></a></li>
                                                                <li><a href="#"><i class="lab la-twitter"></i></a></li>
                                                                <li><a href="#"><i class="lab la-instagram"></i></a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 responsive-column">
                                        <div class="card-item blog-card">
                                            <div class="card-img">
                                                <img src="assets/images/blog-img2.jpg" alt="blog-img"/>
                                                    <div class="post-format icon-element">
                                                        <i class="la la-play"></i>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="post-categories">
                                                            <a href="#" class="badge">Video</a>
                                                        </div>
                                                        <h3 class="card-title line-height-26"><a href="blog-single.html">My Best Travel Tips: The Ultimate Travel Guide</a></h3>
                                                        <p class="card-meta">
                                                            <span class="post__date"> 1 February, 2020</span>
                                                            <span class="post-dot"></span>
                                                            <span class="post__time">4 Mins read</span>
                                                        </p>
                                                    </div>
                                            </div>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <div class="author-content d-flex align-items-center">
                                                    <div class="author-img">
                                                        <img src="assets/images/small-team2.jpg" alt="testimonial image"/>
                                                    </div>
                                                    <div class="author-bio">
                                                        <a href="#" class="author__title">Phillip Hunt</a>
                                                    </div>
                                                </div>
                                                <div class="post-share">
                                                    <ul>
                                                        <li>
                                                            <i class="la la-share icon-element"></i>
                                                            <ul class="post-share-dropdown d-flex align-items-center">
                                                                <li><a href="#"><i class="lab la-facebook-f"></i></a></li>
                                                                <li><a href="#"><i class="lab la-twitter"></i></a></li>
                                                                <li><a href="#"><i class="lab la-instagram"></i></a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 responsive-column">
                                        <div class="card-item blog-card">
                                            <div class="card-img">
                                                <img src="assets/images/blog-img3.jpg" alt="blog-img"/>
                                                    <div class="post-format icon-element">
                                                        <i class="la la-music"></i>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="post-categories">
                                                            <a href="#" class="badge">audio</a>
                                                        </div>
                                                        <h3 class="card-title line-height-26"><a href="blog-single.html">By all Means, Travel to Popular Sites & Don’t Rule Out Other Locations</a></h3>
                                                        <p class="card-meta">
                                                            <span class="post__date"> 1 March, 2020</span>
                                                            <span class="post-dot"></span>
                                                            <span class="post__time">3 Mins read</span>
                                                        </p>
                                                    </div>
                                            </div>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <div class="author-content d-flex align-items-center">
                                                    <div class="author-img">
                                                        <img src="assets/images/small-team3.jpg" alt="testimonial image"/>
                                                    </div>
                                                    <div class="author-bio">
                                                        <a href="#" class="author__title">Luke Jacobs</a>
                                                    </div>
                                                </div>
                                                <div class="post-share">
                                                    <ul>
                                                        <li>
                                                            <i class="la la-share icon-element"></i>
                                                            <ul class="post-share-dropdown d-flex align-items-center">
                                                                <li><a href="#"><i class="lab la-facebook-f"></i></a></li>
                                                                <li><a href="#"><i class="lab la-twitter"></i></a></li>
                                                                <li><a href="#"><i class="lab la-instagram"></i></a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 responsive-column">
                                        <div class="card-item blog-card">
                                            <div class="card-img">
                                                <img src="assets/images/blog-img2.jpg" alt="blog-img"/>
                                                    <div class="post-format icon-element">
                                                        <i class="la la-play"></i>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="post-categories">
                                                            <a href="#" class="badge">Video</a>
                                                        </div>
                                                        <h3 class="card-title line-height-26"><a href="blog-single.html">My Best Travel Tips: The Ultimate Travel Guide</a></h3>
                                                        <p class="card-meta">
                                                            <span class="post__date"> 1 February, 2020</span>
                                                            <span class="post-dot"></span>
                                                            <span class="post__time">4 Mins read</span>
                                                        </p>
                                                    </div>
                                            </div>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <div class="author-content d-flex align-items-center">
                                                    <div class="author-img">
                                                        <img src="assets/images/small-team2.jpg" alt="testimonial image"/>
                                                    </div>
                                                    <div class="author-bio">
                                                        <a href="#" class="author__title">Phillip Hunt</a>
                                                    </div>
                                                </div>
                                                <div class="post-share">
                                                    <ul>
                                                        <li>
                                                            <i class="la la-share icon-element"></i>
                                                            <ul class="post-share-dropdown d-flex align-items-center">
                                                                <li><a href="#"><i class="lab la-facebook-f"></i></a></li>
                                                                <li><a href="#"><i class="lab la-twitter"></i></a></li>
                                                                <li><a href="#"><i class="lab la-instagram"></i></a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 responsive-column">
                                        <div class="card-item blog-card">
                                            <div class="card-img">
                                                <img src="assets/images/blog-img3.jpg" alt="blog-img"/>
                                                    <div class="post-format icon-element">
                                                        <i class="la la-music"></i>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="post-categories">
                                                            <a href="#" class="badge">audio</a>
                                                        </div>
                                                        <h3 class="card-title line-height-26"><a href="blog-single.html">By all Means, Travel to Popular Sites & Don’t Rule Out Other Locations</a></h3>
                                                        <p class="card-meta">
                                                            <span class="post__date"> 1 March, 2020</span>
                                                            <span class="post-dot"></span>
                                                            <span class="post__time">3 Mins read</span>
                                                        </p>
                                                    </div>
                                            </div>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <div class="author-content d-flex align-items-center">
                                                    <div class="author-img">
                                                        <img src="assets/images/small-team3.jpg" alt="testimonial image"/>
                                                    </div>
                                                    <div class="author-bio">
                                                        <a href="#" class="author__title">Luke Jacobs</a>
                                                    </div>
                                                </div>
                                                <div class="post-share">
                                                    <ul>
                                                        <li>
                                                            <i class="la la-share icon-element"></i>
                                                            <ul class="post-share-dropdown d-flex align-items-center">
                                                                <li><a href="#"><i class="lab la-facebook-f"></i></a></li>
                                                                <li><a href="#"><i class="lab la-twitter"></i></a></li>
                                                                <li><a href="#"><i class="lab la-instagram"></i></a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="btn-box mt-3 text-center">
                                            <button type="button" class="theme-btn"><i class="la la-refresh mr-1"></i>Load More</button>
                                            <p class="font-size-13 pt-2">Showing 1 - 12 of 44 Posts</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="sidebar mb-0">
                                    <div class="sidebar-widget">
                                        <h3 class="title stroke-shape">Search Post</h3>
                                        <div class="contact-form-action">
                                            <form action="#">
                                                <div class="input-box">
                                                    <div class="form-group mb-0">
                                                        <input class="form-control pl-3" type="text" placeholder="Type your keywords..."/>
                                                            <button class="search-btn" type="submit"><i class="la la-search"></i></button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="sidebar-widget">
                                        <h3 class="title stroke-shape">Categories</h3>
                                        <div class="sidebar-category">
                                            <div class="custom-checkbox">
                                                <input type="checkbox" id="cat1"/>
                                                    <label for="cat1">All <span class="font-size-13 ml-1">(55)</span></label>
                                            </div>
                                            <div class="custom-checkbox">
                                                <input type="checkbox" id="cat2"/>
                                                    <label for="cat2">Active Adventure Tours <span class="font-size-13 ml-1">(8)</span></label>
                                            </div>
                                            <div class="custom-checkbox">
                                                <input type="checkbox" id="cat3"/>
                                                    <label for="cat3">Ecotourism <span class="font-size-13 ml-1">(5)</span></label>
                                            </div>
                                            <div class="custom-checkbox">
                                                <input type="checkbox" id="cat4"/>
                                                    <label for="cat4">Escorted Tours <span class="font-size-13 ml-1">(2)</span></label>
                                            </div>
                                            <div class="custom-checkbox">
                                                <input type="checkbox" id="cat5"/>
                                                    <label for="cat5">Group Tours <span class="font-size-13 ml-1">(11)</span></label>
                                            </div>
                                            <div class="custom-checkbox">
                                                <input type="checkbox" id="cat6"/>
                                                    <label for="cat6">Ligula <span class="font-size-13 ml-1">(3)</span></label>
                                            </div>
                                            <div class="collapse" id="categoryMenu">
                                                <div class="custom-checkbox">
                                                    <input type="checkbox" id="cat7"/>
                                                        <label for="cat7">Family Tours <span class="font-size-13 ml-1">(4)</span></label>
                                                </div>
                                                <div class="custom-checkbox">
                                                    <input type="checkbox" id="cat8"/>
                                                        <label for="cat8">City Trips <span class="font-size-13 ml-1">(5)</span></label>
                                                </div>
                                                <div class="custom-checkbox">
                                                    <input type="checkbox" id="cat9"/>
                                                        <label for="cat9">National Parks Tours <span class="font-size-13 ml-1">(3)</span></label>
                                                </div>
                                                <div class="custom-checkbox">
                                                    <input type="checkbox" id="cat10"/>
                                                        <label for="cat10">Vacations <span class="font-size-13 ml-1">(3)</span></label>
                                                </div>
                                                <div class="custom-checkbox">
                                                    <input type="checkbox" id="cat11"/>
                                                        <label for="cat11">Early booking <span class="font-size-13 ml-1">(7)</span></label>
                                                </div>
                                                <div class="custom-checkbox">
                                                    <input type="checkbox" id="cat12"/>
                                                        <label for="cat12">Last minute <span class="font-size-13 ml-1">(2)</span></label>
                                                </div>
                                            </div>
                                            <a class="btn-text" data-toggle="collapse" href="#categoryMenu" role="button" aria-expanded="false" aria-controls="categoryMenu">
                                                <span class="show-more">Show More <i class="la la-angle-down"></i></span>
                                                <span class="show-less">Show Less <i class="la la-angle-up"></i></span>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="sidebar-widget">
                                        <div class="section-tab section-tab-2 pb-3">
                                            <ul class="nav nav-tabs justify-content-center" id="myTab3" role="tablist">
                                                <li class="nav-item">
                                                    <a class="nav-link" id="recent-tab" data-toggle="tab" href="#recent" role="tab" aria-controls="recent" aria-selected="true">
                                                        Recent
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link active" id="popular-tab" data-toggle="tab" href="#popular" role="tab" aria-controls="popular" aria-selected="false">
                                                        Popular
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" id="new-tab" data-toggle="tab" href="#new" role="tab" aria-controls="new" aria-selected="false">
                                                        New
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="tab-content" id="myTabContent">
                                            <div class="tab-pane " id="recent" role="tabpanel" aria-labelledby="recent-tab">
                                                <div class="card-item card-item-list recent-post-card">
                                                    <div class="card-img">
                                                        <a href="blog-single.html" class="d-block">
                                                            <img src="assets/images/small-img4.jpg" alt="blog-img"/>
                                                        </a>
                                                    </div>
                                                    <div class="card-body">
                                                        <h3 class="card-title"><a href="blog-single.html">Pack wisely before traveling</a></h3>
                                                        <p class="card-meta">
                                                            <span class="post__date"> 1 March, 2020</span>
                                                            <span class="post-dot"></span>
                                                            <span class="post__time">3 Mins read</span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="card-item card-item-list recent-post-card">
                                                    <div class="card-img">
                                                        <a href="blog-single.html" class="d-block">
                                                            <img src="assets/images/small-img5.jpg" alt="blog-img"/>
                                                        </a>
                                                    </div>
                                                    <div class="card-body">
                                                        <h3 class="card-title"><a href="blog-single.html">Change your place and get the fresh air</a></h3>
                                                        <p class="card-meta">
                                                            <span class="post__date"> 1 March, 2020</span>
                                                            <span class="post-dot"></span>
                                                            <span class="post__time">3 Mins read</span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="card-item card-item-list recent-post-card mb-0">
                                                    <div class="card-img">
                                                        <a href="blog-single.html" class="d-block">
                                                            <img src="assets/images/small-img6.jpg" alt="blog-img"/>
                                                        </a>
                                                    </div>
                                                    <div class="card-body">
                                                        <h3 class="card-title"><a href="blog-single.html">Introducing this amazing city</a></h3>
                                                        <p class="card-meta">
                                                            <span class="post__date"> 1 March, 2020</span>
                                                            <span class="post-dot"></span>
                                                            <span class="post__time">3 Mins read</span>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade show active" id="popular" role="tabpanel" aria-labelledby="popular-tab">
                                                <div class="card-item card-item-list recent-post-card">
                                                    <div class="card-img">
                                                        <a href="blog-single.html" class="d-block">
                                                            <img src="assets/images/small-img7.jpg" alt="blog-img"/>
                                                        </a>
                                                    </div>
                                                    <div class="card-body">
                                                        <h3 class="card-title"><a href="blog-single.html">The Castle on the Cliff: Majestic, Magic</a></h3>
                                                        <p class="card-meta">
                                                            <span class="post__date"> 1 March, 2020</span>
                                                            <span class="post-dot"></span>
                                                            <span class="post__time">3 Mins read</span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="card-item card-item-list recent-post-card">
                                                    <div class="card-img">
                                                        <a href="blog-single.html" class="d-block">
                                                            <img src="assets/images/small-img8.jpg" alt="blog-img"/>
                                                        </a>
                                                    </div>
                                                    <div class="card-body">
                                                        <h3 class="card-title"><a href="blog-single.html">Change your place and get the fresh air</a></h3>
                                                        <p class="card-meta">
                                                            <span class="post__date"> 1 March, 2020</span>
                                                            <span class="post-dot"></span>
                                                            <span class="post__time">3 Mins read</span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="card-item card-item-list recent-post-card mb-0">
                                                    <div class="card-img">
                                                        <a href="blog-single.html" class="d-block">
                                                            <img src="assets/images/small-img9.jpg" alt="blog-img"/>
                                                        </a>
                                                    </div>
                                                    <div class="card-body">
                                                        <h3 class="card-title"><a href="blog-single.html">All Aboard the Rocky Mountaineer</a></h3>
                                                        <p class="card-meta">
                                                            <span class="post__date"> 1 March, 2020</span>
                                                            <span class="post-dot"></span>
                                                            <span class="post__time">3 Mins read</span>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane " id="new" role="tabpanel" aria-labelledby="new-tab">
                                                <div class="card-item card-item-list recent-post-card">
                                                    <div class="card-img">
                                                        <a href="blog-single.html" class="d-block">
                                                            <img src="assets/images/small-img7.jpg" alt="blog-img"/>
                                                        </a>
                                                    </div>
                                                    <div class="card-body">
                                                        <h3 class="card-title"><a href="blog-single.html">The Castle on the Cliff: Majestic, Magic</a></h3>
                                                        <p class="card-meta">
                                                            <span class="post__date"> 1 March, 2020</span>
                                                            <span class="post-dot"></span>
                                                            <span class="post__time">3 Mins read</span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="card-item card-item-list recent-post-card">
                                                    <div class="card-img">
                                                        <a href="blog-single.html" class="d-block">
                                                            <img src="assets/images/small-img8.jpg" alt="blog-img"/>
                                                        </a>
                                                    </div>
                                                    <div class="card-body">
                                                        <h3 class="card-title"><a href="blog-single.html">Change your place and get the fresh air</a></h3>
                                                        <p class="card-meta">
                                                            <span class="post__date"> 1 March, 2020</span>
                                                            <span class="post-dot"></span>
                                                            <span class="post__time">3 Mins read</span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="card-item card-item-list recent-post-card mb-0">
                                                    <div class="card-img">
                                                        <a href="blog-single.html" class="d-block">
                                                            <img src="assets/images/small-img9.jpg" alt="blog-img"/>
                                                        </a>
                                                    </div>
                                                    <div class="card-body">
                                                        <h3 class="card-title"><a href="blog-single.html">All Aboard the Rocky Mountaineer</a></h3>
                                                        <p class="card-meta">
                                                            <span class="post__date"> 1 March, 2020</span>
                                                            <span class="post-dot"></span>
                                                            <span class="post__time">3 Mins read</span>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="sidebar-widget">
                                        <h3 class="title stroke-shape">Archives</h3>
                                        <div class="sidebar-list">
                                            <ul class="list-items">
                                                <li><i class="la la-dot-circle mr-2 text-color"></i><a href="#">June 2015</a></li>
                                                <li><i class="la la-dot-circle mr-2 text-color"></i><a href="#">May 2016</a></li>
                                                <li><i class="la la-dot-circle mr-2 text-color"></i><a href="#">April 2017</a></li>
                                                <li><i class="la la-dot-circle mr-2 text-color"></i><a href="#">February 2019</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="sidebar-widget">
                                        <h3 class="title stroke-shape">Tag Cloud</h3>
                                        <ul class="tag-list">
                                            <li><a href="#">Travel</a></li>
                                            <li><a href="#">Adventure</a></li>
                                            <li><a href="#">Tour</a></li>
                                            <li><a href="#">Nature</a></li>
                                            <li><a href="#">Island</a></li>
                                            <li><a href="#">Parks</a></li>
                                            <li><a href="#">Cruise</a></li>
                                            <li><a href="#">Mountains</a></li>
                                            <li><a href="#">Tulips</a></li>
                                            <li><a href="#">Museums</a></li>
                                            <li><a href="#">Beaches</a></li>
                                            <li><a href="#">Cultural</a></li>
                                            <li><a href="#">National</a></li>
                                        </ul>
                                    </div>
                                    <div class="sidebar-widget">
                                        <h3 class="title stroke-shape">Follow & Connect</h3>
                                        <ul class="social-profile">
                                            <li><a href="#"><i class="lab la-facebook-f"></i></a></li>
                                            <li><a href="#"><i class="lab la-twitter"></i></a></li>
                                            <li><a href="#"><i class="lab la-instagram"></i></a></li>
                                            <li><a href="#"><i class="lab la-linkedin-in"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default Blog;