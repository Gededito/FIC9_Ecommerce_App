import 'package:fic9_ecommerce_app/common/components/button.dart';
import 'package:fic9_ecommerce_app/common/components/space.dart';
import 'package:fic9_ecommerce_app/common/constants/colors.dart';
import 'package:fic9_ecommerce_app/common/constants/images.dart' as localImages;
import 'package:fic9_ecommerce_app/common/constants/variabels.dart';
import 'package:fic9_ecommerce_app/data/model/response/products_response_model.dart';
import 'package:fic9_ecommerce_app/presentation/beranda/widgets/image_slider.dart';
import 'package:fic9_ecommerce_app/presentation/cart/bloc/cart/cart_bloc.dart';
import 'package:fic9_ecommerce_app/presentation/cart/cart_page.dart';
import 'package:fic9_ecommerce_app/presentation/cart/widgets/cart_model.dart';
import 'package:fic9_ecommerce_app/presentation/product_detail/widgets/product_description_widget.dart';
import 'package:fic9_ecommerce_app/presentation/product_detail/widgets/product_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  EdgeInsets paddingHorizontal = const EdgeInsets.symmetric(horizontal: 20.0);

  final List<String> images = [
    localImages.Images.product3,
    localImages.Images.product3,
    localImages.Images.product3,
    localImages.Images.product3,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
      ),
      body: ListView(
        children: [
          ImageSlider(items: [
            '${Variables.baseUrl}${widget.product.attributes.images.data.first.attributes.url}',
          ], isAsset: false),
          const SpaceHeight(16.0),
          ProductInfoWidget(
            padding: paddingHorizontal,
            product: widget.product,
            onWishlistTap: (isWishlist) {
              // TODO: on wishlist tap
            },
          ),
          const SpaceHeight(11.0),
          ProductDescriptionWidget(
              padding: paddingHorizontal,
              description: widget.product.attributes.description),
          const SpaceHeight(11.0),
          Padding(
            padding: paddingHorizontal,
            child: Divider(
              color: ColorName.grey.withOpacity(0.18),
            ),
          ),
          const SpaceHeight(11.0),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.withOpacity(0.18)),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Button.filled(
                onPressed: () {
                  context.read<CartBloc>().add(CartEvent.add(
                      CartModel(product: widget.product, quantity: 1)));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartPage()));
                },
                label: "Add to Cart",
              ),
            ),
            const SpaceWith(15.0),
            Flexible(
              child: Button.outlined(
                onPressed: () {},
                label: "Buy Now",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
