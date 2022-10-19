import 'package:flutter/material.dart';
import 'package:grocery_store_app/grocery_product.dart';

class GroceryStoreDetails extends StatelessWidget {
  const GroceryStoreDetails({super.key, required this.product});

  final GroceryProduct product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Hero(
                      tag: 'list_${product.name}',
                      child: Image.asset(
                        product.image,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.36,
                      ),
                    ),
                  ),
                  Text(product.name,
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: IconButton(
                    onPressed: () => null,
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF4c459),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    onPressed: () {},
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
