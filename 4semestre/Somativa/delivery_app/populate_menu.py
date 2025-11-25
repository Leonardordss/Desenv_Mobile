import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'backend.settings')
django.setup()

from api.models import MenuItem

def populate_menu():
    MenuItem.objects.all().delete() # Limpa os dados existentes

    menu_items = [
        # Lanches
        {'name': 'X-Salada', 'description': 'Pão, hambúrguer, queijo, alface e tomate.', 'price': 15.00, 'category': 'LANCHE'},
        {'name': 'X-Bacon', 'description': 'Pão, hambúrguer, queijo, bacon.', 'price': 18.00, 'category': 'LANCHE'},
        {'name': 'Hot Dog', 'description': 'Pão, salsicha, purê de batata, milho e batata palha.', 'price': 12.00, 'category': 'LANCHE'},
        
        # Pizzas
        {'name': 'Pizza Calabresa', 'description': 'Molho de tomate, mussarela, calabresa e cebola.', 'price': 45.00, 'category': 'PIZZA'},
        {'name': 'Pizza Mussarela', 'description': 'Molho de tomate, mussarela e orégano.', 'price': 40.00, 'category': 'PIZZA'},
        {'name': 'Pizza Frango c/ Catupiry', 'description': 'Molho de tomate, mussarela, frango desfiado e catupiry.', 'price': 50.00, 'category': 'PIZZA'},
    ]

    for item in menu_items:
        MenuItem.objects.create(**item)
        
    print(f"Banco de dados populado com {MenuItem.objects.count()} itens de menu.")

if __name__ == '__main__':
    populate_menu()
