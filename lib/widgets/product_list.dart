import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/product_card.dart';
import 'package:shopping_app/pages/product_details.dart';
import '../global_variables.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = [
      'All','Nike','Addidas','Bata'
    ];
    late String selectfilter;
    List<Map<String, dynamic>> filteredProducts = [];

    int currentpage=0;
    @override
  void initState() {
    super.initState();
    selectfilter=filters[0];
    filteredProducts = products;
  }
  void filterProducts() {
    setState(() {
      if (selectfilter == 'All') {
        filteredProducts = List.from(products);
      } else {
        filteredProducts = products.where((product) {
          return product['company'] == selectfilter; 
        }).toList();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    const border =  OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(81, 152, 114, 1)
                  ),
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(50)));
    return SafeArea(
        child: Column(
          children: <Widget>[
             Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Shoes\nCollection", 
                              style: Theme.of(context).textTheme.titleLarge
                              ),
                ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "search",
                prefixIcon: Icon(Icons.search),iconColor: Colors.white,
                border: border,
                enabledBorder: border,
                focusedBorder: border,
                )
              ),
            ),
            
              ],
            ),
            Container(
          // Add a Container around the Row and SizedBox for shadow
          decoration: BoxDecoration(
            boxShadow: [
              // BoxShadow(
              //   color: Color.fromRGBO(50, 50, 93, 0.25), // First shadow (semi-transparent blue)
              //   offset: Offset(0, 6), // Horizontal, vertical shadow offset
              //   blurRadius: 12, // Blur radius for the shadow effect
              //   spreadRadius: -2, // How much the shadow should spread
              // ),
              // BoxShadow(
              //   color: Color.fromRGBO(0, 0, 0, 0.3), // Second shadow (darker)
              //   offset: Offset(0, 3), // Horizontal, vertical shadow offset
              //   blurRadius: 7, // Blur radius for the shadow effect
              //   spreadRadius: -3, // How much the shadow should spread
              // ),
            ],
          ),
          child:SizedBox(
              height: 80,
              child: ListView.builder(
                itemCount: filters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectfilter=filter;
                          
                        });
                        filterProducts();
                      },
                      
                      child: Chip(
                        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                        backgroundColor: selectfilter == filter ? Color.fromRGBO(81, 152, 114, 1) : Color.fromRGBO(255, 255, 255, 1),
                        
                        label: Text(filter,style: Theme.of(context).textTheme.bodySmall),
                        labelStyle: const TextStyle(
                          fontSize: 16,
                        ),
                        shadowColor: Colors.black.withOpacity(0.2),
                        elevation: 5,
                        ),
                    ),
                  );
                }),
                
            ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (constraints.maxWidth>1080){
                    return GridView.builder(
                  
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.7,
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    final pproduct = filteredProducts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)
                    {
                      return ProductDetails(product: pproduct);
                    }));
                  },
                  child: ProductCard(
                    title: pproduct['title'] as String,
                    price: pproduct['price'] as double,
                    image: pproduct['imageUrl'] as String,
                    ),
                );
                  },
                );
                  }
                  else{
                    return ListView.builder(
                          itemCount: filteredProducts.length,
                          itemBuilder: (BuildContext context, int index) {
                final pproduct = filteredProducts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)
                    {
                      return ProductDetails(product: pproduct);
                    }));
                  },
                  child: ProductCard(
                    title: pproduct['title'] as String,
                    price: pproduct['price'] as double,
                    image: pproduct['imageUrl'] as String,
                    ),
                );
                          },
                        );
                  }
                },
              ),
            ),
          ],
        
        ),
        
      );
  }
}