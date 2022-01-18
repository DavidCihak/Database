use PV;
--naplneni tabulky zakazniku
insert into customers(id_cus, fullname, gender, phone_numb, email, pi_numb) values 
(1, 'David Cihak', 'male', 777777777, 'cihak@spsejecna.cz', 656565656),
(2, 'Eliska Cerna', 'female', 666666666, 'cerna@spsejecna.cz', 123565656),
(3, 'Michaela Mysliveckova', 'female', 555555555, 'mysliveckova@spsejecna.cz', 321565656),
(4, 'Filip Cermak', 'male', 444444444, 'cermak@spsejecna.cz', 659865656),
(5, 'Sergei Bee', 'male', 333333333, 'bee@spsejecna.cz', 116565656);

insert into addresses(cus_id, street, city, country) values
(1, 'Holeckova', 'Prague', 'CZ'),
(2, 'Karoliny Svetle', 'Prague', 'CZ'),
(3, 'Parizska', 'Prague', 'CZ'),
(4, 'Masarykova', 'Brno', 'CZ'),
(5, 'Polni', 'Brno', 'CZ');

insert into products(id_prod, name, producer_brand, expiration_date, price,storage_count, sn) values
(1, 'PeanutButter', 'Nutrend', '2026-9-1', 399.90, 50, 3864736 ),
(2, 'Whey Protein', 'GymBean', '2022-12-31', 784.90, 30, 38664634 ),
(3, 'Protein Pancakes', 'GymBean', '2022-9-1', 49.90, 20, 649848 ),
(4, 'Nutella', 'Fererro', '2023-3-5', 69.90, 10, 3545375 ),
(5, 'Food for dogs', 'Bifid', '2025-9-8', 1200.0, 30, 5645638 ),
(6, 'Oreo chockolate', 'Milka', '2022-5-1', 25.90, 50, 5674657 );


insert into reviews(id_rev, reviewer_name, content, rating_stars, published_date, id_prod) values
(1, 'boss48', 'very nice taste' , 5, CURRENT_TIMESTAMP, 1),
(7, 'boss48', 'very nice taste' , 5, CURRENT_TIMESTAMP, 1),
(2, 'MenT98', 'not bad taste' , 4, '2021-06-02 09:13:00.00', 1),
(3, 'user8', 'my dog vomited' , 1, '2021-09-03 04:14:00.00', 5),
(4, 'habkpauh', 'nothin' , 3, '2021-01-02 11:14:00.00', 2),
(5, 'mortal', 'I like that' , 4, '2021-01-01 08:15:00.00', 3),
(6, 'gamer', 'After this I will be huge' , 5, '2021-10-04 07:16:00.00', 4);

insert into orders(ord_date, done, done_date, id_cus, id_prod, number_of_products) values
(CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP, 1, 1, 2),
(2020-01-01, 0, NULL, 1, 2, 3),
(2021-03-03, 1, 2021-03-10, 2, 3, 5),
(2021-12-12, 1, 2022-01-01, 3, 4, 6),
(CURRENT_TIMESTAMP, 0, NULL, 4, 5, 2),
(2021-09-09, 1, 2021-09-16, 5, 6, 1);