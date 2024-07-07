<!DOCTYPE html>
<html lang="en">
    <%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <head>
        <title>${page == null ? "User Authorization" : page}</title>
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
        <!-- Select2 CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />

        <!-- jQuery (Select2 depends on it) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Select2 JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js" defer></script>
        <style>
            .content iframe {
                width: 100%;
                height: calc(100% - 40px);
                border: none;
                background-color: #ccc;
            }
            .iframe-cover {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                z-index: 10;
            }

            .select2{
                width:100%!important;
            }

            .url-row {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 8px;
                border-bottom: 1px solid #ccc; /* Visual separation of rows */
            }
            .url-text {
                flex-grow: 1; /* URL takes up the majority of the space */
            }
            .btn-remove {
                margin-left: 10px; /* Space between the URL and the button */
            }
        </style>
    </head>
    <body>
        <%@include file = "view/header.jsp" %>
        <div class="d-flex">
            <div class="sidebar d-flex flex-column px-3">       
                <form action="updateauth" class ="card px-3 py-3 mb-3">
                    <h5 class="btn btn-modify mb-2">Modify Role</h5>
                    <div id="unsavedIndicator" class="text-danger fw-bold"></div>
                    <div class="mb-3">
                        <c:forEach var="role" items="${roles}">
                            <label class="d-block">
                                <input type="checkbox" value="${role.role_id}" name="role"
                                       <c:if test="${roleSelected.contains(role.role_id)}">checked</c:if>>
                                <c:set var="rolePurposeWithSpaces" value="${fn:replace(role.role_purpose, '_', ' ')}" />
                                <c:set var="formattedText" value="" />
                                <c:forEach var="word" items="${fn:split(fn:toLowerCase(rolePurposeWithSpaces), ' ')}">
                                    <c:set var="formattedText" value="${formattedText} ${fn:toUpperCase(fn:substring(word,0,1))}${fn:substring(word,1,fn:length(word))}" />
                                </c:forEach>
                                <span class="ps-1">${formattedText}</span>
                            </label>
                        </c:forEach>
                        <input type="text" name="url" value="${(url==null) ? '/' : url}" hidden>
                    </div>
                    <button type="submit" class="btn btn-save mb-2">Save</button>
                    <c:choose>
                        <c:when test="${not empty url}">
                            <a class="btn btn-save mb-2" href="${(fn:startsWith(url, '/') ? fn:substring(url, 1, url.length()) : url)}">Visit Page</a>
                        </c:when>
                        <c:otherwise>
                            <a class="btn btn-save mb-2" href="http://localhost:9999/app-name/">Visit Page</a>
                        </c:otherwise>
                    </c:choose>
                </form>
                <div class="card px-3 py-3">
                    <h5 class="btn btn-modify mb-2 align-center">Modify Hidden Urls</h5>
                    <div class="mb-3">
                        <div class="d-flex flex-grow-1">
                            <form class="me-2 w-100" action = "addHiddenUrl">
                                <button class="btn btn-secondary w-100 dropdown-toggle" type="button" id="hiddenUrlDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                    Select Options
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="hiddenUrlDropdown">
                                    <div class = "d-flex justify-content-center">
                                        <input type="text" id="searchInput" placeholder="Search..." class="form-control mb-2 py-2 px-2" style = "max-width:96%">
                                    </div>
                                    <div id="dropdownItemsContainer"> <!-- This is the container for the items -->
                                        <c:forEach var="urlItem" items="${fullUrls}">
                                            <li class="dropdown-item">
                                                <input type="checkbox" name = "hiddenUrl" class="form-check-input" value="${urlItem}" id="checkbox-${urlItem}" 
                                                       <c:if test="${hiddenUrlsSelected.contains(urlItem)}">
                                                           checked
                                                       </c:if> 
                                                       />
                                                <label for="checkbox-${urlItem}" class="form-check-label">
                                                    ${urlItem == '/' ? 'Home' : urlItem}
                                                </label>
                                            </li>
                                        </c:forEach>
                                    </div>
                                    <div class="d-flex justify-content-between px-3">
                                        <button id="prevPageBtn" class="btn btn-secondary btn-sm">Previous</button>
                                        <button id="nextPageBtn" class="btn btn-secondary btn-sm">Next</button>
                                        <button type="submit" class="btn btn-primary btn-sm">Save</button>
                                    </div>
                                </ul>
                            </form>
                        </div>
                        <script>
                            document.addEventListener('DOMContentLoaded', function () {
                                const searchInput = document.getElementById('searchInput');
                                const dropdownItemsContainer = document.getElementById('dropdownItemsContainer');
                                const prevPageBtn = document.getElementById('prevPageBtn');
                                const nextPageBtn = document.getElementById('nextPageBtn');
                        
                                let items = Array.from(document.querySelectorAll('.dropdown-item'));
                                let filteredItems = items;
                                let currentPage = 1;
                                const pageSize = 3;
                        
                                function renderItems() {
                                    // Hide all items first
                                    items.forEach(item => item.style.display = 'none');
                        
                                    // Calculate which items to show
                                    const startIndex = (currentPage - 1) * pageSize;
                                    const endIndex = startIndex + pageSize;
                                    filteredItems.slice(startIndex, endIndex).forEach(item => {
                                        item.style.display = ''; // Show current page items
                                    });
                        
                                    prevPageBtn.disabled = currentPage === 1;
                                    nextPageBtn.disabled = endIndex >= filteredItems.length;
                                }
                        
                                searchInput.addEventListener('input', function () {
                                    const searchText = searchInput.value.toLowerCase();
                                    filteredItems = items.filter(item => {
                                        const label = item.querySelector('label').textContent.toLowerCase();
                                        return label.includes(searchText);
                                    });
                                    currentPage = 1;
                                    renderItems();
                                });
                        
                                prevPageBtn.addEventListener('click', function (e) {
                                    e.stopPropagation();
                                    e.preventDefault();
                                    if (currentPage > 1) {
                                        currentPage--;
                                        renderItems();
                                    }
                                });
                        
                                nextPageBtn.addEventListener('click', function (e) {
                                    e.stopPropagation();
                                    e.preventDefault();
                                    if (currentPage * pageSize < filteredItems.length) {
                                        currentPage++;
                                        renderItems();
                                    }
                                });
                        
                                // Prevent dropdown from closing when clicking on items
                                items.forEach(function (item) {
                                    item.addEventListener('click', function (e) {
                                        e.stopPropagation();
                                        const checkbox = item.querySelector('input[type="checkbox"]');
                                        checkbox.checked = !checkbox.checked; // Toggle checkbox state
                                    });
                                });
                        
                                // Initial render
                                renderItems();
                            });
                        </script>
                        <div class="flex-wrap mt-2" id="hiddenUrlContainer">
                            <!-- The container for hidden URLs -->
                        </div>
                        <div id="paginationControls" class="mt-2">
                            <button onclick="loadPage(currentPage - 1)" id="prevPage" class="btn btn-secondary">Previous</button>
                            <button onclick="loadPage(currentPage + 1)" id="nextPage" class="btn btn-secondary">Next</button>
                        </div>
                        <script>
                            let currentPage = 0;
                            const pageSize = 3;

                            function loadPage(page) {
                                fetch('showhiddenurl?page=' + page + '&pageSize=' + pageSize)
                                        .then(response => response.json())
                                        .then(data => {
                                            updateUI(data.urls);
                                            currentPage = page;
                                            document.getElementById('prevPage').disabled = currentPage === 0;
                                            document.getElementById('nextPage').disabled = currentPage >= data.totalPages - 1;
                                        })
                                        .catch(error => console.error('Error:', error));
                            }

                            function updateUI(urls) {
                                const container = document.getElementById('hiddenUrlContainer');
                                container.innerHTML = ''; // Clear existing content
                                urls.forEach(url => {
                                    const row = document.createElement('div');
                                    row.className = 'url-row';
                                    const urlSpan = document.createElement('span');
                                    urlSpan.className = 'url-text';
                                    urlSpan.textContent = url;
                                    const removeButton = document.createElement('a');
                                    removeButton.href = 'removehiddenurl?url=' + url;
                                    removeButton.addEventListener('click', function(e) {
                                        e.preventDefault(); // Prevent the default link behavior
                                        const modal = document.getElementById('confirmationModal');
                                        document.getElementById('urlToRemove').textContent = url; // Set the URL in the modal text
                                        $('#confirmationModal').modal('show'); // Show the modal (using Bootstrap's modal function)

                                        document.getElementById('confirmRemove').onclick = function() {
                                            // Perform the removal operation here
                                            // For example, you could redirect to the remove URL or make an AJAX request
                                            window.location.href = removeButton.href;
                                        };
                                    });
                                    removeButton.className = 'btn btn-remove';
                                    removeButton.setAttribute('data-url', url);
                                    removeButton.textContent = 'x';
                                    row.appendChild(urlSpan);
                                    row.appendChild(removeButton);
                                    container.appendChild(row);
                                });
                            }

                            // Initial load
                            loadPage(currentPage);
                        </script>
                    </div>
                    <!-- Confirmation Modal -->
                    <div class="modal modal-fade" tabindex="-1" role="dialog" id="confirmationModal">
                        <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                            <h5 class="modal-title">Confirm Removal</h5>
                            </div>
                            <div class="modal-body">
                            <p>Do you want to remove <span id="urlToRemove"></span> from the hidden list?</p>
                            </div>
                            <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="confirmRemove">Yes</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content flex-grow-1">
                <form action="userauthorization" method="GET"> 
                    <select class="form-select mb-3 searchable-select" name="url" id = "urlselect" onchange="this.form.submit()">
                        <option value="http://localhost:9999/app-name/" ${url.equals("http://localhost:9999/app-name/") ? "selected" : ""}>Home</option>
                        <option value="/" ${url.equals("/") ? "selected" : ""}>Home</option>
                        <c:forEach var="urlItem" items="${urls}">
                            <option value="${urlItem}" ${urlItem.equals(url) ? "selected" : ""}>${urlItem == '/' ? 'Home' : urlItem}</option>
                        </c:forEach>
                    </select>
                </form>
                <div style="position: relative;">
                    <iframe id="contentIframe" src="${url == '/' ? 'http://localhost:9999/app-name/' : (fn:startsWith(url, '/') ? fn:substring(url, 1, url.length()) : url)}" title="${url == '/' ? 'Home' : url}" style="width: 100%; height: 500px; border: none;"></iframe>
                    <div class="iframe-cover" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; z-index: 10; background: transparent;"></div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
                        document.addEventListener('DOMContentLoaded', function () {
                            var iframeCover = document.querySelector('.iframe-cover');
                            var iframe = document.getElementById('contentIframe');

                            // Assuming the iframe content is from the same origin for this to work
                            iframeCover.addEventListener('wheel', function (e) {
                                // Prevent the default wheel behavior (page scrolling)
                                e.preventDefault();
                                // Scroll the iframe content, adjust the 30 to control scroll speed
                                var scrollAmount = e.deltaY > 0 ? 500 : -500;
                                iframe.contentWindow.scrollBy(0, scrollAmount);
                            });
                        });
        </script>

        <script>
            $(document).ready(function () {
                $('.searchable-select').select2({
                    placeholder: "Select an option",
                    allowClear: true
                });
            });
        </script>
        <%@include file = "view/footer.jsp" %>
        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>
</html>

