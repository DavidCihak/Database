import csv
import logging

#metoda pro vytvoření objednávky zpětně -> nutno zadat datumy
def chyba():
    print("Nastala chyba - Program se ukočil")
    exit()

def insertOrd(id_ord, ord_date, done, done_date, id_cus, id_prod, number_of_products, cursor):
    try:
        cursor.execute('''
                        INSERT INTO orders (id_ord, ord_date, done, done_date, id_cus, id_prod)
                        VALUES
                        (?,?,?,?,?,?)
                        ''',(id_ord, ord_date, done, done_date, id_cus, id_prod, number_of_products))
    except:
        chyba()


#metoda pro vytvoření objednávky s aktuálním datem
def objednani(id_zak, id_prod, pocet, cursor):
    try:
        cursor.execute('''
                        exec Objednani @id_cus = ?, @id_prod = ?, @number_of_products = ?
                        ''', (id_zak, id_prod, pocet))
    except:
        chyba()

#metoda pro smazání záznamu z tabulky orders z podle id_ord
def deleteOrd(hodnota, cursor):
    try:
        cursor.execute('''
                        DELETE FROM orders 
                        WHERE id_ord in (?)
                        ''',(hodnota))
    except:
        chyba()

#dodělat
def selectRest(cursor):
    try:
        print("Výpis zbylých produktů na skladě:")
        print("Název, pocetSkladem")
        cursor.execute('SELECT name, storage_count FROM products')
        for i in cursor:
            print(i)
    except:
        chyba()

def average(cursor):
    try:
        print("Výpis průměrné ceny jedné objednávky v Kč")
        cursor.execute('''select avg(p.price*o.number_of_products)
                        from orders o
                        inner join products p ON o.id_prod=p.id_prod''')
        for i in cursor:
            print(i)
    except:
        chyba()

#metoda pro vypsání názvu produktu počet objednaných produktu a celkovou cenu
def bills(cursor):
    try:
        print("Výpis všech účtenek včetně výpočtu celkové ceny")
        print("(Objednavka, Nazev_Produktu, Cena_kus, Pocet_kusu ,Cena_celkem)")
        cursor.execute('''select o.id_ord as Objednavka, p.name as Nazev_Produktu, p.price as Cena_kus, o.number_of_products as Pocet_kusu,(o.number_of_products*p.price) as Cena_celkem
                        from orders o
                        inner join products p ON o.id_prod=p.id_prod''')

        header = ['Objednavka', 'Nazev_produktu', 'Cena_kus', 'Pocet_kusu', 'Cena_celkem']
        data = []
        for i in cursor:
            print(i)
            data.append(i)

        vypis = "None"
        while vypis != "ano" and vypis != "ne":
            vypis = input("Přejete si účtenky exportovat do CSV souboru?\n zadej >ano< pokud nechcete dejte enter")

            if vypis == "ano":
                try:
                    # export do csv souboru
                    with open(r"/Ukol13/CSVBillsExport.csv", 'w',
                              encoding="utf-8", newline='') as f:
                        writer = csv.writer(f)
                        writer.writerow(header)
                        for i in data:
                            data2 = [i[0],i[1],i[2],i[3],i[4]]
                            writer.writerow(data2)
                    print("Export dat do CSV souboru proběhl úspěšně.")
                except FileNotFoundError:
                    print("Popis chyby + kdy se stala najdete v souboru >error.log<")
                    logging.error("Spatna path nebo se nepodarilo nalezt soubor >.csv< ")
            elif vypis == "ne":
                exit()
    except:
        chyba()

#metoda pro update tabulky orders
def updateOrd(atributA, hodnotaA, id, cursor):
    try:
        cursor.execute('''
                        UPDATE orders
                        SET ? = ?
                        WHERE id_cus = ?
                        ''',(atributA, hodnotaA, id))
    except:
        chyba()

#metody pro vypsání tabulek: orders, customers, products, reviews, addresses
def selectOrd(cursor):
    try:
        print("Výpis všech objednávek: ")
        print("(id_ord, ord_date, done, done_date, id_cus, id_prod, number_of_products)")
        cursor.execute('SELECT * FROM orders')
        for i in cursor:
            print(i)
    except:
        chyba()

def selectCus(cursor):
    try:
        print("(id_cus, fullname, gender, phone_numb, email, pi_numb)")
        cursor.execute('SELECT * FROM customers')
        for i in cursor:
            print(i)
    except:
        chyba()

def selectProd(cursor):
    try:
        print("(id_prod, name, producer_brand, expiration_date, price, storage_count, sn)")
        cursor.execute('SELECT * FROM products')
        for i in cursor:
            print(i)
    except:
        chyba()

def selectRev(cursor):
    try:
        print("(id_rev, reviewer_name, content, rating_stars, published_date, id_prod)")
        cursor.execute('SELECT * FROM reviews')
        for i in cursor:
            print(i)
    except:
        chyba()

def selectAdd(cursor):
    try:
        print("(cus_id, street, city, country)")
        cursor.execute('SELECT * FROM addresses')
        for i in cursor:
            print(i)
    except:
        chyba()

