import json
try:
    def config_connection(nick, passwd):
        # načítání souboru config
        with open('configConnection.json') as json_file:
            data = json.load(json_file)
        # pokud des odpovídá zadanému v config souboru, tak metoda vypíše celý config dictionary soubor.
        # neboli ověření username a hesla
        try:
            if nick == data['nickname'] and passwd == data['password']:
                print("správně zadané údaje pro připojení do databáze!")
            else:
                raise Exception
        except:
            print("Pri overovani byli spatne zadane udaje - Program se ukončil")
            exit()
except:
    print("Pri spusteni metody, ktera deserializuje configuracni soubor")



