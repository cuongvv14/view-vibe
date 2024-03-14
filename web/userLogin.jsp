<%-- 
    Document   : userLogin
    Created on : Oct 26, 2023, 10:00:09 PM
    Author     : acer
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <link rel="icon" href="https://oren.azyrusthemes.com/images/Favicon.png">
        <link rel="stylesheet" type="text/css" href="./css/animate.css">
        <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="./css/flatpickr.min.css">
        <link rel="stylesheet" type="text/css" href="./css/fontello.css">
        <link rel="stylesheet" type="text/css" href="./css/fontello-codes.css">
        <link rel="stylesheet" type="text/css" href="./css/thumbs-embedded.css">
        <link rel="stylesheet" type="text/css" href="./css/style.css">
        <link rel="stylesheet" type="text/css" href="./css/responsive.css">
        <link rel="stylesheet" type="text/css" href="./css/color.css">
        <link rel="stylesheet" href="https://cdn.lineicons.com/4.0/lineicons.css" />
    </head>
    <body>

        <div class="side_menu" style="top: 90.3333px;">
            <div class="form_dvv">
                <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="" class="login_form_show">Sign in</a>
            </div>
            <div class="sd_menu">
                <ul class="mm_menu">
                    <li>
                        <span>
                            <i class="icon-home"></i>
                        </span>
                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">Home</a>
                    </li>
                    <li>
                        <span>
                            <i class="icon-fire"></i>
                        </span>
                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">Trending</a>
                    </li>
                    <li>
                        <span>
                            <i class="icon-subscriptions"></i>
                        </span>
                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">Subscriptions</a>
                    </li>
                </ul>
            </div><!--sd_menu end-->
            <div class="sd_menu">
                <h3>Library</h3>
                <ul class="mm_menu">
                    <li>
                        <span>
                            <i class="icon-history"></i>
                        </span>
                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">History</a>
                    </li>
                    <li>
                        <span>
                            <i class="icon-watch_later"></i>
                        </span>
                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">Watch Later</a>
                    </li>
                    <li>
                        <span>
                            <i class="icon-purchased"></i>
                        </span>
                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">Purchases</a>
                    </li>
                    <li>
                        <span>
                            <i class="icon-like"></i>
                        </span>
                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">Liked Videos</a>
                    </li>
                    <li>
                        <span>
                            <i class="icon-play_list"></i>
                        </span>
                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">Playlist</a>
                    </li>
                </ul>
            </div><!--sd_menu end-->
            <div class="sd_menu subs_lst">
                <h3>Subscriptions</h3>
                <ul class="mm_menu">
                    <li>
                        <span class="usr_name">
                            <img src="./user login_files/th1.png" alt="">
                        </span>
                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">Dr Disrespect</a>
                        <small>3</small>
                    </li>
                    <li>
                        <span class="usr_name">
                            <img src="./user login_files/th2.png" alt="">
                        </span>
                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">ASMR</a>
                        <small>6</small>
                    </li>
                    <li>
                        <span class="usr_name">
                            <img src="./user login_files/th3.png" alt="">
                        </span>
                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">Rivvrs</a>
                        <small>2</small>
                    </li>
                    <li>
                        <span class="usr_name">
                            <img src="./user login_files/th4.png" alt="">
                        </span>
                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">The Verge</a>
                        <small>11</small>
                    </li>
                    <li>
                        <span class="usr_name">
                            <img src="./user login_files/th5.png" alt="">
                        </span>
                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">Seeker</a>
                        <small>3</small>
                    </li>
                    <li>
                        <span class="usr_name">
                            <img src="./user login_files/sn.png" alt="">
                        </span>
                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">Music</a>
                        <small>20</small>
                    </li>
                </ul>
                <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="" class="more-ch"><i class="icon-arrow_below"></i> Show 14 more</a>
            </div><!--sd_menu end-->
            <div class="sd_menu">
                <ul class="mm_menu">
                    <li>
                        <span>
                            <i class="icon-settings"></i>
                        </span>
                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">Settings</a>
                    </li>
                    <li>
                        <span>
                            <i class="icon-flag"></i>
                        </span>
                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">Report history</a>
                    </li>
                    <li>
                        <span>
                            <i class="icon-logout"></i>
                        </span>
                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">Sign out</a>
                    </li>
                </ul>
            </div><!--sd_menu end-->
            <div class="sd_menu m_linkz">
                <ul class="mm_menu">
                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#">About</a></li>
                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#">Community Rules </a></li>
                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#">Privacy</a></li>
                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#">Terms</a></li>
                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#">Blogs</a></li>
                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#">Contracts </a></li>
                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#">Donate</a></li>
                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#">FAQ</a></li>
                </ul>
                <span>azyrusthemes</span>
            </div><!--sd_menu end-->
            <div class="sd_menu bb-0">
                <ul class="social_links">
                    <li>
                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">
                            <i class="icon-facebook-official"></i>
                        </a>
                    </li>
                    <li>
                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">
                            <i class="icon-twitter"></i>
                        </a>
                    </li>
                    <li>
                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">
                            <i class="icon-instagram"></i>
                        </a>
                    </li>
                </ul><!--social_links end-->
            </div><!--sd_menu end-->
            <div class="dd_menu"></div>
        </div><!--side_menu end-->

        <section class="user-account">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="sidebar">
                            <div class="widget video_info pr sp">
                                <span class="vc_hd">
                                    <img src="./user login_files/sn.png" alt="">
                                </span>
                                <h4>ScereBro</h4>
                                <p>since: Dec 17, 2017 </p>
                                <span>Last Login: 42 minutes ago</span>
                            </div><!--video_info pr-->
                            <div class="widget account">
                                <h2 class="hd-uc"> <i class="icon-user"></i> Account</h2>
                                <ul>
                                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#">My Account</a></li>
                                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#">Blocked Users</a></li>
                                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#"> Change Password</a></li>
                                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#">Change Email</a></li>
                                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#">Manage Subscriptions </a></li>
                                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#">Contacts Manager </a></li>
                                </ul>
                            </div><!--account end-->
                            <div class="widget notifications">
                                <h2 class="hd-uc"><i class="icon-notification"></i>Notifications</h2>
                                <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">Manage Notifications</a>
                            </div><!--notifications end-->
                            <div class="widget donation">
                                <h2 class="hd-uc"><i class="icon-donations"></i>Donations </h2>
                                <ul>
                                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#">Manage Donations </a></li>
                                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#">Add Credit</a></li>
                                </ul>
                            </div><!--donation end-->
                            <div class="widget chanel-pro">
                                <h2 class="hd-uc"><i class="icon-preferences"></i>Channel and Profile  </h2>
                                <ul>
                                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#"> Account Settings</a></li>
                                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#"> Profile Settings </a></li>
                                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#"> Change Avatar</a></li>
                                </ul>
                            </div><!--chanel-pro end-->
                            <div class="widget vid-ac">
                                <h2 class="hd-uc"><i class="icon-play"></i>Videos </h2>
                                <ul>
                                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#">Uploaded Videos </a></li>
                                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#"> Favorite Videos </a></li>
                                </ul>
                            </div><!--vid-ac end-->
                            <div class="widget playlist">
                                <h2 class="hd-uc"><i class="icon-add_to_playlist"></i>Playlists  </h2>
                                <span><a href="https://oren.azyrusthemes.com/User_Account_Page.html#"> Manage Playlists</a></span>
                            </div><!--playlist end-->
                            <div class="widget messages">
                                <h2 class="hd-uc"><i class="icon-message"></i> Messages</h2>
                                <ul>
                                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#">New Message</a></li>
                                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#"> Inbox (10)</a></li>
                                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#"> Sent</a></li>
                                </ul>
                            </div><!--messages end-->
                            <div class="widget contacts">
                                <h2 class="hd-uc"><i class="icon-group"></i>Contacts</h2>
                                <ul>
                                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title=""> Manage Contacts</a></li>
                                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">Add Contact </a></li>
                                </ul>
                            </div><!-- Contacts  end-->
                        </div><!--sidebar end-->
                    </div>
                    <div class="col-lg-9">
                        <div class="video-details">
                            <div class="latest_vidz">
                                <div class="latest-vid-option">
                                    <h2 class="hd-op"> Latest Videos</h2>
                                    <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="" class="op-1">Video Details</a>
                                    <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="" class="op-2"> Options</a>
                                    <div class="clearfix"></div>
                                </div><!--latest-vid-option end-->
                                <div class="vidz_list">
                                    <div class="tb-pr">
                                        <div class="row">
                                            <div class="col-xl-8 col-lg-9 col-md-9 col-sm-12">
                                                <div class="tab-history acct_page">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl ms br">
                                                            <a href="https://oren.azyrusthemes.com/single_video_page.html" title="">
                                                                <img src="./user login_files/vide1.png" alt="">
                                                                <span class="vid-time">30:32</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info ms br">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Kingdom Come: Deliverance Funny Moments and Fails Compilation</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">newfox media</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                                            <span>686K views . 1 week ago</span>
                                                            <ul>
                                                                <li><span class="br-1">Inactive</span></li>
                                                                <li><span class="br-2">Successful</span></li>
                                                            </ul>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div><!--videoo end-->
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-lg-3 col-md-3 col-sm-12">
                                                <div class="icon-list">
                                                    <ul>
                                                        <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title=""><i class="icon-play"></i></a></li>
                                                        <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title=""><i class="icon-pencil"></i></a></li>
                                                        <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title=""><i class="icon-cancel"></i></a></li>
                                                    </ul>
                                                </div><!--icon-list end-->
                                            </div>
                                        </div>
                                    </div><!--tb-pr end-->
                                    <div class="tb-pr">
                                        <div class="row">
                                            <div class="col-xl-8 col-lg-9 col-md-9 col-sm-12">
                                                <div class="tab-history acct_page">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl ms br">
                                                            <a href="https://oren.azyrusthemes.com/single_video_page.html" title="">
                                                                <img src="./user login_files/vide2.png" alt="">
                                                                <span class="vid-time">30:32</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info ms br">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">DR DISRESPECT - Before They Were Famous - Twitch Streamer</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">Eros Now</a></h4>
                                                            <span>283K views . 3 months ago</span>
                                                            <ul>
                                                                <li><span class="br-1">Inactive</span></li>
                                                                <li><span class="br-2">Successful</span></li>
                                                            </ul>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div><!--videoo end-->
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-lg-3 col-md-3 col-sm-12">
                                                <div class="icon-list">
                                                    <ul>
                                                        <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title=""><i class="icon-play"></i></a></li>
                                                        <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title=""><i class="icon-pencil"></i></a></li>
                                                        <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title=""><i class="icon-cancel"></i></a></li>
                                                    </ul>
                                                </div><!--icon-list end-->
                                            </div>
                                        </div>
                                    </div><!--tb-pr end-->
                                    <div class="tb-pr">
                                        <div class="row">
                                            <div class="col-xl-8 col-lg-9 col-md-9 col-sm-12">
                                                <div class="tab-history acct_page">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl ms br">
                                                            <a href="https://oren.azyrusthemes.com/single_video_page.html" title="">
                                                                <img src="./user login_files/vide3.png" alt="">
                                                                <span class="vid-time">30:32</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info ms br">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Top Perectly Timed Twitch Moments 2017 #7</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">Animal Planet</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                                            <span>2.6M views . 2 months ago</span>
                                                            <ul>
                                                                <li><span class="br-3">Active</span></li>
                                                                <li><span class="br-2">Successful</span></li>
                                                            </ul>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div><!--videoo end-->
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-lg-3 col-md-3 col-sm-12">
                                                <div class="icon-list">
                                                    <ul>
                                                        <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title=""><i class="icon-play"></i></a></li>
                                                        <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title=""><i class="icon-pencil"></i></a></li>
                                                        <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title=""><i class="icon-cancel"></i></a></li>
                                                    </ul>
                                                </div><!--icon-list end-->
                                            </div>
                                        </div>
                                    </div><!--tb-pr end-->
                                </div><!--vidz_list end-->
                            </div><!--latest_vidz end-->
                            <div class="blocked-users">
                                <h2 class="hd-op">  Blocked Users </h2>
                                <form>
                                    <input type="text" placeholder=" Separate usernames by comma">
                                    <button type="submit"> Update</button>
                                </form>
                                <ul class="optz_list">
                                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">User</a></li>
                                    <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">Options</a></li>
                                </ul><!--optz_list end-->
                                <div class="clearfix"></div>
                            </div><!--Blocked Users end-->
                            <div class="blocked-pr">
                                <div class="blocked-vcp">
                                    <div class="vcp_inf">
                                        <span class="vc_hd">
                                            <img src="./user login_files/sn.png" alt="">
                                        </span>
                                        <div class="vc_info st">
                                            <h4><a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">ScereBro</a></h4>
                                            <span>Blocked on Oct 22, 2017</span>
                                        </div>
                                    </div><!--vcp_inf end-->
                                    <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="" class="play_ms">
                                        <i class="icon-blocked"></i>
                                    </a>
                                </div><!--blocked-vcp-->
                                <div class="blocked-vcp">
                                    <div class="vcp_inf">
                                        <span class="vc_hd">
                                            <img src="./user login_files/th1.png" alt="">
                                        </span>
                                        <div class="vc_info st">
                                            <h4><a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">Doge</a></h4>
                                            <span>Blocked 20 hours ago</span>
                                        </div>
                                    </div><!--vcp_inf end-->
                                    <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="" class="play_ms">
                                        <i class="icon-blocked"></i>
                                    </a>
                                </div><!--blocked-vcp-->
                                <div class="blocked-vcp">
                                    <div class="vcp_inf">
                                        <span class="vc_hd">
                                            <img src="./user login_files/th3.png" alt="">
                                        </span>
                                        <div class="vc_info st">
                                            <h4><a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">Menji</a></h4>
                                            <span>Blocked 1 week ago</span>
                                        </div>
                                    </div><!--vcp_inf end-->
                                    <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="" class="play_ms">
                                        <i class="icon-blocked"></i>
                                    </a>
                                </div><!--blocked-vcp-->
                            </div><!--blocked-pr end-->
                            <div class="change-pswd">
                                <h2 class="hd-op">Change password</h2>
                                <form>
                                    <div class="ch-pswd">
                                        <input type="password" name="old_password" placeholder="Old Password">
                                    </div><!--ch-pswd end-->
                                    <div class="ch-pswd">
                                        <input type="password" name="new_password" placeholder=" New Password">
                                    </div><!--ch-pswd end-->
                                    <div class="ch-pswd">
                                        <input type="password" name="confirm_password" placeholder="Confirm New Password">
                                    </div><!--ch-pswd end-->
                                    <div class="ch-pswd">
                                        <button type="submit"> Update</button>
                                    </div><!--ch-pswd end-->
                                </form>
                            </div><!--change-pswd end-->
                            <div class="blocked-pr mange_sub">
                                <div class="manage-sub">
                                    <h2 class="hd-op"> Manage Subscriptions </h2>
                                    <ul class="optz_list">
                                        <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">User</a></li>
                                        <li><a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">Options</a></li>
                                    </ul><!--optz_list end-->
                                    <div class="clearfix"></div>
                                </div><!--Manage-Sub end-->
                                <div class="blckd_list">
                                    <div class="blocked-vcp">
                                        <div class="vcp_inf">
                                            <span class="vc_hd">
                                                <img src="./user login_files/th4.png" alt="">
                                            </span>
                                            <div class="vc_info st">
                                                <h4><a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">ScereBro</a></h4>
                                                <span>Subscribed 3 months ago</span>
                                            </div>
                                        </div><!--vcp_inf end-->
                                        <span class="active-mb pr"> Active</span>
                                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="" class="play_ms">
                                            Action
                                            <i class="icon-arrow_below"></i>
                                        </a>
                                        <div class="clearfix"></div>
                                    </div><!--blocked-vcp-->
                                    <div class="blocked-vcp">
                                        <div class="vcp_inf">
                                            <span class="vc_hd">
                                                <img src="./user login_files/th5.png" alt="">
                                            </span>
                                            <div class="vc_info st">
                                                <h4><a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">Doge</a></h4>
                                                <span>Subscribed 16 months ago</span>
                                            </div>
                                        </div><!--vcp_inf end-->
                                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="" class="play_ms">
                                            Action
                                            <i class="icon-arrow_below"></i>
                                        </a>
                                        <span class="active-mb sr"> Inactive</span>
                                        <div class="clearfix"></div>
                                    </div><!--blocked-vcp-->
                                    <div class="blocked-vcp">
                                        <div class="vcp_inf">
                                            <span class="vc_hd">
                                                <img src="./user login_files/th3.png" alt="">
                                            </span>
                                            <div class="vc_info st">
                                                <h4><a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="">Menji</a></h4>
                                                <span>Subscribed 2 years ago</span>
                                            </div>
                                        </div><!--vcp_inf end-->
                                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="" class="play_ms">
                                            Action
                                            <i class="icon-arrow_below"></i>
                                        </a>
                                        <span class="active-mb mr">  Paused</span>
                                        <div class="clearfix"></div>
                                    </div><!--blocked-vcp-->
                                </div>
                            </div><!--blocked-pr end-->
                            <div class="account-details">
                                <div class="account_details_content">
                                    <h2 class="hd-op">  Account Details </h2>
                                    <h4 class="slct-hd">Country</h4>
                                    <div class="slct_optz">
                                        <select>
                                            <option>United States</option>
                                            <option>United States</option>
                                            <option>United States</option>
                                            <option>United States</option>
                                        </select>
                                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="" class="arw_vz">
                                            <i class="icon-arrow_below"></i>
                                        </a>
                                    </div>
                                    <h4 class="slct-hd"> Gender</h4>
                                    <ul class="gend">
                                        <li>
                                            <div class="chekbox-lg">
                                                <label>
                                                    <input type="radio" name="gender" value="male">
                                                    <b class="checkmark"></b>
                                                    <span>Male</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="chekbox-lg">
                                                <label>
                                                    <input type="radio" name="gender" value="female">
                                                    <b class="checkmark"> </b>
                                                    <span>Female</span>
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                    <h4 class="slct-hd">Account Details </h4>
                                    <div class="slct_optz">
                                        <select>
                                            <option> ABGC</option>
                                            <option> ABGC</option>
                                            <option> ABGC</option>
                                            <option> ABGC</option>
                                        </select>
                                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="" class="arw_vz">
                                            <svg width="24" height="26" viewBox="0 0 24 26" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" clip-rule="evenodd" d="M19.9394 7.51447L22.0607 9.63579L12 19.6964L1.93936 9.63579L4.06068 7.51447L12 15.4538L19.9394 7.51447Z" fill="#9494A0"></path>
                                            </svg>
                                        </a>
                                    </div>
                                    <h4 class="slct-hd">Date of Birth </h4>
                                    <div class="dob flatpickr">
                                        <input type="text" name="date" class="flatpickr-input" placeholder="Select Date..." data-input="" readonly="readonly">
                                        <a href="https://oren.azyrusthemes.com/User_Account_Page.html#" title="" class="arw_vz">
                                            <i class="icon-arrow_below"></i>
                                        </a>
                                    </div>
                                    <div class="ch-pswd">
                                        <button type="submit"> Update</button>
                                    </div><!--ch-pswd end-->
                                </div><!--account_details_content end-->
                                <div class="clearfix"></div>
                            </div><!--Account Details end-->
                        </div><!--video-details end-->
                    </div>
                </div>
            </div>
        </section><!--user-account end-->



        <script src="./js/jquery.min.js.download"></script>
        <script src="./js/popper.js.download"></script>
        <script src="./js/bootstrap.min.js.download"></script>
        <script src="./js/flatpickr.js.download"></script>
        <script src="./js/script.js.download"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    </body>
</html>
