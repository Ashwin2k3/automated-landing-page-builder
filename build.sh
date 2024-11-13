#!/bin/bash

# Prompt for client input
echo "Welcome to the Landing Page Generator!"
read -p "Enter the title of the page: " PAGE_TITLE
read -p "Enter a headline for the landing page: " HEADLINE
read -p "Enter a subheading for the landing page: " SUBHEADING
read -p "Enter a description for the landing page: " DESCRIPTION
read -p "Enter a call-to-action button text: " CTA_TEXT
read -p "Enter the link for the call-to-action button (URL): " CTA_LINK
read -p "Enter your business name: " BUSINESS_NAME
read -p "Enter a tagline for your business: " TAGLINE
read -p "Enter your primary color (e.g., #3498db): " PRIMARY_COLOR
read -p "Enter your secondary color (e.g., #2ecc71): " SECONDARY_COLOR
read -p "Enter the path to your business logo (e.g., logo.png): " LOGO
read -p "Enter the features of your business (comma separated): " FEATURES
read -p "Enter your contact information (phone/email): " CONTACT_INFO

# Set up the directory and files
DIR_NAME="${PAGE_TITLE// /_}_landing_page"
mkdir -p "$DIR_NAME"
cd "$DIR_NAME"

# Create HTML file
cat <<EOL > index.html
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$PAGE_TITLE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>

<!-- Header Section -->
<header class="bg-$PRIMARY_COLOR text-white text-center py-5">
    <img src="$LOGO" alt="$BUSINESS_NAME Logo" class="img-fluid mb-4" style="max-height: 120px;">
    <h1 class="display-3">$BUSINESS_NAME</h1>
    <p class="lead">$TAGLINE</p>
</header>

<!-- Landing Page Content -->
<div class="container text-center my-5">
    <div class="animate__animated animate__fadeInDown">
        <h2 class="display-4 mb-4">$HEADLINE</h2>
        <p class="lead">$SUBHEADING</p>
    </div>
    <div class="animate__animated animate__fadeInUp mt-5">
        <p class="mt-4">$DESCRIPTION</p>
        <a href="$CTA_LINK" class="btn btn-$PRIMARY_COLOR btn-lg mt-4">$CTA_TEXT</a>
    </div>
</div>

<!-- Features Section -->
<div class="container my-5">
    <h2 class="text-center mb-4">Our Features</h2>
    <div class="row">
        $(for FEATURE in $(echo $FEATURES | tr ',' '\n'); do
            echo "<div class='col-12 mb-4'>
                    <div class='card shadow-sm border-0'>
                        <div class='card-body'>
                            <h5 class='card-title'>$FEATURE</h5>
                            <p class='card-text'>Explore our $FEATURE services for enhanced business efficiency.</p>
                        </div>
                    </div>
                  </div>"
        done)
    </div>
</div>

<!-- Contact Section -->
<div class="container my-5 bg-light py-5 rounded">
    <h2 class="text-center mb-4">Contact Us</h2>
    <p class="text-center lead">$CONTACT_INFO</p>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="script.js"></script>
</body>
</html>

EOL

# Create CSS file
cat <<EOL > style.css
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(120deg, #2980b9, #6dd5fa, #ffffff);
    color: #333;
    display: flex;
    flex-direction: column; /* Ensures vertical stacking of content */
    align-items: center;
    justify-content: flex-start; /* Align items to the top */
    min-height: 100vh;
    margin: 0;
    padding-top: 20px; /* Adds space at the top */
}

header {
    background-color: $PRIMARY_COLOR;
    padding: 5rem 0;
    width: 100%; /* Ensures header spans the full width */
    text-align: center;
}

header h1 {
    font-size: 3.5rem;
    font-weight: bold;
}

header p {
    font-size: 1.3rem;
}

h2 {
    color: $PRIMARY_COLOR;
    font-size: 2rem;
    text-align: center; /* Centers the text */
}

.card {
    transition: transform 0.3s ease;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px; /* Adds space between cards */
}

.card:hover {
    transform: scale(1.05);
}

.card-title {
    font-size: 1.5rem;
    font-weight: bold;
    color: $PRIMARY_COLOR;
}

.card-text {
    color: #555;
}

.btn-$PRIMARY_COLOR {
    background-color: $PRIMARY_COLOR;
    border: none;
    transition: transform 0.3s ease;
    font-weight: bold;
    padding: 12px 40px;
}

.btn-$PRIMARY_COLOR:hover {
    transform: scale(1.1);
    background-color: $SECONDARY_COLOR;
}

.bg-light {
    background-color: #f8f9fa !important;
    width: 100%; /* Ensures full-width container for contact section */
    padding: 3rem 0;
}

@media (max-width: 768px) {
    header h1 {
        font-size: 2.5rem;
    }
    .card-title {
        font-size: 1.3rem;
    }
    .container {
        padding-left: 15px;
        padding-right: 15px;
    }
}


EOL

# Create JS file
cat <<EOL > script.js
document.addEventListener("DOMContentLoaded", function() {
    console.log("Landing page loaded successfully!");
});
EOL

echo "Landing page files generated successfully in the '$DIR_NAME' folder."

sleep 2 

cd $DIR_NAME 

open index.html 
