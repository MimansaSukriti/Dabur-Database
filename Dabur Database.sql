drop database colleges;
drop database faculty;
drop database fore;
drop database sakila;
drop database sp;
drop database sys;
drop database world;
drop database if exists dabur_dbms;
create database dabur_dbms;
use dabur_dbms;
create table product_category (
    category_id smallint unsigned primary key auto_increment,
    category_name varchar(40) not null unique,
    description varchar(150)
);
create table product (
    product_id int unsigned primary key auto_increment,
    product_name varchar(80) not null,
    category_id smallint unsigned not null,
    mrp decimal(8,2) not null,
    net_weight_gm smallint unsigned,
    shelf_life_days smallint unsigned,
    is_ayurvedic boolean default 0,

    constraint fk_product_category
        foreign key (category_id)
        references product_category(category_id)
);
create table supplier (
    supplier_id smallint unsigned primary key auto_increment,
    supplier_name varchar(80) not null,
    supplier_type enum('Herbs','Packaging','Chemical') not null,
    contact_no char(10),
    city varchar(40)
);
create table manufacturing_plant (
    plant_id smallint unsigned primary key auto_increment,
    plant_name varchar(60) not null,
    state varchar(40),
    capacity_units int unsigned
);
create table warehouse (
    warehouse_id smallint unsigned primary key auto_increment,
    location_city varchar(40),
    storage_capacity int unsigned
);
CREATE TABLE distributor (
    distributor_id smallint unsigned primary key auto_increment,
    distributor_name varchar(80),
    region varchar(40),
    contact_no char(10)
);
create table retailer (
    retailer_id int unsigned primary key auto_increment,
    retailer_name varchar(80),
    retailer_type enum('Medical','Grocery','Supermarket') not null,
    city varchar(40)
);
create table purchase_order (
    po_id int unsigned primary key auto_increment,
    supplier_id smallint unsigned not null,
    order_date date not null,
    total_amount decimal(10,2),

    constraint fk_po_supplier
        foreign key (supplier_id)
        references supplier(supplier_id)
);
create table production_batch (
    batch_id int unsigned primary key auto_increment,
    product_id int unsigned not null,
    plant_id smallint unsigned not null,
    batch_date date not null,
    quantity_produced int unsigned not null,

    constraint fk_batch_product
        foreign key (product_id)
        references product(product_id),

    constraint fk_batch_plant
        foreign key (plant_id)
        references manufacturing_plant(plant_id)
);
create table inventory (
    inventory_id int unsigned primary key auto_increment,
    product_id int unsigned not null,
    warehouse_id smallint unsigned not null,
    quantity_available int unsigned not null,

    constraint fk_inventory_product
        foreign key (product_id)
        references product(product_id),

    constraint fk_inventory_warehouse
        foreign key (warehouse_id)
        references warehouse(warehouse_id)
);
create table sales_order (
    sales_order_id int unsigned primary key auto_increment,
    distributor_id smallint unsigned not null,
    order_date date not null,
    order_status enum('Pending','Dispatched','Delivered') default 'Pending',

    constraint fk_sales_distributor
        foreign key (distributor_id)
        references distributor(distributor_id)
);
create table sales_order_items (
    sales_order_id int unsigned,
    product_id int unsigned,
    quantity smallint unsigned not null,
    selling_price decimal(8,2) not null,

    primary key (sales_order_id, product_id),

    constraint fk_so_item_order
        foreign key (sales_order_id)
        references sales_order(sales_order_id),

    constraint fk_so_item_product
        foreign key (product_id)
        references product(product_id)
);
create table payment (
    payment_id int unsigned primary key auto_increment,
    sales_order_id int unsigned not null,
    payment_date date,
    payment_mode enum('Cash','UPI','Bank Transfer'),
    amount decimal(10,2),

    constraint fk_payment_order
        foreign key (sales_order_id)
        references sales_order(sales_order_id)
);
insert into product_category (category_name) values
('Ayurvedic Medicines'),
('Foods'),
('Oral Care');

insert into product (product_name, category_id, mrp, net_weight_gm, shelf_life_days, is_ayurvedic)
values
('Chyawanprash', 1, 320.00, 500, 540, 1),
('Honey', 2, 199.00, 250, 365, 1);

insert into supplier (supplier_name, supplier_type, city)
values
('Herbal Suppliers Ltd', 'Herbs', 'Haridwar');

insert into manufacturing_plant (plant_name, state, capacity_units)
values
('Dabur Baddi Plant', 'Himachal Pradesh', 500000);

insert into warehouse (location_city, storage_capacity)
values
('Delhi', 200000);

insert into distributor (distributor_name, region)
values
('North India Distributors', 'North');

insert into sales_order (distributor_id, order_date)
values
(1, '2025-10-01');

insert into sales_order_items
values
(1, 1, 100, 300.00);

insert into payment (sales_order_id, payment_date, payment_mode, amount)
values
(1, '2025-10-05', 'Bank Transfer', 30000.00);
