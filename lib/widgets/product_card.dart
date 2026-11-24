// import 'package:flutter/material.dart';
// import '../models/product_model.dart';
// import '../theme/app_theme.dart';
// import '../utils/responsive.dart';

// class ProductCard extends StatelessWidget {
//   final Product product;
//   final VoidCallback onTap;
//   final VoidCallback onAddTap;

//   const ProductCard({
//     super.key,
//     required this.product,
//     required this.onTap,
//     required this.onAddTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final responsive = Responsive(context);
//     final bool isOutOfStock = product.stockStatus == StockStatus.outOfStock;

//     return GestureDetector(
//       onTap: isOutOfStock ? null : onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: AppColors.cardBackground,
//           borderRadius: BorderRadius.circular(responsive.cardBorderRadius),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.04),
//               blurRadius: 10,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Image section
//             Expanded(
//               flex: 6,
//               child: Stack(
//                 children: [
//                   // Product Image
//                   ClipRRect(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(responsive.cardBorderRadius),
//                       topRight: Radius.circular(responsive.cardBorderRadius),
//                     ),
//                     child: Container(
//                       width: double.infinity,
//                       color: AppColors.surface,
//                       child: _buildProductImage(isOutOfStock),
//                     ),
//                   ),

//                   // Stock Badge
//                   Positioned(
//                     top: responsive.isLargeTablet ? 12 : 8,
//                     left: responsive.isLargeTablet ? 12 : 8,
//                     child: _buildStockBadge(responsive),
//                   ),

//                   // Out of stock overlay
//                   if (isOutOfStock)
//                     ClipRRect(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(responsive.cardBorderRadius),
//                         topRight: Radius.circular(responsive.cardBorderRadius),
//                       ),
//                       child: Container(
//                         width: double.infinity,
//                         height: double.infinity,
//                         color: Colors.white.withOpacity(0.5),
//                       ),
//                     ),
//                 ],
//               ),
//             ),

//             // Info section
//             Expanded(
//               flex: 4,
//               child: Padding(
//                 padding: responsive.cardPadding,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Flexible(
//                       child: Text(
//                         product.name,
//                         style: TextStyle(
//                           fontSize: responsive.bodyFontSize,
//                           fontWeight: FontWeight.w600,
//                           color: AppColors.textPrimary,
//                           height: 1.2,
//                         ),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     SizedBox(height: responsive.isLargeTablet ? 8 : 4),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           product.priceDisplay,
//                           style: TextStyle(
//                             fontSize: responsive.priceFontSize,
//                             fontWeight: FontWeight.w700,
//                             color: AppColors.textPrimary,
//                           ),
//                         ),
//                         if (!isOutOfStock)
//                           _buildAddButton(responsive),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildProductImage(bool isOutOfStock) {
//     return Image.asset(
//       product.imageUrl,
//       fit: BoxFit.cover,
//       width: double.infinity,
//       height: double.infinity,
//       errorBuilder: (context, error, stackTrace) {
//         return Container(
//           color: AppColors.surface,
//           child: Center(
//             child: Icon(
//               Icons.fastfood_rounded,
//               size: 48,
//               color: AppColors.textMuted.withOpacity(0.4),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildStockBadge(Responsive responsive) {
//     Color bgColor;
//     Color textColor;

//     switch (product.stockStatus) {
//       case StockStatus.inStock:
//         bgColor = AppColors.stockGreen;
//         textColor = AppColors.stockGreenText;
//         break;
//       case StockStatus.limited:
//         bgColor = AppColors.stockOrange;
//         textColor = AppColors.stockOrangeText;
//         break;
//       case StockStatus.outOfStock:
//         bgColor = AppColors.outOfStock;
//         textColor = AppColors.outOfStockText;
//         break;
//     }

//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: responsive.isLargeTablet ? 12 : 8,
//         vertical: responsive.isLargeTablet ? 6 : 4,
//       ),
//       decoration: BoxDecoration(
//         color: bgColor,
//         borderRadius: BorderRadius.circular(6),
//       ),
//       child: Text(
//         product.stockLabel,
//         style: TextStyle(
//           fontSize: responsive.stockBadgeFontSize,
//           fontWeight: FontWeight.w600,
//           color: textColor,
//         ),
//       ),
//     );
//   }

//   Widget _buildAddButton(Responsive responsive) {
//     return GestureDetector(
//       onTap: onAddTap,
//       child: Container(
//         width: responsive.addButtonSize,
//         height: responsive.addButtonSize,
//         decoration: BoxDecoration(
//           color: AppColors.primary,
//           borderRadius: BorderRadius.circular(responsive.addButtonSize / 2),
//         ),
//         child: Icon(
//           Icons.add,
//           color: Colors.white,
//           size: responsive.iconSize,
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final VoidCallback onAddTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final bool isOutOfStock = product.stockStatus == StockStatus.outOfStock;

    return GestureDetector(
      onTap: isOutOfStock ? null : onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(responsive.cardBorderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4), // Slightly deeper shadow for kiosk
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section - Increased flex ratio to give image more height
            Expanded(
              flex: 55, 
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(responsive.cardBorderRadius),
                      topRight: Radius.circular(responsive.cardBorderRadius),
                    ),
                    child: _buildProductImage(isOutOfStock),
                  ),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: _buildStockBadge(responsive),
                  ),
                  if (isOutOfStock)
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(responsive.cardBorderRadius),
                          topRight: Radius.circular(responsive.cardBorderRadius),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // Info section
            Expanded(
              flex: 45,
              child: Padding(
                padding: EdgeInsets.all(responsive.isTablet ? 16.0 : 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        fontSize: responsive.bodyFontSize,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          product.priceDisplay,
                          style: TextStyle(
                            fontSize: responsive.priceFontSize,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        if (!isOutOfStock) _buildAddButton(responsive),
                      ],
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

  Widget _buildProductImage(bool isOutOfStock) {
    return Container(
      color: AppColors.surface,
      child: Image.asset(
        product.imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Center(
          child: Icon(
            Icons.fastfood_rounded,
            size: 48,
            color: AppColors.textMuted.withOpacity(0.4),
          ),
        ),
      ),
    );
  }

  Widget _buildStockBadge(Responsive responsive) {
    Color bgColor;
    Color textColor;

    switch (product.stockStatus) {
      case StockStatus.inStock:
        bgColor = AppColors.stockGreen;
        textColor = AppColors.stockGreenText;
        break;
      case StockStatus.limited:
        bgColor = AppColors.stockOrange;
        textColor = AppColors.stockOrangeText;
        break;
      case StockStatus.outOfStock:
        bgColor = AppColors.outOfStock;
        textColor = AppColors.outOfStockText;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.isTablet ? 12 : 8,
        vertical: responsive.isTablet ? 6 : 4,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        product.stockLabel,
        style: TextStyle(
          fontSize: responsive.stockBadgeFontSize,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildAddButton(Responsive responsive) {
    return GestureDetector(
      onTap: onAddTap,
      child: Container(
        width: responsive.addButtonSize,
        height: responsive.addButtonSize,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(responsive.addButtonSize / 4), // Slight rounded rect instead of pure circle based on design
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: responsive.iconSize,
        ),
      ),
    );
  }
}