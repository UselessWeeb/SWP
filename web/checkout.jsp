<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Checkout</title>
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
        <section class="checkout-wrap padding-large">
            <div class="container">
                <form class="form-group" action = "completion" method = "POST">
                    <div class="row d-flex flex-wrap">
                        <div class="col-lg-9">
                            <div class="cart-header">
                                <div class="row d-flex text-uppercase">
                                    <h4 class="col-lg-2 pb-2">Id</h4>
                                    <h4 class="col-lg-3 pb-2">Product</h4>
                                    <h4 class="col-lg-3 pb-2">Quantity</h4>
                                    <h4 class="col-lg-3 pb-3">Subtotal</h4>
                                </div>
                            </div>
                            <div class="slash-divider"></div>
                            <div class="cart-table">
                                <c:set var="totalQuantity" value="0"/>
                                <c:set var="totalPrice" value="0"/>
                                <c:forEach var="cart" items="${carts}">
                                    <c:set var="totalQuantity" value="${totalQuantity + cart.value}"/>
                                    <c:set var="totalPrice" value="${totalPrice + (cart.key.salePrice * cart.value)}"/>
                                    <input type ="text" name = "selectedCart" value = "${selectedItems}" hidden/>
                                    <div class="cart-item border-bottom padding-small">
                                        <div class="row align-items-center">
                                            <div class="col-lg-6 col-md-3">
                                                <div class="cart-info d-flex gap-2 flex-wrap align-items-center">
                                                    <div class="col-lg-3">
                                                        <div class="card-detail">
                                                            <h5 class="mt-2">
                                                                <a href="productdetails?laptopId=${cart.key.laptopId}">${cart.key.laptopId}</a>
                                                            </h5>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="card-image">
                                                            <img src="${cart.key.mainImage}" alt="cart-img" class="img-fluid border rounded-3">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="card-detail">
                                                            <h5 class="mt-2"><a href="productdetails?laptopId=${cart.key.laptopId}">${cart.key.title}</a></h5>
                                                            <div class="card-price">
                                                                <span class="price text-primary fw-light" data-currency-usd="${cart.key.salePrice}">${cart.key.salePrice}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-7">
                                                <div class="row d-flex">
                                                    <div class="col-md-6">
                                                        <div class="product-quantity my-2 my-2">
                                                            <p id="quantity" name="quantity">${cart.value}</p>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="total-price">
                                                            <span class="money fs-2 fw-light text-primary">${cart.key.salePrice * cart.value}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <div class="button-wrap m-3">
                                    <a href = "cart" class="btn">Change</a>
                                </div>
                            </div>
                            <h3 class="mb-3">Billing Details</h3>
                            <div class="billing-details">
                                <label for="fname">Full name*</label>
                                <input type="text" id="fname" name="fullName" class="form-control mt-2 mb-4 ps-3" value="${sessionScope.user.fullName}" required>
                                <label for="cname">Address*</label>
                                <input type="text" name="userAddress" id = "userAddress" class="form-control mt-2 mb-4" value="${sessionScope.user.address}" onchange = "calculateDistance()" required>
                                <label for="phone">Phone *</label>
                                <input type="text" id="phone" name="phone" class="form-control mt-2 mb-4 ps-3" value="${sessionScope.user.phoneNumber}" required>
                                <label for="email">Email address *</label>
                                <input type="text" id="email" name="email" class="form-control mt-2 mb-4 ps-3" value="${sessionScope.user.email}" required>
                                <label for ="gender">Gender *</label>
                                <select class = "form-select" name = "gender">
                                    <option value ="Male" "${sessionScope.user.gender == 'Male' ? checked : ''}">Male</option>
                                    <option value ="Female" "${sessionScope.user.gender == 'Female' ? checked : ''}">Female</option>
                                    <option value ="Other" "${sessionScope.user.gender == 'Other' ? checked : ''}">Other</option>
                                </select>
                                <label for="method">Shipping method *</label>
                                <!--a button to open the dropdown-->
                                <button class="btn dropdown-toggle" type="button" name = "method" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                    Shipping Method
                                </button>
                                <!--the dropdown menu-->
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <li>
                                        <div class="dropdown-item" value="1">
                                            <div class = "d-flex justify-content-between">
                                                <h5>Standard Delivery</h5>
                                                <c:if test = "${shipMethod == 1}">
                                                    <p>Recommended</p>
                                                </c:if>
                                            </div>
                                            <p>Most suitable for smaller orders. Fast and secure</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="dropdown-item" value="2">
                                            <div class = "d-flex justify-content-between">
                                                <h5>Heavy Delivery</h5>
                                                <c:if test = "${shipMethod == 2}">
                                                    <p>Recommended</p>
                                                </c:if>
                                                </div>
                                            <p>Suitable for heavy order. More expensive, but keep the fast and secure</p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="form-control mt-3">
                                <h3 class="mb-3">Additional Information</h3>
                                <div class="billing-details">
                                    <label for="fname">Order notes (optional)</label>
                                    <textarea class="form-control pt-3 pb-3 ps-3 mt-2" placeholder="Notes about your order. Like special notes for delivery." name = "add-info"></textarea>
                                </div>
                            </div>
                            <p id="result" hidden></p>
                            <script>
                                async function getCoordinatesFromAddress(address) {
                                    const response = await fetch('https://nominatim.openstreetmap.org/search?format=json&q=' + encodeURIComponent(address));
                                    const data = await response.json();
                                    if (data.length > 0) {
                                        const location = data[0];
                                        return { lat: parseFloat(location.lat), lon: parseFloat(location.lon) };
                                    } else {
                                        throw new Error('Address not found');
                                    }
                                }
                        
                                async function calculateDistance() {
                                    try {
                                        const staticAddress = { lat: 21.001770, lon: 105.521470 }; // Current location of the store
                                        const userAddress = document.getElementById('userAddress').value;
                        
                                        const userCoordinates = await getCoordinatesFromAddress(userAddress);
                                        const distance = getDistanceInMeters(staticAddress.lat, staticAddress.lon, userCoordinates.lat, userCoordinates.lon);
                                        console.log(distance);
                        
                                        document.getElementById('result').textContent = distance.toFixed(2);
                                        document.getElementById('distance').value = distance.toFixed(2);

                                        calculateShippingFee();
                                        calculateTotalPrice();
                                    } catch (error) {
                                        document.getElementById('result').textContent = 'Error: Address not found or invalid.';
                                    }
                                }
                        
                                function getDistanceInMeters(lat1, lon1, lat2, lon2) {
                                    const R = 6371e3; // Earth's radius in meters
                                    const φ1 = lat1 * Math.PI / 180;
                                    const φ2 = lat2 * Math.PI / 180;
                                    const Δφ = (lat2 - lat1) * Math.PI / 180;
                                    const Δλ = (lon2 - lon1) * Math.PI / 180;
                        
                                    const a = Math.sin(Δφ / 2) * Math.sin(Δφ / 2) +
                                              Math.cos(φ1) * Math.cos(φ2) *
                                              Math.sin(Δλ / 2) * Math.sin(Δλ / 2);
                                    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
                        
                                    const distance = R * c;
                                    return distance;
                                }
                            </script>
                        </div>                     
                        <jsp:include page="/Sidebar" flush="true"/>
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
                                                        <span class="price-currency-symbol" id = 'subtotal'>$${totalPrice}</span>
                                                    </bdi>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Shipping Method</th>
                                            <td data-title="Shipping Method">
                                                <span class="price-amount amount text-primary ps-5 fw-light">
                                                    <bdi>
                                                        <span class="price-currency-symbol" id = "ship"></span>
                                                    </bdi>
                                                </span>
                                            </td>
                                        </tr>
                                    <p id = "shippingType" hidden></p>
                                    <input type ="hidden" name = "inputShippingType" id ="inputShippingType" />
                                    <input type ="hidden" name = "distance" id = "distance"/>
                                        <script>
                                            function calculateShippingMethod(i) {                                                
                                                var ship;
                                                if (i == 1) {
                                                    ship = 'Standard Delivery';
                                                } else if (i == 2) {
                                                    ship = 'Heavy Delivery';
                                                } else {
                                                    ship = 'None';
                                                }
                                                document.getElementById('ship').textContent = ship;
                                                document.getElementById('dropdownMenuButton').innerHTML = ship;
                                                document.getElementById('shippingType').innerHTML = i;
                                                document.getElementById('inputShippingType').value = i;
                                                calculateShippingFee();
                                            }
                                            document.addEventListener('DOMContentLoaded', function(){
                                                var options = document.querySelectorAll('.dropdown-item');
                                                options.forEach(option => {
                                                    option.addEventListener('click', function(e){
                                                        e.stopPropagation();
                                                        e.preventDefault();
                                                        calculateShippingMethod(option.getAttribute('value'));
                                                    });
                                                });
                                            });
                                            calculateShippingMethod();
                                        </script>
                                        <tr>
                                            <th>Shipping</th>
                                            <td data-title="Shipping">
                                                <span class="price-amount amount text-primary ps-5 fw-light">
                                                    <bdi>
                                                        <span class="price-currency-symbol" id = "shipping">$</span>
                                                    </bdi>
                                                </span>
                                            </td>
                                        </tr>
                                        <script>
                                            function calculateShippingFee() {
                                                var distance = document.getElementById('result').textContent;
                                                var feePerKm;
                                                if (isNaN(distance)) feePerKm = 0;
                                                else {
                                                    var method = document.getElementById('shippingType').innerHTML;
                                                    var methodFee;
                                                    switch (method){
                                                        case "1":
                                                            methodFee = 0.3;
                                                            break;
                                                        case "2":
                                                            methodFee = 0.6;
                                                            break;
                                                        default:
                                                            methodFee = 0;
                                                    }
                                                    if (distance < 10000) {
                                                        feePerKm = 0.5 + methodFee;
                                                    } else if (distance < 30000) {
                                                        feePerKm = 1 + methodFee;
                                                    } else {
                                                        feePerKm = 1.5 + methodFee;
                                                    }
                                                    console.log("distance: " + distance);
                                                    console.log("feePerKm: " + feePerKm);
                                                    console.log("methodFee: " + methodFee);
                                                }
                                                document.getElementById('shipping').textContent = '$' + (feePerKm * (distance / 1000)).toFixed(2);
                                                calculateTotalPrice();
                                            }
                                            calculateShippingFee(); 
                                        </script>
                                        <tr class="order-total pt-2 pb-2 border-bottom">
                                            <th>Total</th>
                                            <td data-title="Total">
                                                <span class="price-amount amount text-primary ps-5 fw-light">
                                                    <bdi>
                                                        <span class="price-currency-symbol" id = "totalPrice">$</span>
                                                    </bdi>
                                                </span>
                                                <input id ="input-total" name = "input-total" hidden/>
                                            </td>
                                        </tr>
                                        <script>
                                            function calculateTotalPrice() {
                                                var totalPrice = parseFloat(document.getElementById('subtotal').textContent.split('$')[1]);
                                                var shippingFee = parseFloat(document.getElementById('shipping').textContent.split('$')[1]);
                                                if (isNaN(shippingFee)) shippingFee = 0;
                                                var total = totalPrice + shippingFee;
                                                console.log(total);
                                                document.getElementById('totalPrice').textContent = '$' + total.toFixed(2); // Format to 2 decimal places
                                                document.getElementById('input-total').value = total.toFixed(2);
                                            }
                                            calculateTotalPrice();
                                        </script>
                                    </tbody>
                                </table>
                            </div>
                            <div class="list-group">
                                <label class="list-group-item d-flex gap-2 border-0">
                                    <input class="form-check-input flex-shrink-0" type="radio" name="paymentMethod" value="online" checked>
                                    <span>
                                        <p class="mb-1">Direct bank transfer</p>
                                        <small>Make your payment directly into our bank account. Please use your Order ID. Your order will shipped after funds have cleared in our account.</small>
                                    </span>
                                </label>
                                <label class="list-group-item d-flex gap-2 border-0">
                                    <input class="form-check-input flex-shrink-0" type="radio" name="paymentMethod" value="direct">
                                    <span>
                                        <p class="mb-1">Cash on delivery</p>
                                        <small>Pay with cash upon delivery.</small>
                                    </span>
                                </label>
                            </div>
                            <div class="button-wrap mt-3">
                                <button type="submit" name="submit" class="btn">Place an order</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>

        <%@include file = "view/footer.jsp" %>

        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>
</html>