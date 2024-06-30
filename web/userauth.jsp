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
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
        }
        .sidebar {
            background-color: #f8f8f8;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }
        .sidebar .btn-modify, .sidebar .btn-visit {
            background-color: #f90;
            color: white;
        }
        .sidebar .btn-save {
            background-color: black;
            color: white;
        }
        .content {
            background-color: #eee;
            padding: 20px;
            height: 100vh;
        }
        .content iframe {
            width: 100%;
            height: calc(100% - 40px);
            border: none;
            background-color: #ccc;
        }
        
        button{
            border-radius: 5px!important;
        }
    </style>
</head>
<body>
    <div class="d-flex">
        <div class="sidebar d-flex flex-column p-3">
            <button class="btn btn-modify mb-2">Modify Role</button>
           
            <div class="mb-3">
                <label class="d-block"><input type="checkbox"> Role 1</label>
                <label class="d-block"><input type="checkbox"> Role 2</label>
                <label class="d-block"><input type="checkbox"> Role 3</label>
                <label class="d-block"><input type="checkbox"> Role 4</label>
                <label class="d-block"><input type="checkbox"> Role 5</label>
                <label class="d-block"><input type="checkbox"> Role 6</label>
            </div>
            <button class="btn btn-save mb-2">Save</button>
            <button class="btn btn-visit">Visit Page</button>
        </div>
            
        <div class="content flex-grow-1">
            <select class="form-select mb-3">
                <option selected>Site Select</option>
            </select>
            <iframe src="https://www.google.com" title="Site Content"></iframe>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

