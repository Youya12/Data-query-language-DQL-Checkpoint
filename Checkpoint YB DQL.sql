create table customer (
customer_id varchar (20) primary key, 
customer_name varchar (20), 
customer_tel integer);

create table product (
product_id varchar (20) primary key, 
product_name varchar(30), 
category varchar (30), 
price decimal);

create table orders (
customer_id varchar (20),
product_id varchar (20),
constraint FK1 foreign key (customer_id) references customer (customer_id),
constraint FK2 foreign key (product_id) references product (product_id),
order_date date, 
quantity integer, 
total_amount decimal
);

insert into customer (customer_id, customer_name, customer_tel) values 
('C01','ALI',71321009),
('C02','ASMA',77345823);

insert into  product (product_id, product_name, category, price) values
('P01','Samsung Galaxy S20','Smartphone',3299),
('P02','ASUS Notebook','PC',7599);

insert into orders (customer_id, product_id, order_date, quantity, total_amount) values
('C01','P02',NULL,3,9198),
('C02','P01','2020-05-28',1,3299);

select * from customer;

select product_name, category 
from product 
where price between 4000 and 10000;

select * from product order by price desc;

select 
    product_id,
    count(*) as total_orders,
    avg(total_amount) as average_amount,
    max(total_amount) as highest_total_amount,
    min(total_amount) as lowest_total_amount
from orders
group by product_id;
 
select customer_id
from orders
group by customer_id
having sum(quantity)>2;

select 
    date_format(order_date, '%Y-%m') as order_month, 
    count(*) as order_count
from orders
where year(order_date) = 2020
group by order_month
order by order_month;

select product_name, customer_name, order_date
from orders
join product on orders.product_id = product.product_id
join customer on orders.customer_id = customer.customer_id;

select * from orders
join product on orders.product_id = product.product_id
join customer on orders.customer_id = customer.customer_id
where orders.order_date >= date_sub(curdate(), interval 3 month);

insert into customer (customer_id, customer_name, customer_tel) values 
('C04','MELI',71321078);

select customer.customer_id
FROM customer
left join orders on customer.customer_id = orders.customer_id
where orders.customer_id is null;
