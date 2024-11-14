Title: TTK * Piano music center

Background: TTK * Piano specializes in teaching piano, guitar and drawing.

“Music is the common language of mankind. Music exists deep in each person's heart. ”. TTK * Piano has the mission of awakening and developing a love of music, contributing to creating a society that can sympathize, share and bring joy to others through the distribution of music equipment, audio equipment, and music. Sound - Light and Music Education.

Program Specifications

Build a website for TTK * Piano music center. The website supports online register course. You must use Servlet as Main Controller and follow MVC2 model.

Features:

This system contains the following functions:

- Function 1: Login (2ms)

o In order to tracking your course, an authentication is required.

o If the user has not authenticated, the system redirects to the login page.

o The actor enters userID and password, the function checks if the userID with the password is in the available user list, then grant the access permission. If not, a message would appear to notify that user is not found.

o Login function includes logout and welcome functions.

 - Function 2: Search course (2 ms)

o List first 20 available coures in the system order by date (status is active and quantity greater than 0). Paging is required to use.

o Each course has a name, image, description, tuition fee, startDate, endDate, category, …

o User can find the course based on name  or category.

o All users can use this function (login is not required)

 - Function 3: Update course (2 ms)

o The list of first 20 course will be displayed (order by startdate). The course category and the course status will show in combo box (drop down list) form. Paging is required to use.

o Update information of the selected course: name, image, category,  createDate, endDate...

 o Update list course after update.

o The system must record the last update date, last update user.

o Only Admin role has permission to do this function.

- Function 4: Create course (2 ms)

o This function allows user to create new course.

o Create date and end date fields must use date component.

o The default status of new course is active.

o Only Admin role has permission to do this function.

 - Function 5: Booking (2 ms)

o Add the selected course to cart. The default quantity is 1.

o Each user can buy any available course in the list.

o User can view the selected course in the cart. For each course: course name, amount, tuition fee, total. The screen must show the total amount of money of this cart.

o User can remove the course from the cart. The confirm message will show before delete action.

o User can update amount of each course in cart.

o Click the Confirm button to store the course to database (must store the buy date time). The warning message will show if the selected course is out of stock. System will return and show orderID for tracking.

o Login is not required. If viewer not login then viewer must input the information booking.

o The default payment is cash payment.

o All user can use this function except Admin role.

 - Function 6: Order Tracking (extra)

o User can track their orders by orderID.

o User inputs the orderId and click Search to tracking their order.

o The screen must show the information of the order: User Name, orderID, orderDate, list of course, payment method, payment status.

o Login is required.

- Function 7: Integrate online payment (extra)

o User can pay online via Paypal.

- Function 8: Login extra (extra)

o Integrated login using Google email.

* The above specifications are only basic information; you must build the application according to real requirements.

* You have to build your own database.

* The lecturer will explain the requirement only once on the first slot of the assignment.
