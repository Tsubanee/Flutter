import 'package:first_app/widgets/products/address_tag.dart';
import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../ui_elements/title_default.dart';
import './price_tag.dart';
import '../../models/product.dart';
import '../../scoped-models/main.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  Widget _buildTitlePriceRow() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleDefault(product.title),
          SizedBox(width: 50.0),
          PriceTag(product.price.toString()),
        ],
      ),
      margin: EdgeInsets.only(top: 10.0),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            iconSize: 50.0,
            color: Theme.of(context).primaryColor,
            onPressed: () => Navigator.pushNamed<bool>(
              context,
              '/product/' + model.allProducts[productIndex].id,
            ),
          ),
          IconButton(
            icon: Icon(model.allProducts[productIndex].isFavorite
                ? Icons.favorite
                : Icons.favorite_border),
            iconSize: 50.0,
            color: Colors.red,
            onPressed: () {
              model.selectProduct(model.allProducts[productIndex].id);
              model.toggleProductFavoriteStatus();
            },
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(product.image),
            placeholder: AssetImage('assets/background1.jpg'),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          _buildTitlePriceRow(),
          AddressTag('The Lair of Bluescaled Dragons'),
          Text(product.userEmail),
          _buildActionButtons(context),
        ],
      ),
    );
    ;
  }
}
