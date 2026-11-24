import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

class CartBottomBar extends StatelessWidget {
  final int itemCount;
  final double totalPrice;
  final String currency;
  final VoidCallback onViewCart;

  const CartBottomBar({
    super.key,
    required this.itemCount,
    required this.totalPrice,
    this.currency = '₹',
    required this.onViewCart,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.horizontalPadding,
        vertical: responsive.isLargeTablet ? 16 : 12,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            // Item count and total
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$itemCount items in cart',
                    style: TextStyle(
                      fontSize: responsive.smallFontSize,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: responsive.isLargeTablet ? 4 : 2),
                  Text(
                    '$currency${totalPrice.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: responsive.subtitleFontSize,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),

            // View Cart Button
            GestureDetector(
              onTap: onViewCart,
              child: Container(
                height: responsive.buttonHeight,
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.isLargeTablet ? 32 : 24,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(responsive.buttonHeight / 2),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'View Cart',
                      style: TextStyle(
                        fontSize: responsive.bodyFontSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: responsive.isLargeTablet ? 10 : 8),
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                      size: responsive.iconSize,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}