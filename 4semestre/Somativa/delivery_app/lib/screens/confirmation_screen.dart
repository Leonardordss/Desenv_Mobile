import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Confirmação de Pedido')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Seu Pedido Foi Confirmado!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 20),
            const Text(
              'Detalhes do Pedido:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: cartProvider.items.length,
                itemBuilder: (context, index) {
                  final item = cartProvider.items[index];
                  return ListTile(
                    title: Text('${item.item.name} x ${item.quantity}'),
                    trailing: Text('R\$ ${item.totalPrice.toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
            const Divider(),
            Text('Subtotal: R\$ ${cartProvider.subtotal.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
            Text('Taxa de Entrega: R\$ ${cartProvider.deliveryFee.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
            Text(
              'Total da Compra: R\$ ${cartProvider.total.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Endereço de Entrega:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              cartProvider.deliveryAddress ?? 'Endereço não especificado.',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  cartProvider.clearCart();
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text('Voltar ao Cardápio'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
