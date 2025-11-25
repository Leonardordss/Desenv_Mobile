import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../services/api_service.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _cepController = TextEditingController();
  final ApiService _apiService = ApiService();
  String? _addressResult;
  double _calculatedFee = 0.0;
  bool _isCalculating = false;

  Future<void> _calculateDeliveryFee(CartProvider cartProvider) async {
    if (_cepController.text.isEmpty || _cepController.text.length != 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, insira um CEP válido com 8 dígitos.')),
      );
      return;
    }

    setState(() {
      _isCalculating = true;
      _addressResult = null;
      _calculatedFee = 0.0;
    });

    try {
      final addressData = await _apiService.fetchAddressByCep(_cepController.text);
      final address = '${addressData['logradouro']}, ${addressData['bairro']} - ${addressData['localidade']}/${addressData['uf']}';
      
      // Lógica de cálculo de taxa de entrega (simulada)
      // Acima de R$ 100,00 não tem taxa de entrega.
      double fee = 10.00; // Taxa padrão
      if (cartProvider.subtotal >= 100.00) {
        fee = 0.0;
      }

      setState(() {
        _addressResult = address;
        _calculatedFee = fee;
      });
      
      cartProvider.setDeliveryInfo(address, fee);

    } catch (e) {
      setState(() {
        _addressResult = 'Erro ao buscar CEP: ${e.toString()}';
        _calculatedFee = 0.0;
      });
      cartProvider.setDeliveryInfo('', 0.0);
    } finally {
      setState(() {
        _isCalculating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Carrinho de Compras')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.items.length,
              itemBuilder: (context, index) {
                final cartItem = cartProvider.items[index];
                return ListTile(
                  title: Text(cartItem.item.name),
                  subtitle: Text('R\$ ${cartItem.item.price.toStringAsFixed(2)} x ${cartItem.quantity}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          cartProvider.updateItemQuantity(cartItem.item, cartItem.quantity - 1);
                        },
                      ),
                      Text('${cartItem.quantity}'),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          cartProvider.updateItemQuantity(cartItem.item, cartItem.quantity + 1);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          cartProvider.removeItem(cartItem.item);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Calcular Taxa de Entrega', style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _cepController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'CEP (somente números)',
                          hintText: 'Ex: 88000000',
                        ),
                      ),
                    ),
                    _isCalculating
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          )
                        : ElevatedButton(
                            onPressed: cartProvider.items.isEmpty ? null : () => _calculateDeliveryFee(cartProvider),
                            child: const Text('Calcular'),
                          ),
                  ],
                ),
                if (_addressResult != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text('Endereço: $_addressResult', style: const TextStyle(color: Colors.green)),
                  ),
                const Divider(),
                Text('Subtotal: R\$ ${cartProvider.subtotal.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
                Text('Taxa de Entrega: R\$ ${_calculatedFee.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
                Text('Total: R\$ ${cartProvider.total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: cartProvider.items.isEmpty || cartProvider.deliveryAddress == null
                      ? null
                      : () {
                          Navigator.pushNamed(context, '/confirm');
                        },
                  style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                  child: const Text('Confirmar Pedido'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
