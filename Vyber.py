import time

from Ukol13.MetodyOrders import insertOrd, selectOrd, deleteOrd, updateOrd, selectCus, selectProd, \
    selectAdd, selectRev, objednani, selectRest, bills, average, chyba
from Ukol13.Orders import Orders



def vyberMetody(vstup, cursor):
    try:
        if vstup == "average":
            average(cursor)
            time.sleep(2)

        if vstup == "order":
            id_zakaznika = "None"
            id_produktu = "None"
            while id_zakaznika != "1" and id_zakaznika != "2" and id_zakaznika != "3" and id_zakaznika != "4" and id_zakaznika != "5":
                id_zakaznika = str(input("Zadej id zakaznika (1-5): "))
            while id_produktu != "1" and id_produktu != "2" and id_produktu != "3" and id_produktu != "4" and id_produktu != "5" and id_produktu != "6":
                id_produktu = input("Zadej id produktu, který chceš objednat(1-6): ")
            pocetproduktu = input("Zadej kolik produktů chceš objednat: ")

            objednani(id_zakaznika, id_produktu, pocetproduktu, cursor)
            selectOrd(cursor)
            selectRest(cursor)

        if vstup == "bills":
            bills(cursor)
            time.sleep(2)

        if vstup == "insert":
            id_ord = input("Zadej id objednávky: ")
            ord_date = input("Zadej datum objednání ve formátu(yyyy-mm-dd): ")
            done = "default"
            while done != "1" and done != "0":
                done = input("Zadej jestli je objednávka vyhotovená/nehotová(1/0): ")
                if done == "1":
                    done_date = input("Zadej datum vyhotovení objednávky ve formátu(yyyy-mm-dd): ")
                elif done == "0":
                    done_date = "None"
                id_cus = "default"
                id_prod = "default"
                while id_cus != "1" and id_cus != "2" and id_cus != "3" and id_cus != "4" and id_cus != "5":
                    id_cus = input("Zadej id zakaznika(1-5): ")
                while id_prod != "1" and id_prod != "2" and id_prod != "3" and id_prod != "4" and id_prod != "5" and id_prod != "6":
                    id_prod = input("Zadej id produktu(1-6): ")
                number_of_prod = input("Zadej počet daných produktů, které chceš objednat")
                o1 = Orders(id_ord, ord_date, done, done_date, id_cus, id_prod, number_of_prod)
                insertOrd(o1.id_ord, o1.ord_date, o1.done, o1.done_date, o1.id_cus, o1.id_prod, o1.number_of_prod, cursor)
                selectOrd(cursor)

        elif vstup == "update":
            id_ord = "Default"
            while id_ord != "1" and id_ord != "2" and id_ord != "3" and id_ord != "4" and id_ord != "5":
                id_ord = input("Zadej id objednavky, kterou chceš upravit(1-5): ")
            atributA = "Default"
            while atributA != "id_ord" and atributA != "ord_date" and atributA != "done"and atributA != "done_date"and atributA != "id_cus" and atributA !="id_prod"and atributA != "number_of_prod":
                atributA = input(
                    "Zadej název atributu, který chceš upravit\n(id_ord, ord_date, done, done_date, id_cus, id_prod, number_of_prod): ")
            hodnotaA = input("Zadej NOVOU hodnotu, kterou chceš dosadit: ")
            updateOrd(atributA, hodnotaA, id_ord, cursor)
            selectOrd(cursor)

        elif vstup == "delete":
            id_ord = input("Zadej id objednavky, kterou chceš smazat: ")
            deleteOrd(id_ord, cursor)
            selectOrd(cursor)

        elif vstup == "select":
            tabulka = "None"
            while tabulka != "customers" and tabulka != "orders" and tabulka != "products" and tabulka != "addresses" and tabulka != "reviews":
                tabulka = input(
                    "Vyber z jaké tabulky chceš udělat výpis\n customers \n orders \n products \n addresses \n "
                    "reviews: ")
                if tabulka == "customers":
                    selectCus(cursor)
                    time.sleep(2)
                    break
                elif tabulka == "orders":
                    selectOrd(cursor)
                    time.sleep(2)
                    break
                elif tabulka == "products":
                    selectProd(cursor)
                    time.sleep(2)
                    break
                elif tabulka == "addresses":
                    selectAdd(cursor)
                    time.sleep(2)
                    break
                elif tabulka == "reviews":
                    selectRev(cursor)
                    time.sleep(2)
                    break

        elif vstup == "end":
            print("Program se ukončil!")
            exit()
    except:
        chyba()
