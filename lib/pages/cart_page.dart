import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/product_provider.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (BuildContext context, int index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(backgroundImage: AssetImage(cartItem['imageUrl'] as String ), backgroundColor: const Color.fromARGB(255, 255, 255, 255), radius: 40,),
            title: Text(cartItem['title'].toString(), style: Theme.of(context).textTheme.bodySmall,),
            subtitle: Text('Size : ${cartItem['size']}'),
            trailing: IconButton(
              onPressed: (){
                showDialog(context: context,
                 builder: (context) {
                  return  AlertDialog(
                    title: Text('Delete Product',
                    style: Theme.of(context).textTheme.titleMedium),
                    content: const Text('Are you sure you want to remove product from cart ?'),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: const Text('No', style: TextStyle(color: Colors.red,fontSize: 16),)
                      ),
                      TextButton(onPressed: (){
                        context.read<CartProvider>().removeProduct(cartItem);
                        Navigator.of(context).pop();
                      }, child:  Text('Yes',style: Theme.of(context).textTheme.bodySmall,)),
                      
                      ]
                    
                    
                  );
                 },
                 );
              },
              icon: const Icon(Icons.delete_outline, color: Colors.red,),

            ),
          );
        },
      ),
      );
    
  }
}