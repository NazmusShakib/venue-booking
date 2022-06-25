import React, {Component} from 'react';
import {Link} from "react-router-dom";

class LatestBlog extends Component {
    render() {
        return (
            <>
                <section className="blog-area padding-top-30px padding-bottom-90px">
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12">
                                <div className="section-heading text-center">
                                    <h2 className="sec__title line-height-55">
                                        Latest News & Articles <br/>
                                        You Might Like
                                    </h2>
                                </div>
                            </div>
                        </div>
                        <div className="row padding-top-50px">
                            <div className="col-lg-4 responsive-column">
                                <div className="card-item blog-card">
                                    <div className="card-img">
                                        <img src="assets/images/blog-img.jpg" alt="blog-img"/>
                                        <div className="post-format icon-element">
                                            <i className="la la-photo"></i>
                                        </div>
                                        <div className="card-body">
                                            <div className="post-categories">
                                                <a href="#" className="badge">Travel</a>
                                                <a href="#" className="badge">lifestyle</a>
                                            </div>
                                            <h3 className="card-title line-height-26">
                                                <a href="blog-single.html"
                                                >When Traveling Avoid Expensive Hotels & Resorts</a
                                                >
                                            </h3>
                                            <p className="card-meta">
                                                <span className="post__date"> 1 January, 2020</span>
                                                <span className="post-dot"></span>
                                                <span className="post__time">5 Mins read</span>
                                            </p>
                                        </div>
                                    </div>
                                    <div
                                        className="card-footer d-flex align-items-center justify-content-between"
                                    >
                                        <div className="author-content d-flex align-items-center">
                                            <div className="author-img">
                                                <img src="assets/images/small-team1.jpg" alt="testimonial image"/>
                                            </div>
                                            <div className="author-bio">
                                                <a href="#" className="author__title">Leroy Bell</a>
                                            </div>
                                        </div>
                                        <div className="post-share">
                                            <ul>
                                                <li>
                                                    <i className="la la-share icon-element"></i>
                                                    <ul className="post-share-dropdown d-flex align-items-center">
                                                        <li>
                                                            <a href="#"><i className="lab la-facebook-f"></i></a>
                                                        </li>
                                                        <li>
                                                            <a href="#"><i className="lab la-twitter"></i></a>
                                                        </li>
                                                        <li>
                                                            <a href="#"><i className="lab la-instagram"></i></a>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="col-lg-4 responsive-column">
                                <div className="card-item blog-card">
                                    <div className="card-img">
                                        <img src="assets/images/blog-img2.jpg" alt="blog-img"/>
                                        <div className="post-format icon-element">
                                            <i className="la la-play"></i>
                                        </div>
                                        <div className="card-body">
                                            <div className="post-categories">
                                                <a href="#" className="badge">Video</a>
                                            </div>
                                            <h3 className="card-title line-height-26">
                                                <a href="blog-single.html"
                                                >My Best Travel Tips: The Ultimate Travel Guide</a
                                                >
                                            </h3>
                                            <p className="card-meta">
                                                <span className="post__date"> 1 February, 2020</span>
                                                <span className="post-dot"></span>
                                                <span className="post__time">4 Mins read</span>
                                            </p>
                                        </div>
                                    </div>
                                    <div
                                        className="card-footer d-flex align-items-center justify-content-between"
                                    >
                                        <div className="author-content d-flex align-items-center">
                                            <div className="author-img">
                                                <img src="assets/images/small-team2.jpg" alt="testimonial image"/>
                                            </div>
                                            <div className="author-bio">
                                                <a href="#" className="author__title">Phillip Hunt</a>
                                            </div>
                                        </div>
                                        <div className="post-share">
                                            <ul>
                                                <li>
                                                    <i className="la la-share icon-element"></i>
                                                    <ul className="post-share-dropdown d-flex align-items-center">
                                                        <li>
                                                            <a href="#"><i className="lab la-facebook-f"></i></a>
                                                        </li>
                                                        <li>
                                                            <a href="#"><i className="lab la-twitter"></i></a>
                                                        </li>
                                                        <li>
                                                            <a href="#"><i className="lab la-instagram"></i></a>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="col-lg-4 responsive-column">
                                <div className="card-item blog-card">
                                    <div className="card-img">
                                        <img src="assets/images/blog-img3.jpg" alt="blog-img"/>
                                        <div className="post-format icon-element">
                                            <i className="la la-music"></i>
                                        </div>
                                        <div className="card-body">
                                            <div className="post-categories">
                                                <a href="#" className="badge">audio</a>
                                            </div>
                                            <h3 className="card-title line-height-26">
                                                <a href="blog-single.html"
                                                >By all Means, Travel to Popular Sites & Don’t Rule Out
                                                    Other Locations</a
                                                >
                                            </h3>
                                            <p className="card-meta">
                                                <span className="post__date"> 1 March, 2020</span>
                                                <span className="post-dot"></span>
                                                <span className="post__time">3 Mins read</span>
                                            </p>
                                        </div>
                                    </div>
                                    <div
                                        className="card-footer d-flex align-items-center justify-content-between"
                                    >
                                        <div className="author-content d-flex align-items-center">
                                            <div className="author-img">
                                                <img src="assets/images/small-team3.jpg" alt="testimonial image"/>
                                            </div>
                                            <div className="author-bio">
                                                <a href="#" className="author__title">Luke Jacobs</a>
                                            </div>
                                        </div>
                                        <div className="post-share">
                                            <ul>
                                                <li>
                                                    <i className="la la-share icon-element"></i>
                                                    <ul className="post-share-dropdown d-flex align-items-center">
                                                        <li>
                                                            <a href="#"><i className="lab la-facebook-f"></i></a>
                                                        </li>
                                                        <li>
                                                            <a href="#"><i className="lab la-twitter"></i></a>
                                                        </li>
                                                        <li>
                                                            <a href="#"><i className="lab la-instagram"></i></a>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-lg-12">
                                <div className="btn-box text-center pt-4">
                                    <Link to="/blog" className="theme-btn">Read More Post</Link>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default LatestBlog;