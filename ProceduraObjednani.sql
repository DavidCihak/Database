create procedure Objednani
@id_cus int,
@id_prod int,
@number_of_products int
as
begin
begin transaction tra
insert into orders(ord_date, done, done_date, id_cus, id_prod, number_of_products)
values (GETDATE(), 0 , NULL , @id_cus, @id_prod, @number_of_products)
update products set storage_count = storage_count - @number_of_products
where id_prod = @id_prod
commit
end




