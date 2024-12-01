import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/product_provider.dart';


class ProductDetails extends StatefulWidget {
  final Map<String,dynamic> product;
 
  const ProductDetails({
    super.key,
    required this.product,
 
    });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectedsize=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(widget.product['title'] as String,
             style: Theme.of(context).textTheme.titleLarge,
             ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(widget.product['imageUrl'] as String, height: 250),
          ),
          const Spacer(flex: 2,),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(164, 180, 148, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                Text('\$${widget.product['price']}', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35, ),),
                const SizedBox(height: 10,),
               SizedBox(
                height: 50,
                 child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                   itemCount: (widget.product['sizes'] as List<int>).length,
                   itemBuilder: (BuildContext context, int index) {
                     final size = (widget.product['sizes'] as List<int>)[index];
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: 
                       GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedsize = size;
                          });
                        },
                         child: Chip(
                          label: Text(size.toString(),),
                          backgroundColor: selectedsize == size ? const Color.fromRGBO(59, 82, 73, 1) :  const Color.fromRGBO(160, 175, 132, 1) ,
                          ),
                       ),
                     );
                   },
                 ),
               ),
               
               Padding(
                 padding: const EdgeInsets.all(30.0),
                 
                 child: ElevatedButton(
                  
                  onPressed: (){
                    if(selectedsize != 0)
                    {
                      Provider.of<CartProvider>(context, listen: false).addProduct(
                        {
                    'id': widget.product['id'],
                    'title': widget.product['title'],
                    'price': widget.product['price'],
                    'imageUrl': widget.product['imageUrl'],
                    'company': widget.product['company'],
                    'size': selectedsize,
                      },
                      );
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added to Cart!'),backgroundColor: Color.fromRGBO(113, 131, 85, 1),));
                    }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please Select a Size'),backgroundColor: Color.fromRGBO(113, 131, 85, 1)));
                    }
                    
                  },
                  
                  style: ElevatedButton.styleFrom(
                    
                    backgroundColor: const Color.fromRGBO(113, 131, 85, 1),
                    foregroundColor: Colors.white,
                    fixedSize: const Size(350, 50),
                    
                  ),
                  
                  child: Text('Add To Cart',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Poppins',
            ),),
                
                
                  ),
               ),
              ],
            ),
          )
        ],
      
      ),
    );
  }
}