CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	credit_rating INTEGER NOT NULL
);

CREATE TABLE car(
	car_id SERIAL PRIMARY KEY,
	car_make VARCHAR(50),
	car_model VARCHAR(50),
	car_color VARCHAR(50),
	car_year INTEGER NOT NULL,
	car_cost NUMERIC(10,2),
	car_new BOOLEAN,
	salesperson_id INTEGER NOT NULL,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	invoice_date DATE DEFAULT CURRENT_DATE,
	salesperson_id INTEGER NOT NULL,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	car_id INTEGER NOT NULL,
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE carparts(
	part_id SERIAL PRIMARY KEY,
	part_quantity INTEGER NOT NULL,
	part_cost NUMERIC(10,2),
	car_id INTEGER NOT NULL,
	FOREIGN KEY(car_id) REFERENCES car(car_id)
);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	cars_serviced INTEGER NOT NULL
);

CREATE TABLE car_mechanic(
	car_mechanic_id SERIAL PRIMARY KEY,
	car_id INTEGER NOT NULL,
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id)
);

CREATE TABLE service_recordticket(
	ticket_id SERIAL PRIMARY KEY,
	ticket_cost NUMERIC(8,2),
	service_date DATE DEFAULT CURRENT_DATE,
	part_id INTEGER NOT NULL,
	FOREIGN KEY(part_id) REFERENCES carparts(part_id),
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	car_id INTEGER NOT NULL,
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

