import 'package:flutter/material.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/theme.dart';

class CheckoutCard extends StatelessWidget {
  final CartModel cart;

  const CheckoutCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Row(children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage(
                cart.product.galleries[0].url,
              ),
            ),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.product.name,
                style: primaryTextStyle.copyWith(fontWeight: semiBold),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 2),
              Text(
                '\$${cart.getTotalPrice()}',
                style: priceTextStyle,
              ),
            ],
          ),
        ),
        Text(
          '${cart.quantity.toString()} items',
          style: secondaryTextStyle.copyWith(
            fontSize: 12,
          ),
        ),
      ]),
    );
  }
}
