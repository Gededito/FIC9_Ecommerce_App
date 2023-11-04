import 'package:fic9_ecommerce_app/common/extensions/string_ext.dart';
import 'package:fic9_ecommerce_app/data/model/response/products_response_model.dart';

class CartModel {
  final Product product;
  int quantity;

  CartModel({
    required this.product,
    this.quantity = 0,
  });

  String get priceFormat => product.attributes.price.currencyFormatRp;
}
