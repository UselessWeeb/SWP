<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Payment Result</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Outfit', sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f8f9fa;
                margin: 0;
            }
            .result-container {
                text-align: center;
                padding: 2rem;
                background: #fff;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
            }
            .result-container h1 {
                margin-bottom: 1rem;
            }
            .checkmark {
                width: 80px;
                height: 80px;
                border-radius: 50%;
                display: inline-block;
                position: relative;
                border: 5px solid #28a745;
                animation: pop 0.3s ease-in-out;
            }
            .checkmark:before {
                content: "";
                position: absolute;
                width: 40px;
                height: 20px;
                border: 5px solid #28a745;
                border-top: none;
                border-right: none;
                top: 25px;
                left: 14px;
                transform: rotate(-45deg);
            }
            @keyframes pop {
                0% {
                    transform: scale(0);
                }
                100% {
                    transform: scale(1);
                }
            }
        </style>
        <script>
            setTimeout(function () {
                window.location.href = "/app-name/"; // Replace with your home page URL
            }, 5000); // Redirects after 5 seconds
        </script>
    </head>
    <body>
        <div class="result-container">
            <div class="checkmark"></div>
            <h1>${message}</h1>
            <p>You will be redirected to the home page shortly.</p>
        </div>
    </body>
</html>