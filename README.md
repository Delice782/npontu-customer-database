# Table of Contents
1. Introduction
2. Features
3. Database Structure
4. Assumptions
5. Enterprise Rules
6. Installation
7. Technologies Used
8. Security Measures
9. Project Presentation
10. Usage

# Introduction
The Npontu Customer Database project centralizes customer profiles, feedback, and purchase history into a unified system to address inefficiencies caused by fragmented data. Inspired by real-world challenges faced by Npontu Technologies, this solution enhances customer support, enables data-driven product improvements, and ensures a streamlined and positive customer experience.

# Features
1. Centralized Customer Data: Efficiently store and retrieve customer profiles, purchases, and feedback.
2. Streamlined Customer Support: Enable agents to access a customer’s entire history in one place for quicker issue resolution.
3. Structured Feedback System: Organize customer feedback to guide product updates and improvements.
4. Product Information Tracking: Maintain detailed data on products, development teams, and product categories.
5. Improved Product Development: Access real-time feedback to enhance products based on customer insights.

# Database Structure
The database is organized to manage data across the following areas:

1. Customer Demographics:
- Retrieve and sort client data.
- Identify the most popular products among specific customer types.

2. Product Information:
- Retrieve product details and associated development teams.
- Sort products by cost and price.

3. Client Feedback:
- Retrieve feedback data by client and product.
- Calculate average and maximum ratings for products.

4. Product Purchases:
Retrieve purchase data based on product name, customer name, or purchase date.

# Assumptions
1. Each customer is either a Government or Non-Government entity.
2. Products fall into one of three categories: AI, IT Consult, or Apps.
3. Feedback is categorized as LowRating, MediumRating, or HighRating.
4. Each product is developed by one team at a time.
5. The system does not track historical changes in product prices or team assignments.
6. Feedback is always linked to both a customer and a product.

# Enterprise Rules
1. Customer-Purchase: A customer can make multiple purchases; each purchase is made by exactly one customer.
2. Product-Purchase: A product can be involved in multiple purchases; each purchase involves exactly one product.
3. Customer-Feedback: A customer can provide multiple pieces of feedback; each feedback is given by exactly one customer.
4. Product-Feedback: A product can receive multiple pieces of feedback; each feedback is about exactly one product.
5. Customer Specialization: Each customer must be classified as either Government or Non-Government.
6. Product Specialization: Each product is categorized as AI, IT Consult, or Apps.
7. Feedback Specialization: Feedback is classified into LowRating, MediumRating, or HighRating.
8. Product-DevTeam: Each product is developed by exactly one development team; a team can develop multiple products.

# Installation
# Prerequisites
1. MySQL database
2. Web browser for the user interface

# Technologies Used
1. Database: MySQL for managing data.
2. WordPress
3. Encryption: Used for securing sensitive information.

# Security Measures
1. Encryption: Protect sensitive data such as passwords and payment details.
2. Data Integrity: Measures to ensure data consistency and security.

# Usage
1. Customer Service: Access customer profiles and interaction history to provide prompt and personalized support.
2. Product Development: Analyze structured feedback to identify areas for improvement and prioritize updates.

# Project Presentation
1. Watch our presentation here. [https://youtu.be/pbuU3Gr9dog]
2. View the user interface demo here. [https://youtu.be/pbuU3Gr9dog]

# References:
Npontu Technologies. (n.d.). NPontu Technologies | AI & Big Data Solutions. Npontu Technologies.
