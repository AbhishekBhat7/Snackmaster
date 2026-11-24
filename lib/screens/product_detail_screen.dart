// import 'package:flutter/material.dart';
// import '../models/product_model.dart';
// import '../theme/app_theme.dart';
// import '../utils/responsive.dart';
// import '../widgets/quantity_selector.dart';
// import '../widgets/info_chip.dart';

// class ProductDetailScreen extends StatefulWidget {
//   final Product product;
//   final Function(Product product, int quantity) onAddToCart;

//   const ProductDetailScreen({
//     super.key,
//     required this.product,
//     required this.onAddToCart,
//   });

//   @override
//   State<ProductDetailScreen> createState() => _ProductDetailScreenState();
// }

// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   int quantity = 1;

//   double get totalPrice => widget.product.price * quantity;

//   @override
//   Widget build(BuildContext context) {
//     final responsive = Responsive(context);
//     final product = widget.product;

//     if (responsive.isLandscape && (responsive.isTablet || responsive.isLargeTablet)) {
//       return _buildLandscapeLayout(context, responsive, product);
//     }

//     return _buildPortraitLayout(context, responsive, product);
//   }

//   Widget _buildPortraitLayout(
//       BuildContext context, Responsive responsive, Product product) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: Column(
//         children: [
//           // Scrollable Content
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Hero Image
//                   _buildHeroImage(responsive, product),
//                   SizedBox(height: responsive.isLargeTablet ? 24 : 16),

//                   // Product Info
//                   _buildProductInfo(responsive, product),
//                 ],
//               ),
//             ),
//           ),

//           // Bottom Action Bar
//           _buildBottomActionBar(responsive, product),
//         ],
//       ),
//     );
//   }

//   Widget _buildLandscapeLayout(
//       BuildContext context, Responsive responsive, Product product) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: SafeArea(
//         child: Row(
//           children: [
//             // Left: Image
//             Expanded(
//               flex: 5,
//               child: Stack(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: double.infinity,
//                     color: AppColors.surface,
//                     child: Image.asset(
//                       product.imageUrl,
//                       fit: BoxFit.cover,
//                       errorBuilder: (context, error, stackTrace) {
//                         return Center(
//                           child: Icon(
//                             Icons.fastfood_rounded,
//                             size: 80,
//                             color: AppColors.textMuted.withOpacity(0.3),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   Positioned(
//                     top: responsive.isLargeTablet ? 20 : 16,
//                     left: responsive.isLargeTablet ? 20 : 16,
//                     child: _buildBackButton(responsive),
//                   ),
//                 ],
//               ),
//             ),

