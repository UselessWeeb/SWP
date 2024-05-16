<!DOCTYPE html>
<html>

<head>
    <title>ShopLite - Simple eCommerce Website Template</title>
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
    <section class="hero-section position-relative bg-light-gray padding-medium">
        <div class="hero-content">
            <div class="container">
                <div class="row">
                    <div class="text-center">
                        <h1>Blog</h1>
                        <div class="breadcrumbs">
                            <span class="item">
                  <a href="index.jsp">Home > </a>
                </span>
                            <span class="item text-decoration-underline">Blog</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="padding-large">
        <div class="container">
            <div class="row">
                <aside class="col-md-3">
                    <div class="sidebar pe-lg-5 mb-3">
                        <div class="widget-menu">
                            <div class="widget-search-bar">
                                <form class="d-flex border rounded-3 p-2 " role="search">
                                    <input class="form-control border-0 me-2" type="search" placeholder="Search" aria-label="Search">
                                    <button class="btn rounded-3 px-4 d-flex align-items-center" type="submit">
                      <svg class="search text-light" width="18" height="18">
                        <use xlink:href="#search"></use>
                      </svg>
                    </button>
                                </form>
                            </div>
                        </div>
                        <div class="widget-product-categories pt-5">
                            <div class="section-title overflow-hidden mb-2">
                                <h3 class="d-flex flex-column mb-0">Categories</h3>
                            </div>
                            <ul class="product-categories mb-0 sidebar-list list-unstyled">
                                <li class="cat-item">
                                    <a href="/collections/categories">All</a>
                                </li>
                                <li class="cat-item">
                                    <a href="#">Phones</a>
                                </li>
                                <li class="cat-item">
                                    <a href="#">Accessories</a>
                                </li>
                                <li class="cat-item">
                                    <a href="#">Tablets</a>
                                </li>
                                <li class="cat-item">
                                    <a href="#">Watches</a>
                                </li>
                            </ul>
                        </div>
                        <div class="widget-product-tags pt-5">
                            <div class="section-title overflow-hidden mb-2">
                                <h3 class="d-flex flex-column mb-0">Tags</h3>
                            </div>
                            <ul class="product-tags mb-0 sidebar-list list-unstyled">
                                <li class="tags-item">
                                    <a href="#">White</a>
                                </li>
                                <li class="tags-item">
                                    <a href="#">Cheap</a>
                                </li>
                                <li class="tags-item">
                                    <a href="#">Mobile</a>
                                </li>
                                <li class="tags-item">
                                    <a href="#">Modern</a>
                                </li>
                            </ul>
                        </div>
                        <div class="widget-social-links pt-5">
                            <div class="section-title overflow-hidden mb-2">
                                <h3 class="d-flex flex-column mb-0">Social Links</h3>
                            </div>
                            <ul class="social-links mb-0 sidebar-list list-unstyled">
                                <li class="links">
                                    <a href="#">Facebook</a>
                                </li>
                                <li class="links">
                                    <a href="#">Instagram</a>
                                </li>
                                <li class="links">
                                    <a href="#">Twitter</a>
                                </li>
                                <li class="links">
                                    <a href="#">Youtube</a>
                                </li>
                                <li class="links">
                                    <a href="#">Pinterest</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </aside>
                <main class="col-md-9">
                    <div class="filter-blog d-flex flex-wrap justify-content-between">
                        <div class="showing-product">
                            <p>Showing 1-9 of 55 results</p>
                        </div>
                        <div class="sort-by">
                            <select id="sorting" class="form-select" data-filter-sort="" data-filter-order="">
                  <option value="">Latest to oldest</option>
                  <option value="">Oldest to latest</option>
                  <option value="">Popular</option>
                  <option value="">Name (A - Z)</option>
                  <option value="">Name (Z - A)</option>
                  <option value="">Model (A - Z)</option>
                  <option value="">Model (Z - A)</option>   
                </select>
                        </div>
                    </div>
                    <div class="row post-contents">
                        <div class="col-lg-4 col-md-6 posts mb-4">
                            <a href="blog.jsp" class="btn rounded-0 py-0 px-2">Gadgets</a>
                            <img src="images/post-item1.jpg" alt="post image" class="img-fluid">
                            <h4 class="card-title mt-3 mb-2 text-uppercase text-dark"><a href="single-post.jsp">5 Must-Have Gadgets for the Modern Home</a></h4>
                            <p class="mb-2">Dive into the world of cutting-edge technology with our latest blog post, where we highlight five essential gadg</p>
                            <a class="text-decoration-underline" href="single-post.jsp">Read More</a>
                        </div>
                        <div class="col-lg-4 col-md-6 posts mb-4">
                            <a href="blog.jsp" class="btn rounded-0 py-0 px-2">Phones</a>
                            <img src="images/post-item2.jpg" alt="post image" class="img-fluid">
                            <h4 class="card-title mt-3 mb-2 text-uppercase text-dark"><a href="single-post.jsp">Eco-Friendly Innovations Making a Difference</a></h4>
                            <p class="mb-2">Explore the intersection of technology and sustainability in our latest blog post. Learn about the innovative</p>
                            <a class="text-decoration-underline" href="single-post.jsp">Read More</a>
                        </div>
                        <div class="col-lg-4 col-md-6 posts mb-4">
                            <a href="blog.jsp" class="btn rounded-0 py-0 px-2">Tech</a>
                            <img src="images/post-item3.jpg" alt="post image" class="img-fluid">
                            <h4 class="card-title mt-3 mb-2 text-uppercase text-dark"><a href="single-post.jsp">The Future of Wearable Tech: Trends to Watch</a></h4>
                            <p class="mb-2">Stay ahead of the curve with our insightful look into the rapidly evolving landscape of wearable technology.</p>
                            <a class="text-decoration-underline" href="single-post.jsp">Read More</a>
                        </div>
                        <div class="col-lg-4 col-md-6 posts mb-4">
                            <a href="blog.jsp" class="btn rounded-0 py-0 px-2">Gadgets</a>
                            <img src="images/post-item4.jpg" alt="post image" class="img-fluid">
                            <h4 class="card-title mt-3 mb-2 text-uppercase text-dark"><a href="single-post.jsp">5 Must-Have Gadgets for the Modern Home</a></h4>
                            <p class="mb-2">Dive into the world of cutting-edge technology with our latest blog post, where we highlight five essential gadg</p>
                            <a class="text-decoration-underline" href="single-post.jsp">Read More</a>
                        </div>
                        <div class="col-lg-4 col-md-6 posts mb-4">
                            <a href="blog.jsp" class="btn rounded-0 py-0 px-2">Phones</a>
                            <img src="images/post-item5.jpg" alt="post image" class="img-fluid">
                            <h4 class="card-title mt-3 mb-2 text-uppercase text-dark"><a href="single-post.jsp">Eco-Friendly Innovations Making a Difference</a></h4>
                            <p class="mb-2">Explore the intersection of technology and sustainability in our latest blog post. Learn about the innovative</p>
                            <a class="text-decoration-underline" href="single-post.jsp">Read More</a>
                        </div>
                        <div class="col-lg-4 col-md-6 posts mb-4">
                            <a href="blog.jsp" class="btn rounded-0 py-0 px-2">Tech</a>
                            <img src="images/post-item6.jpg" alt="post image" class="img-fluid">
                            <h4 class="card-title mt-3 mb-2 text-uppercase text-dark"><a href="single-post.jsp">The Future of Wearable Tech: Trends to Watch</a></h4>
                            <p class="mb-2">Stay ahead of the curve with our insightful look into the rapidly evolving landscape of wearable technology.</p>
                            <a class="text-decoration-underline" href="single-post.jsp">Read More</a>
                        </div>
                        <div class="col-lg-4 col-md-6 posts mb-4">
                            <a href="blog.jsp" class="btn rounded-0 py-0 px-2">Gadgets</a>
                            <img src="images/post-item7.jpg" alt="post image" class="img-fluid">
                            <h4 class="card-title mt-3 mb-2 text-uppercase text-dark"><a href="single-post.jsp">5 Must-Have Gadgets for the Modern Home</a></h4>
                            <p class="mb-2">Dive into the world of cutting-edge technology with our latest blog post, where we highlight five essential gadg</p>
                            <a class="text-decoration-underline" href="single-post.jsp">Read More</a>
                        </div>
                        <div class="col-lg-4 col-md-6 posts mb-4">
                            <a href="blog.jsp" class="btn rounded-0 py-0 px-2">Phones</a>
                            <img src="images/post-item8.jpg" alt="post image" class="img-fluid">
                            <h4 class="card-title mt-3 mb-2 text-uppercase text-dark"><a href="single-post.jsp">Eco-Friendly Innovations Making a Difference</a></h4>
                            <p class="mb-2">Explore the intersection of technology and sustainability in our latest blog post. Learn about the innovative</p>
                            <a class="text-decoration-underline" href="single-post.jsp">Read More</a>
                        </div>
                        <div class="col-lg-4 col-md-6 posts mb-4">
                            <a href="blog.jsp" class="btn rounded-0 py-0 px-2">Tech</a>
                            <img src="images/post-item9.jpg" alt="post image" class="img-fluid">
                            <h4 class="card-title mt-3 mb-2 text-uppercase text-dark"><a href="single-post.jsp">The Future of Wearable Tech: Trends to Watch</a></h4>
                            <p class="mb-2">Stay ahead of the curve with our insightful look into the rapidly evolving landscape of wearable technology.</p>
                            <a class="text-decoration-underline" href="single-post.jsp">Read More</a>
                        </div>
                    </div>
                    <nav class="py-5" aria-label="Page navigation">
                        <ul class="pagination justify-content-center gap-4">
                            <li class="page-item disabled">
                                <a class="page-link">Prev</a>
                            </li>
                            <li class="page-item active" aria-current="page">
                                <span class="page-link">1</span>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                            </li>
                        </ul>
                    </nav>
                </main>
            </div>
        </div>
    </div>

    <section id="customers-reviews" class="position-relative margin-large mt-0">
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
                            <blockquote>?I stumbled upon this tech store while searching for a new laptop, and I couldn't be happier with my experience! The staff was incredibly knowledgeable and guided me through the process of choosing the perfect device for my
                                needs. Highly recommended!?</blockquote>
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
                            <blockquote>?This tech store is my go-to for all things tech! Whether it's a new smartphone, accessories, or even troubleshooting advice, they've always got me covered. The staff is friendly, and their expertise is unmatched. Trust me;
                                you won't regret shopping here!?</blockquote>
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
                            <blockquote>?I recently purchased a smartwatch from this tech store, and I'm absolutely thrilled find the perfect fit with my purchase! Not only did they have an extensive find the perfect fit selection to choose from, but their team helped
                                me find the perfect fit for my lifestyle.?</blockquote>
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
                            <blockquote>?I stumbled upon this tech store while searching for a new laptop, and I couldn't be happier with my experience! The staff was incredibly knowledgeable and guided me through the process of choosing the perfect device for my
                                needs. Highly recommended!?</blockquote>
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
                            <blockquote>?I stumbled upon this tech store while searching for a new laptop, and I couldn't be happier with my experience! The staff was incredibly knowledgeable and guided me through the process of choosing the perfect device for my
                                needs. Highly recommended!?</blockquote>
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
    <hr>
    <div id="footer-bottom" class="mb-2">
        <div class="container">
            <div class="d-flex flex-wrap justify-content-between">
                <div class="ship-and-payment d-flex gap-md-5 flex-wrap">
                    <div class="shipping d-flex">
                        <p>We ship with:</p>
                        <div class="card-wrap ps-2">
                            <img src="images/dhl.png" alt="visa">
                            <img src="images/shippingcard.png" alt="mastercard">
                        </div>
                    </div>
                    <div class="payment-method d-flex">
                        <p>Payment options:</p>
                        <div class="card-wrap ps-2">
                            <img src="images/visa.jpg" alt="visa">
                            <img src="images/mastercard.jpg" alt="mastercard">
                            <img src="images/paypal.jpg" alt="paypal">
                        </div>
                    </div>
                </div>
                <div class="copyright">
                    <p>© Copyright 2024 ShopLite. HTML Template by <a href="https://templatesjungle.com/" target="_blank">TemplatesJungle</a>
                    </p>
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