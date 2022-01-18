use PV;

CREATE TABLE customers(
id_cus int primary key not null,
fullname nvarchar(60) not null,
gender VARCHAR(10) NOT NULL CHECK (gender IN('male', 'female')), --ENUM parametr
phone_numb int not null,
email nvarchar(40) not null,
pi_numb int not null
);

CREATE TABLE addresses (
  cus_id int primary key not null, -- oba dva primary + foreign key
  street varchar(30) NOT NULL,
  city varchar(30) NOT NULL,
  country varchar(30) NOT NULL,
  FOREIGN KEY (cus_id) REFERENCES customers (id_cus) ON DELETE CASCADE
);

CREATE TABLE products ( 
  id_prod int primary key not null,
  name varchar(100) NOT NULL,
  producer_brand varchar(100) NOT NULL,
  expiration_date date NOT NULL,
  price float not null,
  storage_count int not null,
  sn char(12),
  UNIQUE (sn)
);


CREATE TABLE reviews (
  id_rev int primary key not null,
  reviewer_name varchar(255),
  content varchar(255),
  rating_stars integer CHECK(rating_stars <=5),
  published_date datetime,
  id_prod int FOREIGN KEY (id_prod) REFERENCES products(id_prod) ON DELETE CASCADE
);

CREATE TABLE orders (
  id_ord int primary key identity(1,1) not null,
  ord_date date not null,
  done bit not null, --Boolean
  done_date date,
  id_cus int FOREIGN KEY (id_cus) REFERENCES customers(id_cus) ON DELETE CASCADE,
  id_prod int FOREIGN KEY (id_prod) REFERENCES products(id_prod) ON DELETE CASCADE,
  number_of_products int not null
);