//             // Right: Details
//             Expanded(
//               flex: 5,
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: SingleChildScrollView(
//                       padding: EdgeInsets.all(responsive.horizontalPadding),
//                       child: _buildProductInfoContent(responsive, product),
//                     ),
//                   ),
//                   _buildBottomActionBar(responsive, product),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeroImage(Responsive responsive, Product product) {
//     return Stack(
//       children: [
//         Container(
//           width: double.infinity,
//           height: responsive.detailImageHeight,
//           color: AppColors.surface,
//           child: Image.asset(
//             product.imageUrl,
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//             errorBuilder: (context, error, stackTrace) {
//               return Center(
//                 child: Icon(
//                   Icons.fastfood_rounded,
//                   size: responsive.isLargeTablet ? 80 : 60,
//                   color: AppColors.textMuted.withOpacity(0.3),
//                 ),
//               );
//             },
//           ),
//         ),
//         // Back Button
//         Positioned(
//           top: MediaQuery.of(context).padding.top +
//               (responsive.isLargeTablet ? 16 : 12),
//           left: responsive.horizontalPadding,
//           child: _buildBackButton(responsive),
//         ),
//       ],
//     );
//   }

//   Widget _buildBackButton(Responsive responsive) {
//     return GestureDetector(
//       onTap: () => Navigator.pop(context),
//       child: Container(
//         width: responsive.backButtonSize,
//         height: responsive.backButtonSize,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           shape: BoxShape.circle,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 10,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Icon(
//           Icons.arrow_back,
//           size: responsive.iconSize,
//           color: AppColors.textPrimary,
//         ),
//       ),
//     );
//   }

//   Widget _buildProductInfo(Responsive responsive, Product product) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: responsive.horizontalPadding),
//       child: _buildProductInfoContent(responsive, product),
//     );
//   }

//   Widget _buildProductInfoContent(Responsive responsive, Product product) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Title and Price Row
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Text(
//                 product.name,
//                 style: TextStyle(
//                   fontSize: responsive.detailTitleFontSize,
//                   fontWeight: FontWeight.w800,
//                   color: AppColors.textPrimary,
//                   letterSpacing: -0.5,
//                   height: 1.1,
//                 ),
//               ),
//             ),
//             SizedBox(width: responsive.isLargeTablet ? 24 : 16),
//             Text(
//               product.priceDisplay,
//               style: TextStyle(
//                 fontSize: responsive.largePriceFontSize,
//                 fontWeight: FontWeight.w700,
//                 color: AppColors.primaryLight,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: responsive.isLargeTablet ? 12 : 8),

//         // Description
//         if (product.description != null)
//           Text(
//             product.description!,
//             style: TextStyle(
//               fontSize: responsive.detailDescFontSize,
//               color: AppColors.textSecondary,
//               height: 1.5,
//             ),
//           ),
//         SizedBox(height: responsive.isLargeTablet ? 24 : 16),

//         // Tags Row
//         Wrap(
//           spacing: responsive.isLargeTablet ? 12 : 8,
//           runSpacing: responsive.isLargeTablet ? 10 : 6,
//           children: [
//             if (product.tags != null)
//               ...product.tags!.map(
//                 (tag) => InfoChip(
//                   label: tag,
//                   icon: tag == 'Vegetarian'
//                       ? Icons.eco
//                       : Icons.restaurant,
//                   iconColor: tag == 'Vegetarian'
//                       ? AppColors.greenDark
//                       : AppColors.primaryLight,
//                   backgroundColor: tag == 'Vegetarian'
//                       ? AppColors.greenLight
//                       : AppColors.orangeLight,
//                   borderColor: tag == 'Vegetarian'
//                       ? AppColors.greenDark.withOpacity(0.3)
//                       : AppColors.primaryLight.withOpacity(0.3),
//                 ),
//               ),
//             if (product.calories != null)
//               InfoChip(
//                 label: product.calories!,
//                 icon: Icons.local_fire_department_outlined,
//               ),
//             if (product.allergenInfo != null)
//               InfoChip(
//                 label: product.allergenInfo!,
//                 icon: Icons.info_outline,
//               ),
//           ],
//         ),
//         SizedBox(height: responsive.isLargeTablet ? 24 : 16),

//         // Pack Info Banner
//         if (product.packInfo != null)
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.symmetric(
//               horizontal: responsive.isLargeTablet ? 20 : 16,
//               vertical: responsive.isLargeTablet ? 14 : 10,
//             ),
//             decoration: BoxDecoration(
//               color: AppColors.infoBannerBg,
//               borderRadius:
//                   BorderRadius.circular(responsive.cardBorderRadius),
//             ),
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.access_time,
//                   size: responsive.iconSize,
//                   color: AppColors.infoBannerText,
//                 ),
//                 SizedBox(width: responsive.isLargeTablet ? 12 : 8),
//                 Expanded(
//                   child: Text(
//                     product.packInfo!,
//                     style: TextStyle(
//                       fontSize: responsive.infoBannerFontSize,
//                       fontWeight: FontWeight.w500,
//                       color: AppColors.infoBannerText,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         SizedBox(height: responsive.isLargeTablet ? 24 : 16),
//       ],
//     );
//   }

//   Widget _buildBottomActionBar(Responsive responsive, Product product) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: responsive.horizontalPadding,
//         vertical: responsive.isLargeTablet ? 20 : 16,
//       ),
//       decoration: BoxDecoration(
//         color: AppColors.cardBackground,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(24),
//           topRight: Radius.circular(24),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.06),
//             blurRadius: 20,
//             offset: const Offset(0, -4),
//           ),
//         ],
//       ),
//       child: SafeArea(
//         top: false,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Quantity Row
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Quantity',
//                   style: TextStyle(
//                     fontSize: responsive.subtitleFontSize,
//                     fontWeight: FontWeight.w600,
//                     color: AppColors.textPrimary,
//                   ),
//                 ),
//                 QuantitySelector(
//                   quantity: quantity,
//                   onChanged: (newQty) {
//                     setState(() {
//                       quantity = newQty;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(height: responsive.isLargeTablet ? 20 : 16),

//             // Pay Button
//             GestureDetector(
//               onTap: () {
//                 widget.onAddToCart(product, quantity);
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text(
//                         '${product.name} × $quantity added to cart'),
//                     duration: const Duration(seconds: 1),
//                     behavior: SnackBarBehavior.floating,
//                     backgroundColor: AppColors.primary,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                   ),
//                 );
//               },
//               child: Container(
//                 width: double.infinity,
//                 height: responsive.buttonHeight + 4,
//                 decoration: BoxDecoration(
//                   color: AppColors.primary,
//                   borderRadius: BorderRadius.circular(
//                       (responsive.buttonHeight + 4) / 2),
//                   boxShadow: [
//                     BoxShadow(
//                       color: AppColors.primary.withOpacity(0.3),
//                       blurRadius: 12,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: Center(
//                   child: Text(
//                     'Pay ${product.currency}${totalPrice.toStringAsFixed(0)}',
//                     style: TextStyle(
//                       fontSize: responsive.payButtonFontSize,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/quantity_selector.dart';
import '../widgets/info_chip.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  final Function(Product product, int quantity) onAddToCart;

  const ProductDetailScreen({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;

  double get totalPrice => widget.product.price * quantity;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    // If tablet is rotated horizontally, do split screen
    if (responsive.isTablet && !responsive.isPortrait) {
      return _buildLandscapeLayout(context, responsive, widget.product);
    }

    // Default Portrait (10-inch) Layout
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    // Pad bottom so content isn't hidden behind the floating bar
                    bottom: responsive.buttonHeight + 120, 
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeroImage(responsive, widget.product),
                      SizedBox(height: responsive.isTablet ? 32 : 24),
                      _buildProductInfo(responsive, widget.product),
                    ],
                  ),
                ),
              ),
            ],
          ),
          
          // Floating Bottom Action Bar
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildBottomActionBar(responsive, widget.product),
          ),
        ],
      ),
    );
  }

  // --- Layout Widgets ---
  
  // (Landscape code remains the same as previous)
  Widget _buildLandscapeLayout(BuildContext context, Responsive responsive, Product product) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                Container(
                  width: double.infinity, height: double.infinity,
                  color: AppColors.surface,
                  child: Image.asset(product.imageUrl, fit: BoxFit.cover),
                ),
                Positioned(top: 24, left: 24, child: _buildBackButton(responsive)),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(responsive.horizontalPadding),
                    child: _buildProductInfoContent(responsive, product),
                  ),
                ),
                _buildBottomActionBar(responsive, product, isFloating: false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroImage(Responsive responsive, Product product) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: responsive.detailImageHeight,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(responsive.isTablet ? 32 : 24),
              bottomRight: Radius.circular(responsive.isTablet ? 32 : 24),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(responsive.isTablet ? 32 : 24),
              bottomRight: Radius.circular(responsive.isTablet ? 32 : 24),
            ),
            child: Image.asset(
              product.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(Icons.fastfood, size: 80, color: Colors.grey)),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(responsive.horizontalPadding),
            child: _buildBackButton(responsive),
          ),
        ),
      ],
    );
  }

  Widget _buildBackButton(Responsive responsive) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: responsive.backButtonSize,
        height: responsive.backButtonSize,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10),
          ],
        ),
        child: Icon(
          Icons.arrow_back,
          size: responsive.iconSize,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildProductInfo(Responsive responsive, Product product) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.horizontalPadding),
      child: _buildProductInfoContent(responsive, product),
    );
  }

  Widget _buildProductInfoContent(Responsive responsive, Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                product.name,
                style: TextStyle(
                  fontSize: responsive.detailTitleFontSize,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                  height: 1.1,
                ),
              ),
            ),
            SizedBox(width: 16),
            Text(
              product.priceDisplay,
              style: TextStyle(
                fontSize: responsive.largePriceFontSize,
                fontWeight: FontWeight.w800,
                color: AppColors.primaryLight,
              ),
            ),
          ],
        ),
        SizedBox(height: responsive.isTablet ? 16 : 12),
        if (product.description != null)
          Text(
            product.description!,
            style: TextStyle(
              fontSize: responsive.detailDescFontSize,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        SizedBox(height: responsive.isTablet ? 32 : 24),
        Wrap(
          spacing: 12, runSpacing: 12,
          children: [
            if (product.tags != null)
              ...product.tags!.map((tag) => InfoChip(
                    label: tag,
                    icon: tag == 'Vegetarian' ? Icons.eco : Icons.restaurant,
                    iconColor: tag == 'Vegetarian' ? AppColors.greenDark : AppColors.primaryLight,
                    backgroundColor: tag == 'Vegetarian' ? AppColors.greenLight : AppColors.orangeLight,
                    borderColor: Colors.transparent, // Clean look like design
                  )),
            if (product.calories != null)
              InfoChip(label: product.calories!, icon: Icons.local_fire_department_outlined),
            if (product.allergenInfo != null)
              InfoChip(label: product.allergenInfo!, icon: Icons.info_outline),
          ],
        ),
        SizedBox(height: responsive.isTablet ? 32 : 24),
        if (product.packInfo != null)
          Container(
            padding: EdgeInsets.all(responsive.isTablet ? 20 : 16),
            decoration: BoxDecoration(
              color: AppColors.infoBannerBg,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Icon(Icons.access_time_filled, color: AppColors.infoBannerText, size: responsive.iconSize),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    product.packInfo!,
                    style: TextStyle(
                      fontSize: responsive.smallFontSize + 2,
                      fontWeight: FontWeight.w600,
                      color: AppColors.infoBannerText,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildBottomActionBar(Responsive responsive, Product product, {bool isFloating = true}) {
    return Container(
      margin: isFloating ? EdgeInsets.all(responsive.horizontalPadding) : EdgeInsets.zero,
      padding: EdgeInsets.all(responsive.isTablet ? 24 : 16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(isFloating ? 24 : 0),
        boxShadow: isFloating ? [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ] : [],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quantity',
                  style: TextStyle(
                    fontSize: responsive.subtitleFontSize,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                QuantitySelector(
                  quantity: quantity,
                  onChanged: (newQty) => setState(() => quantity = newQty),
                ),
              ],
            ),
            SizedBox(height: responsive.isTablet ? 24 : 16),
            GestureDetector(
              onTap: () {
                widget.onAddToCart(product, quantity);
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                height: responsive.buttonHeight,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(16), // Less rounded, more modern tablet feel
                ),
                child: Center(
                  child: Text(
                    'Pay ${product.currency}${totalPrice.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: responsive.payButtonFontSize,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}