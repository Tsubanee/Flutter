import 'package:flutter/material.dart';

import 'pages/product.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products(this.products) {
    print('Products widget constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/Pixel_Night_Town.gif',
          ),
          Text(products[index]),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('OmegaDragDetails'),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProductPage(),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    print('Products build method');
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      productCard = Center(child: Text('No Dragons in this lair'));
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
