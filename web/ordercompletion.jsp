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
                    <jsp:include page = "/Sidebar" />
                    <div class="col-lg-9">
                        <div class="gap-3 product-preview">
                            <div class="thumbnail">
                                <div class="hero-image">
                                    <div style = "width: 800px; height: 600px; background-color:#ff6543">
                                        <h3>Notification</h3>
                                        <h5>Order successfully</h5>
                                    </div> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%@include file = "view/footer.jsp" %>

        <script src="js/jquery-1.11.0.min.js"></script>
        <script>
            document.querySelector('.quantity-left-minus').addEventListener('click', function () {
                let quantity = document.getElementById('quantity');
                updateQuantities(quantity.value);
            });

            document.querySelector('.quantity-right-plus').addEventListener('click', function () {
                let quantity = document.getElementById('quantity');
                updateQuantities(quantity.value);
            });

            function updateQuantities(value) {
                let numericValue = Number(value);
                document.getElementById('orderQuantity').value = numericValue + 1;
                document.getElementById('cartQuantity').value = numericValue + 1;
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>
</html>

