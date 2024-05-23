<%-- 
    Document   : cart
    Created on : May 16, 2024, 3:33:46 PM
    Author     : M7510
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <%@include file ="view/header.jsp" %>
        <section class="hero-section position-relative bg-light-gray padding-medium">
            <div class="hero-content">
                <div class="container">
                    <div class="row">
                        <div class="text-center">
                            <h1>Cart</h1>
                            <div class="breadcrumbs">
                                <span class="item">
                                    <a href="index.html">Home > </a>
                                </span>
                                <span class="item text-decoration-underline">Cart</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="cart padding-large">
            <div class="container">
                <div class="row">
                    <div class="cart-table">
                        <div class="cart-header">
                            <div class="row d-flex text-uppercase">
                                <h4 class="col-lg-4 pb-3">Product</h4>
                                <h4 class="col-lg-3 pb-3">Quantity</h4>
                                <h4 class="col-lg-4 pb-3">Subtotal</h4>
                            </div>
                        </div>
                        <div class="slash-divider"></div>
                        <div class="cart-item border-bottom padding-small">
                            <div class="row align-items-center">
                                <div class="col-lg-4 col-md-3">
                                    <div class="cart-info d-flex gap-2 flex-wrap align-items-center">
                                        <div class="col-lg-5">
                                            <div class="card-image">
                                                <img src="images/cart-item1.png" alt="cart-img" class="img-fluid border rounded-3">
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="card-detail">
                                                <h5 class="mt-2"><a href="single-product.html">Iphone 15 pro max</a></h5>
                                                <div class="card-price">
                                                    <span class="price text-primary fw-light" data-currency-usd="$2000.00">$2000.00</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-7">
                                    <div class="row d-flex">
                                        <div class="col-md-6">
                                            <div class="product-quantity my-2 my-2">
                                                <div class="input-group product-qty align-items-center" style="max-width: 150px;">
                                                    <span class="input-group-btn">
                                                        <button type="button" class="bg-white shadow border rounded-3 fw-light quantity-left-minus" data-type="minus" data-field="">
                                                            <svg width="16" height="16"><use xlink:href="#minus"></use></svg>
                                                        </button>
                                                    </span>
                                                    <input type="text" id="quantity" name="quantity" class="form-control bg-white shadow border rounded-3 py-2 mx-2 input-number text-center" value="1" min="1" max="100" required>
                                                    <span class="input-group-btn">
                                                        <button type="button" class="bg-white shadow border rounded-3 fw-light quantity-right-plus" data-type="plus" data-field="">
                                                            <svg width="16" height="16"><use xlink:href="#plus"></use></svg>
                                                        </button>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="total-price">
                                                <span class="money fs-2 fw-light text-primary">$2000.00</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-1 col-md-2">
                                    <div class="cart-cross-outline">
                                        <a href="#">
                                            <svg class="cart-cross-outline" width="38" height="38">
                                            <use xlink:href="#cart-cross-outline"></use>
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="cart-item border-bottom padding-small">
                            <div class="row align-items-center">
                                <div class="col-lg-4 col-md-3">
                                    <div class="cart-info d-flex gap-2 flex-wrap align-items-center">
                                        <div class="col-lg-5">
                                            <div class="card-image">
                                                <img src="images/cart-item2.png" alt="cart-img" class="img-fluid border rounded-3">
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="card-detail">
                                                <h5 class="mt-2"><a href="single-product.html">Apple Watch (2nd Gen)</a></h5>
                                                <div class="card-price">
                                                    <span class="price text-primary fw-light" data-currency-usd="$2000.00">$400.00</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-7">
                                    <div class="row d-flex">
                                        <div class="col-lg-6">
                                            <div class="product-quantity my-2">
                                                <div class="input-group product-qty align-items-center" style="max-width: 150px;">
                                                    <span class="input-group-btn">
                                                        <button type="button" class="bg-white shadow border rounded-3 fw-light quantity-left-minus" data-type="minus" data-field="">
                                                            <svg width="16" height="16"><use xlink:href="#minus"></use></svg>
                                                        </button>
                                                    </span>
                                                    <input type="text" id="quantity" name="quantity" class="form-control bg-white shadow border rounded-3 py-2 mx-2 input-number text-center" value="1" min="1" max="100" required>
                                                    <span class="input-group-btn">
                                                        <button type="button" class="bg-white shadow border rounded-3 fw-light quantity-right-plus" data-type="plus" data-field="">
                                                            <svg width="16" height="16"><use xlink:href="#plus"></use></svg>
                                                        </button>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="total-price">
                                                <span class="money fs-2 fw-light text-primary">$400.00</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-1 col-md-2">
                                    <div class="cart-cross-outline">
                                        <a href="#">
                                            <svg class="cart-cross-outline" width="38" height="38">
                                            <use xlink:href="#cart-cross-outline"></use>
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="cart-totals padding-medium pb-0">
                        <h3 class="mb-3">Cart Totals</h3>
                        <div class="total-price pb-3">
                            <table cellspacing="0" class="table text-uppercase">
                                <tbody>
                                    <tr class="subtotal pt-2 pb-2 border-top border-bottom">
                                        <th>Subtotal</th>
                                        <td data-title="Subtotal">
                                            <span class="price-amount amount text-primary ps-5 fw-light">
                                                <bdi>
                                                    <span class="price-currency-symbol">$</span>2,400.00
                                                </bdi>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr class="order-total pt-2 pb-2 border-bottom">
                                        <th>Total</th>
                                        <td data-title="Total">
                                            <span class="price-amount amount text-primary ps-5 fw-light">
                                                <bdi>
                                                    <span class="price-currency-symbol">$</span>2,400.00</bdi>
                                            </span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="button-wrap d-flex flex-wrap gap-3">
                            <button class="btn">Update Cart</button>
                            <button class="btn">Continue Shopping</button>
                            <button class="btn">Proceed to checkout</button>
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

        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>

</html>
