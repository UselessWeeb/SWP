<%-- 
    Document   : about.jsp
    Created on : May 16, 2024, 3:15:00 PM
    Author     : M7510
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>About</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="author" content="">
        <meta name="keywords" content="">
        <meta name="description" content="">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap" rel="stylesheet">
    </head>

    <body>
    <%@include file = "view/header.jsp" %>
    <section id="company-services" class="padding-large">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 pb-3 pb-lg-0">
                    <div class="icon-box d-flex">
                        <div class="icon-box-icon pe-3 pb-3">
                            <svg class="cart-outline">
                            <use xlink:href="#cart-outline" />
                            </svg>
                        </div>
                        <div class="icon-box-content">
                            <h4 class="card-title mb-1 text-uppercase text-dark">Free delivery</h4>
                            <p>Consectetur adipi elit lorem ipsum dolor sit amet.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 pb-3 pb-lg-0">
                    <div class="icon-box d-flex">
                        <div class="icon-box-icon pe-3 pb-3">
                            <svg class="quality">
                            <use xlink:href="#quality" />
                            </svg>
                        </div>
                        <div class="icon-box-content">
                            <h4 class="card-title mb-1 text-uppercase text-dark">Quality guarantee</h4>
                            <p>Dolor sit amet orem ipsu mcons ectetur adipi elit.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 pb-3 pb-lg-0">
                    <div class="icon-box d-flex">
                        <div class="icon-box-icon pe-3 pb-3">
                            <svg class="price-tag">
                            <use xlink:href="#price-tag" />
                            </svg>
                        </div>
                        <div class="icon-box-content">
                            <h4 class="card-title mb-1 text-uppercase text-dark">Daily offers</h4>
                            <p>Amet consectetur adipi elit loreme ipsum dolor sit.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 pb-3 pb-lg-0">
                    <div class="icon-box d-flex">
                        <div class="icon-box-icon pe-3 pb-3">
                            <svg class="shield-plus">
                            <use xlink:href="#shield-plus" />
                            </svg>
                        </div>
                        <div class="icon-box-content">
                            <h4 class="card-title mb-1 text-uppercase text-dark">100% secure payment</h4>
                            <p>Rem Lopsum dolor sit amet, consectetur adipi elit.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="about-us" class="padding-large pt-0">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="image-holder position-relative mb-4 d-flex align-items-center justify-content-center">
                        <a type="button" data-bs-toggle="modal" data-src="https://www.youtube.com/embed/l4MOE3hZATA" data-bs-target="#myModal" class="play-btn position-absolute">
                            <div class="play-icon border border-2 border-dark rounded-pill p-5">
                                <svg class="search" width="40" height="40">
                                <use xlink:href="#play"></use>
                                </svg>
                            </div>
                        </a>
                        <div class="image">
                            <img src="images/single-image-about.jpg" alt="single" class="img-fluid rounded-3 single-image">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="detail ps-md-5 mt-5">
                        <div class="display-header">
                            <h3 class="mb-3">Best Digital Store BasicStore</h3>
                            <p class="pb-1">Risus augue curabitur diam senectus congue velit et. Sed vitae metus nibh sit era. Nulla adipiscing pharetra pellentesque maecenas odio eros at. Et libero vulputate amet duis erat volutpat vitae eget. Sed vitae metus nibh sit
                                era. Nulla adipiscing pharetra eros at.
                            <p>Nulla adipiscing pharetra pellentesque maecenas odio eros at. Et libero vulputate amet duis erat volutpat vitae eget. Quam libero etiam et in ac at quis. Risus augue curabitur diam senectus congue velit et. </p>
                            <a href="shop.html" class="btn mt-3">Go to shop</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="customers-reviews" class="position-relative">
        <div class="container">
            <div class="section-title overflow-hidden mb-4">
                <h3 class="d-flex align-items-center">Customers reviews</h3>
            </div>
            <div class="position-absolute top-50 end-0 pe-0 pe-xxl-5 me-0 me-xxl-5 swiper-next testimonial-button-next">
                <svg class="chevron-forward-circle d-flex justify-content-center align-items-center border rounded-3 p-2" width="55" height="55">
                <use xlink:href="#alt-arrow-right-outline"></use>
                </svg>
            </div>
            <div class="position-absolute top-50 start-0 ps-0 ps-xxl-5 ms-0 ms-xxl-5 swiper-prev testimonial-button-prev">
                <svg class="chevron-back-circle d-flex justify-content-center align-items-center border rounded-3 p-2" width="55" height="55">
                <use xlink:href="#alt-arrow-left-outline"></use>
                </svg>
            </div>
            <div class="swiper testimonial-swiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="card position-relative text-left p-5 border rounded-3">
                            <blockquote>“I stumbled upon this tech store while searching for a new laptop, and I couldn't be happier with my experience! The staff was incredibly knowledgeable and guided me through the process of choosing the perfect device for my
                                needs. Highly recommended!”</blockquote>
                            <div class="rating text-primary">
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                            </div>
                            <h5 class="mt-1 fw-normal">Emma Chamberlin</h5>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="card position-relative text-left p-5 border rounded-3">
                            <blockquote>“This tech store is my go-to for all things tech! Whether it's a new smartphone, accessories, or even troubleshooting advice, they've always got me covered. The staff is friendly, and their expertise is unmatched. Trust me;
                                you won't regret shopping here!”</blockquote>
                            <div class="rating text-primary">
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                            </div>
                            <h5 class="mt-1 fw-normal">Thomas John</h5>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="card position-relative text-left p-5 border rounded-3">
                            <blockquote>“I recently purchased a smartwatch from this tech store, and I'm absolutely thrilled find the perfect fit with my purchase! Not only did they have an extensive find the perfect fit selection to choose from, but their team helped
                                me find the perfect fit for my lifestyle.”</blockquote>
                            <div class="rating text-primary">
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                            </div>
                            <h5 class="mt-1 fw-normal">Kevin Bryan</h5>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="card position-relative text-left p-5 border rounded-3">
                            <blockquote>“I stumbled upon this tech store while searching for a new laptop, and I couldn't be happier with my experience! The staff was incredibly knowledgeable and guided me through the process of choosing the perfect device for my
                                needs. Highly recommended!”</blockquote>
                            <div class="rating text-primary">
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                            </div>
                            <h5 class="mt-1 fw-normal">Stevin</h5>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="card position-relative text-left p-5 border rounded-3">
                            <blockquote>“I stumbled upon this tech store while searching for a new laptop, and I couldn't be happier with my experience! The staff was incredibly knowledgeable and guided me through the process of choosing the perfect device for my
                                needs. Highly recommended!”</blockquote>
                            <div class="rating text-primary">
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                                <svg class="star star-fill">
                                <use xlink:href="#star-fill"></use>
                                </svg>
                            </div>
                            <h5 class="mt-1 fw-normal">Roman</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="latest-posts" class="padding-large">
        <div class="container">
            <div class="section-title overflow-hidden mb-4">
                <h3 class="d-flex align-items-center">Latest posts</h3>
            </div>
            <div class="row">
                <div class="col-md-3 posts mb-4">
                    <a href="blog.html" class="btn rounded-0 py-0 px-2">Gadgets</a>
                    <img src="images/post-item1.jpg" alt="post image" class="img-fluid">
                    <h4 class="card-title mt-3 mb-2 text-uppercase text-dark"><a href="single-post.html">5 Must-Have Gadgets for the Modern Home</a></h4>
                    <p class="mb-2">Dive into the world of cutting-edge technology with our latest blog post, where we highlight five essential gadg</p>
                    <a class="text-decoration-underline" href="single-post.html">Read More</a>
                </div>
                <div class="col-md-3 posts mb-4">
                    <a href="blog.html" class="btn rounded-0 py-0 px-2">Phones</a>
                    <img src="images/post-item2.jpg" alt="post image" class="img-fluid">
                    <h4 class="card-title mt-3 mb-2 text-uppercase text-dark"><a href="single-post.html">Eco-Friendly Innovations Making a Difference</a></h4>
                    <p class="mb-2">Explore the intersection of technology and sustainability in our latest blog post. Learn about the innovative</p>
                    <a class="text-decoration-underline" href="single-post.html">Read More</a>
                </div>
                <div class="col-md-3 posts mb-4">
                    <a href="blog.html" class="btn rounded-0 py-0 px-2">Tech</a>
                    <img src="images/post-item3.jpg" alt="post image" class="img-fluid">
                    <h4 class="card-title mt-3 mb-2 text-uppercase text-dark"><a href="single-post.html">The Future of Wearable Tech: Trends to Watch</a></h4>
                    <p class="mb-2">Stay ahead of the curve with our insightful look into the rapidly evolving landscape of wearable technology.</p>
                    <a class="text-decoration-underline" href="single-post.html">Read More</a>
                </div>
                <div class="col-md-3 posts mb-4">
                    <a href="blog.html" class="btn rounded-0 py-0 px-2">Digital Watch</a>
                    <img src="images/post-item4.jpg" alt="post image" class="img-fluid">
                    <h4 class="card-title mt-3 mb-2 text-uppercase text-dark"><a href="single-post.html">Top Apps and Tools for Remote Work</a></h4>
                    <p class="mb-2">In today's remote work environment, productivity is key. Discover the top apps and tools that can help you stay</p>
                    <a class="text-decoration-underline" href="single-post.html">Read More</a>
                </div>
            </div>
        </div>
    </section>

    <section id="brands" class="py-5 border-top border-bottom">
        <div class="container">
            <div class="brand-images my-5 d-flex align-items-center justify-content-between flex-wrap">
                <a href="#" class="brand">
                    <img src="images/brand1.png" alt="brand" class="img-fluid">
                </a>
                <a href="#" class="brand">
                    <img src="images/brand2.png" alt="brand" class="img-fluid">
                </a>
                <a href="#" class="brand">
                    <img src="images/brand3.png" alt="brand" class="img-fluid">
                </a>
                <a href="#" class="brand">
                    <img src="images/brand4.png" alt="brand" class="img-fluid">
                </a>
                <a href="#" class="brand">
                    <img src="images/brand5.png" alt="brand" class="img-fluid">
                </a>
            </div>
        </div>
    </section>

    <section id="instagram" class="padding-large">
        <div class="container">
            <div class="text-center mb-4">
                <h3>Instagram #shoplite</h3>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <figure class="instagram-item position-relative rounded-3">
                        <a href="https://templatesjungle.com/" class="image-link position-relative">
                            <div class="icon-overlay position-absolute d-flex justify-content-center">
                                <svg class="instagram">
                                <use xlink:href="#instagram"></use>
                                </svg>
                            </div>
                            <img src="images/insta-item1.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
                        </a>
                    </figure>
                </div>
                <div class="col-md-2">
                    <figure class="instagram-item position-relative rounded-3">
                        <a href="https://templatesjungle.com/" class="image-link position-relative">
                            <div class="icon-overlay position-absolute d-flex justify-content-center">
                                <svg class="instagram">
                                <use xlink:href="#instagram"></use>
                                </svg>
                            </div>
                            <img src="images/insta-item2.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
                        </a>
                    </figure>
                </div>
                <div class="col-md-2">
                    <figure class="instagram-item position-relative rounded-3">
                        <a href="https://templatesjungle.com/" class="image-link position-relative">
                            <div class="icon-overlay position-absolute d-flex justify-content-center">
                                <svg class="instagram">
                                <use xlink:href="#instagram"></use>
                                </svg>
                            </div>
                            <img src="images/insta-item3.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
                        </a>
                    </figure>
                </div>
                <div class="col-md-2">
                    <figure class="instagram-item position-relative rounded-3">
                        <a href="https://templatesjungle.com/" class="image-link position-relative">
                            <div class="icon-overlay position-absolute d-flex justify-content-center">
                                <svg class="instagram">
                                <use xlink:href="#instagram"></use>
                                </svg>
                            </div>
                            <img src="images/insta-item4.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
                        </a>
                    </figure>
                </div>
                <div class="col-md-2">
                    <figure class="instagram-item position-relative rounded-3">
                        <a href="https://templatesjungle.com/" class="image-link position-relative">
                            <div class="icon-overlay position-absolute d-flex justify-content-center">
                                <svg class="instagram">
                                <use xlink:href="#instagram"></use>
                                </svg>
                            </div>
                            <img src="images/insta-item5.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
                        </a>
                    </figure>
                </div>
                <div class="col-md-2">
                    <figure class="instagram-item position-relative rounded-3">
                        <a href="https://templatesjungle.com/" class="image-link position-relative">
                            <div class="icon-overlay position-absolute d-flex justify-content-center">
                                <svg class="instagram">
                                <use xlink:href="#instagram"></use>
                                </svg>
                            </div>
                            <img src="images/insta-item6.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
                        </a>
                    </figure>
                </div>
            </div>
        </div>
    </section>
    <%@include file = "view/footer.jsp" %>

    <!-- Video Popup -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">

            <div class="modal-content">

                <div class="modal-body">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><svg class="bi" width="40" height="40"><use xlink:href="#close-sharp"></use></svg></button>
                    <div class="ratio ratio-16x9">
                        <iframe class="embed-responsive-item" src="" id="video" allowscriptaccess="always" allow="autoplay"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
</body>

</html>
