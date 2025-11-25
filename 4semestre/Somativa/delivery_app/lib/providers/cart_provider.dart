import 'package:flutter/material.dart';
import '../models/menu_item.dart';

class CartItem {
  final MenuItem item;
  int quantity;

  CartItem({required this.item, this.quantity = 1});

  double get totalPrice => item.price * quantity;
}

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];
  String? _deliveryAddress;
  double _deliveryFee = 0.0;

  List<CartItem> get items => _items;
  String? get deliveryAddress => _deliveryAddress;
  double get deliveryFee => _deliveryFee;

  double get subtotal {
    return _items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  double get total {
    double totalValue = subtotal + _deliveryFee;
    // Acima de R$ 100,00 não tem taxa de entrega.
    if (subtotal >= 100.00) {
      return subtotal;
    }
    return totalValue;
  }

  void addItem(MenuItem item) {
    final existingItem = _items.firstWhere(
      (cartItem) => cartItem.item.id == item.id,
      orElse: () => CartItem(item: item, quantity: 0),
    );

    if (existingItem.quantity > 0) {
      existingItem.quantity++;
    } else {
      _items.add(CartItem(item: item));
    }
    notifyListeners();
  }

  void removeItem(MenuItem item) {
    _items.removeWhere((cartItem) => cartItem.item.id == item.id);
    notifyListeners();
  }

  void updateItemQuantity(MenuItem item, int quantity) {
    final existingItem = _items.firstWhere(
      (cartItem) => cartItem.item.id == item.id,
      orElse: () => CartItem(item: item, quantity: 0),
    );

    if (existingItem.quantity > 0) {
      existingItem.quantity = quantity;
      if (existingItem.quantity <= 0) {
        removeItem(item);
      }
      notifyListeners();
    }
  }

  void setDeliveryInfo(String address, double fee) {
    _deliveryAddress = address;
    _deliveryFee = fee;
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    _deliveryAddress = null;
    _deliveryFee = 0.0;
    notifyListeners();
  }
}
