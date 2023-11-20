import 'package:fic9_ecommerce_app/common/components/button.dart';
import 'package:fic9_ecommerce_app/common/components/row_text.dart';
import 'package:fic9_ecommerce_app/common/components/space.dart';
import 'package:fic9_ecommerce_app/common/constants/colors.dart';
import 'package:fic9_ecommerce_app/common/extensions/int_ext.dart';
import 'package:fic9_ecommerce_app/data/model/response/buyer_order_response.dart';
import 'package:fic9_ecommerce_app/presentation/order/order_detail_page.dart';
import 'package:fic9_ecommerce_app/presentation/order/manifest_delivery_page.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final BuyerOrder data;
  const OrderCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OrderDetailPage(buyerOrder: data)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          border: Border.all(color: ColorName.border),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'NO RESI: ${data.attributes.noResi}',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                Button.filled(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ManifestDeliveryPage(buyerOrder: data)),
                    );
                  },
                  label: 'Lacak',
                  height: 20.0,
                  width: 94.0,
                  fontSize: 11.0,
                ),
              ],
            ),
            const SpaceHeight(24.0),
            RowText(label: 'Status', value: data.attributes.status),
            // const SpaceHeight(12.0),
            // RowText(label: 'Item', value: data.attributes.),
            const SpaceHeight(12.0),
            RowText(
                label: 'Harga',
                value: data.attributes.totalPrice.currencyFormatRp),
          ],
        ),
      ),
    );
  }
}
