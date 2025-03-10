import 'package:flutter/material.dart';
import 'package:shopping_app/global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Your Cart')),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            leading: Image(
              image: AssetImage(cartItem['imageUrl'] as String),
              width: 80,
            ),
            trailing: const Icon(
              Icons.delete_rounded,
              color: Colors.red,
            ),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              "Color : ${cartItem['color']}",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
