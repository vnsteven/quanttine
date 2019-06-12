# Quanttine

http://quanttine.herokuapp.com/

Quanttine is a web application that aims to reduce the food wasting in school canteens, by knowing what the students will eat so the kitchen's stock can adjust over this information.

To do so, we oganised the app around two ends : the Student and Kitchen.

		Student end :

	- The user can pick his meal the day before, according to the avalaible stock.
	- He can also obtain informations about the food properties.
	- A comment feature is implemented to have comments and rating about the meals.
	- Possibilty to pay mounthly through our app.
	- The app will also suggest meal to the students, according to their preferences or specific diet.

		Kitchen end :

	- Through an admin dashboard, the kitchen can access to student's preferences so they can adjust the quantity of food to order and cook daily.
	- The app will provide a recap of the stock.

# How does it works ?

The students that paid the service will be filtered by a gate, then they will have to scan a QR code. On the kitchen end, a screen will show them exactly what they will have to serve on each plate.

The python script to scan qr code data can be found here: https://github.com/ryanzidago/qr_code_scanner


Developed by Ryan Zidago, Camille Rungette, Steven Nguyen, Sylvain Comelli and Romain Genestre.
