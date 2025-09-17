import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final String priceLabel;
  final double price;
  final String? size;
  int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.priceLabel,
    required this.price,
    this.size,
    this.quantity = 1,
  });
}

class CartState extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get totalItems => _items.fold(0, (sum, i) => sum + i.quantity);

  double get totalAmount => _items.fold(0.0, (sum, i) => sum + (i.price * i.quantity));

  void addItem({
    required String id,
    required String title,
    required String priceLabel,
    required double price,
    String? size,
    int quantity = 1,
  }) {
    final existingIndex = _items.indexWhere((i) => i.id == id && i.size == size);
    if (existingIndex >= 0) {
      _items[existingIndex].quantity += quantity;
    } else {
      _items.add(CartItem(
        id: id,
        title: title,
        priceLabel: priceLabel,
        price: price,
        size: size,
        quantity: quantity,
      ));
    }
    notifyListeners();
  }

  void updateQuantity({required String id, String? size, required int delta}) {
    final index = _items.indexWhere((i) => i.id == id && i.size == size);
    if (index >= 0) {
      _items[index].quantity = (_items[index].quantity + delta).clamp(1, 999);
      notifyListeners();
    }
  }

  void removeItem({required String id, String? size}) {
    _items.removeWhere((i) => i.id == id && i.size == size);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}

class CartScope extends InheritedNotifier<CartState> {
  const CartScope({super.key, required CartState notifier, required Widget child})
      : super(notifier: notifier, child: child);

  static CartState of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<CartScope>();
    assert(scope != null, 'CartScope not found in context');
    return scope!.notifier!;
  }
}
