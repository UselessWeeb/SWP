<%-- 
    Document   : single-product
    Created on : May 16, 2024, 3:37:16 PM
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
    <%@include file = "view/header.jsp" %>

    <section class="single-product padding-large">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="d-flex gap-3 product-preview">
                        <div class="swiper thumb-swiper w-50">
                            <div class="swiper-wrapper d-flex flex-wrap gap-3 align-content-start">
                                <div class="swiper-slide bg-white">
                                    <img src="images/product-thumbnail-1.png" alt="product-thumb" class="img-fluid border rounded-3">
                                </div>
                                <div class="swiper-slide bg-white">
                                    <img src="images/product-thumbnail-2.png" alt="product-thumb" class="img-fluid border rounded-3">
                                </div>
                                <div class="swiper-slide bg-white">
                                    <img src="images/product-thumbnail-3.png" alt="product-thumb" class="img-fluid border rounded-3">
                                </div>
                            </div>
                        </div>
                        <div class="swiper large-swiper border rounded-3 overflow-hidden">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide bg-white">
                                    <img src="images/product-large-1.png" alt="single-product" class="img-fluid">
                                </div>
                                <div class="swiper-slide bg-white">
                                    <img src="images/product-large-2.png" alt="single-product" class="img-fluid">
                                </div>
                                <div class="swiper-slide bg-white">
                                    <img src="images/product-large-3.png" alt="single-product" class="img-fluid">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="product-info ps-lg-5 pt-3 pt-lg-0">
                        <div class="element-header">
                            <h1 class="product-title">Iphone 15 Pro Max</h1>
                            <div class="product-price d-flex align-items-center mt-2">
                                <span class="fs-2 fw-light text-primary me-2">$2000</span>
                                <del>$2600</del>
                            </div>
                            <div class="rating text-primary my-3">
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
                        </div>
                        <p>Justo, cum feugiat imperdiet nulla molestie ac vulputate scelerisque amet. Bibendum adipiscing platea blandit sit sed quam semper rhoncus.</p>
                        <div class="slash-divider"></div>
                        <div class="cart-wrap">
                            <div class="color-options product-select my-3">
                                <div class="color-toggle" data-option-index="0">
                                    <h4 class="item-title text-decoration-underline text-uppercase">Color</h4>
                                    <ul class="select-list list-unstyled d-flex mb-0">
                                        <li class="select-item me-3" data-val="Green" title="Green">
                                            <a href="#">Gray</a>
                                        </li>
                                        <li class="select-item me-3" data-val="Orange" title="Orange">
                                            <a href="#">Blue</a>
                                        </li>
                                        <li class="select-item me-3" data-val="Red" title="Red">
                                            <a href="#">White</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="swatch product-select" data-option-index="1">
                                <h4 class="item-title text-decoration-underline text-uppercase">Size</h4>
                                <ul class="select-list list-unstyled d-flex mb-0">
                                    <li data-value="S" class="select-item me-3">
                                        <a href="#">S</a>
                                    </li>
                                    <li data-value="M" class="select-item me-3">
                                        <a href="#">M</a>
                                    </li>
                                    <li data-value="L" class="select-item me-3">
                                        <a href="#">L</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="product-quantity my-3">
                                <div class="item-title">
                                    <l>2 in stock</l>
                                </div>
                                <div class="stock-button-wrap mt-2 d-flex flex-wrap align-items-center">
                                    <div class="product-quantity">
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
                            </div>
                            <div class="action-buttons my-3 d-flex flex-wrap gap-3">
                                <a href="#" class="btn">Order now</a>
                                <a href="#" class="btn btn-dark">Add to cart</a>
                                <a href="#" class="btn btn-dark">
                    <svg class="heart" width="21" height="21">
                      <use xlink:href="#heart"></use>
                    </svg>
                  </a>
                            </div>
                        </div>
                        <div class="slash-divider"></div>
                        <div class="meta-product my-3">
                            <div class="meta-item d-flex mb-1">
                                <span class="fw-medium me-2">SKU:</span>
                                <ul class="select-list list-unstyled d-flex mb-0">
                                    <li data-value="S" class="select-item">1223</li>
                                </ul>
                            </div>
                            <div class="meta-item d-flex mb-1">
                                <span class="fw-medium me-2">Category:</span>
                                <ul class="select-list list-unstyled d-flex mb-0">
                                    <li data-value="S" class="select-item">
                                        <a href="#">Toy</a>,
                                    </li>
                                    <li data-value="S" class="select-item">
                                        <a href="#">Robot</a>,
                                    </li>
                                    <li data-value="S" class="select-item">
                                        <a href="#">Tech</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="meta-item d-flex mb-1">
                                <span class="fw-medium me-2">Tags:</span>
                                <ul class="select-list list-unstyled d-flex mb-0">
                                    <li data-value="S" class="select-item">
                                        <a href="#">Toy</a>,
                                    </li>
                                    <li data-value="S" class="select-item">
                                        <a href="#">Small</a>,
                                    </li>
                                    <li data-value="S" class="select-item">
                                        <a href="#">Strong</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="product-tabs">
        <div class="container">
            <div class="row">
                <div class="tabs-listing">
                    <nav>
                        <div class="nav nav-tabs d-flex justify-content-center py-3" id="nav-tab" role="tablist">
                            <button class="nav-link text-uppercase active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Description</button>
                            <button class="nav-link text-uppercase" id="nav-information-tab" data-bs-toggle="tab" data-bs-target="#nav-information" type="button" role="tab" aria-controls="nav-information" aria-selected="false">Additional information</button>
                            <button class="nav-link text-uppercase" id="nav-shipping-tab" data-bs-toggle="tab" data-bs-target="#nav-shipping" type="button" role="tab" aria-controls="nav-shipping" aria-selected="false">Shipping & Return</button>
                            <button class="nav-link text-uppercase" id="nav-review-tab" data-bs-toggle="tab" data-bs-target="#nav-review" type="button" role="tab" aria-controls="nav-review" aria-selected="false">Reviews (02)</button>
                        </div>
                    </nav>
                    <div class="tab-content border-bottom py-4" id="nav-tabContent">
                        <div class="tab-pane fade active show" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                            <p>Product Description</p>
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis
                                facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus.
                                <ul class="fw-light">
                                    <li>Donec nec justo eget felis facilisis fermentum.</li>
                                    <li>Suspendisse urna viverra non, semper suscipit pede.</li>
                                    <li>Aliquam porttitor mauris sit amet orci.</li>
                                </ul>
                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis
                                    facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus.</p>
                        </div>
                        <div class="tab-pane fade" id="nav-information" role="tabpanel" aria-labelledby="nav-information-tab">
                            <p>It is Comfortable and Best</p>
                            <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Duis aute
                                irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                        </div>
                        <div class="tab-pane fade" id="nav-shipping" role="tabpanel" aria-labelledby="nav-shipping-tab">
                            <p>Returns Policy</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eros justo, accumsan non dui sit amet. Phasellus semper volutpat mi sed imperdiet. Ut odio lectus, vulputate non ex non, mattis sollicitudin purus. Mauris consequat
                                justo a enim interdum, in consequat dolor accumsan. Nulla iaculis diam purus, ut vehicula leo efficitur at.</p>
                            <p>Interdum et malesuada fames ac ante ipsum primis in faucibus. In blandit nunc enim, sit amet pharetra erat aliquet ac.</p>
                            <p>Shipping</p>
                            <p>Pellentesque ultrices ut sem sit amet lacinia. Sed nisi dui, ultrices ut turpis pulvinar. Sed fringilla ex eget lorem consectetur, consectetur blandit lacus varius. Duis vel scelerisque elit, et vestibulum metus. Integer sit
                                amet tincidunt tortor. Ut lacinia ullamcorper massa, a fermentum arcu vehicula ut. Ut efficitur faucibus dui Nullam tristique dolor eget turpis consequat varius. Quisque a interdum augue. Nam ut nibh mauris.</p>
                        </div>
                        <div class="tab-pane fade" id="nav-review" role="tabpanel" aria-labelledby="nav-review-tab">
                            <div class="review-box review-style d-flex gap-3 flex-column">
                                <div class="review-item d-flex">
                                    <div class="image-holder me-2">
                                        <img src="images/review-image1.jpg" alt="review" class="img-fluid rounded-3">
                                    </div>
                                    <div class="review-content">
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
                                        <div class="review-header">
                                            <span class="author-name fw-medium">Tom Johnson</span>
                                            <span class="review-date">- 07/05/2022</span>
                                        </div>
                                        <p>Vitae tortor condimentum lacinia quis vel eros donec ac. Nam at lectus urna duis convallis convallis</p>
                                    </div>
                                </div>
                                <div class="review-item d-flex">
                                    <div class="image-holder me-2">
                                        <img src="images/review-image2.jpg" alt="review" class="img-fluid rounded-3">
                                    </div>
                                    <div class="review-content">
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
                                        <div class="review-header">
                                            <span class="author-name fw-medium">Jenny Willis</span>
                                            <span class="review-date">- 07/05/2022</span>
                                        </div>
                                        <p>Vitae tortor condimentum lacinia quis vel eros donec ac. Nam at lectus urna duis convallis convallis</p>
                                    </div>
                                </div>
                            </div>
                            <div class="add-review margin-small">
                                <h3>Add a review</h3>
                                <p>Your email address will not be published. Required fields are marked *</p>
                                <div class="review-rating py-2">
                                    <span class="my-2">Your rating *</span>
                                    <div class="rating text-secondary">
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
                                </div>
                                <input type="file" class="jfilestyle py-3 border-0" data-text="Choose your file">
                                <form id="form" class="d-flex gap-3 flex-wrap">
                                    <div class="w-100 d-flex gap-3">
                                        <div class="w-50">
                                            <input type="text" name="name" placeholder="Write your name here *" class="form-control w-100">
                                        </div>
                                        <div class="w-50">
                                            <input type="text" name="email" placeholder="Write your email here *" class="form-control w-100">
                                        </div>
                                    </div>
                                    <div class="w-100">
                                        <textarea placeholder="Write your review here *" class="form-control w-100"></textarea>
                                    </div>
                                    <label class="w-100">
                      <input type="checkbox" required="" class="d-inline">
                      <span>Save my name, email, and website in this browser for the next time.</span>
                    </label>
                                    <button type="submit" name="submit" class="btn my-3">Submit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="related-items" class="position-relative padding-large">
        <div class="container">
            <div class="section-title overflow-hidden mb-4">
                <h3 class="d-flex align-items-center">Related items</h3>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="card position-relative text-center py-4 mb-4 border rounded-3">
                        <img src="images/product-item1.png" class="img-fluid" alt="product item">
                        <h5 class="mt-2"><a href="single-product.html">IPad (9th Gen)</a></h5>
                        <span class="price text-primary fw-light mb-2">$870</span>
                        <div class="card-concern position-absolute start-0 end-0 d-flex gap-2">
                            <button type="button" href="#" class="btn btn-dark" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Tooltip on top">
                  <svg class="cart">
                    <use xlink:href="#cart"></use>
                  </svg>
                </button>
                            <a href="#" class="btn btn-dark">
                  <span>
                    <svg class="wishlist">
                      <use xlink:href="#heart"></use>
                    </svg>
                  </span>
                </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card position-relative text-center py-4 mb-4 border rounded-3">
                        <img src="images/product-item2.png" class="img-fluid" alt="product item">
                        <h5 class="mt-2"><a href="single-product.html">Drone With Camera</a></h5>
                        <span class="price text-primary fw-light mb-2">$600</span>
                        <div class="card-concern position-absolute start-0 end-0 d-flex gap-2">
                            <a href="#" class="btn btn-dark">
                  <svg class="cart">
                    <use xlink:href="#cart"></use>
                  </svg>
                </a>
                            <a href="#" class="btn btn-dark">
                  <span>
                    <svg class="wishlist">
                      <use xlink:href="#heart"></use>
                    </svg>
                  </span>
                </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card position-relative text-center py-4 mb-4 border rounded-3">
                        <img src="images/product-item3.png" class="img-fluid" alt="product item">
                        <h5 class="mt-2"><a href="single-product.html">Apple Watch (2nd Gen)</a></h5>
                        <span class="price text-primary fw-light mb-2">$400</span>
                        <div class="card-concern position-absolute start-0 end-0 d-flex gap-2">
                            <a href="#" class="btn btn-dark">
                  <svg class="cart">
                    <use xlink:href="#cart"></use>
                  </svg>
                </a>
                            <a href="#" class="btn btn-dark">
                  <span>
                    <svg class="wishlist">
                      <use xlink:href="#heart"></use>
                    </svg>
                  </span>
                </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card position-relative text-center py-4 mb-4 border rounded-3">
                        <img src="images/product-item4.png" class="img-fluid" alt="product item">
                        <h5 class="mt-2"><a href="single-product.html">Ultra HD TV</a></h5>
                        <span class="price text-primary fw-light mb-2">$2000</span>
                        <div class="card-concern position-absolute start-0 end-0 d-flex gap-2">
                            <a href="#" class="btn btn-dark">
                  <svg class="cart">
                    <use xlink:href="#cart"></use>
                  </svg>
                </a>
                            <a href="#" class="btn btn-dark">
                  <span>
                    <svg class="wishlist">
                      <use xlink:href="#heart"></use>
                    </svg>
                  </span>
                </a>
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

    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
</body>

</html>
