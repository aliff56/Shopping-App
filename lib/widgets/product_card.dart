import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  const ProductCard({
  super.key,
  required this.title,
  required this.price,
  required this.image,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20.0),
        decoration:
         BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(height: 5),
          Text('\$$price', style: Theme.of(context).textTheme.bodySmall,),
          const SizedBox(height: 5),
          Center(
            child: Image(
              height: 175,
              image: AssetImage(image)),
          )
        ],
      ),
    );
  }
}