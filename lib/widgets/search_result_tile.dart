import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

class SearchResultTile extends StatelessWidget {
  final String name;
  final String type;
  final String detail;
  final String price;
  final String stockStatus;
  final String? imageUrl;
  final VoidCallback onTap;

  const SearchResultTile({
    super.key,
    required this.name,
    required this.type,
    required this.detail,
    required this.price,
    required this.stockStatus,
    this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: responsive.horizontalPadding,
          vertical: responsive.isLargeTablet ? 14 : 10,
        ),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(responsive.cardBorderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 6,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(responsive.cardBorderRadius * 0.7),
              child: Container(
                width: responsive.searchResultImageSize,
                height: responsive.searchResultImageSize,
                color: AppColors.surface,
                child: imageUrl != null
                    ? Image.asset(
                        imageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.fastfood_rounded,
                            size: responsive.searchResultImageSize * 0.5,
                            color: AppColors.textMuted.withOpacity(0.4),
                          );
                        },
                      )
                    : Icon(
                        Icons.fastfood_rounded,
                        size: responsive.searchResultImageSize * 0.5,
                        color: AppColors.textMuted.withOpacity(0.4),
                      ),
              ),
            ),
            SizedBox(width: responsive.isLargeTablet ? 16 : 12),

            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: responsive.bodyFontSize,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: responsive.isLargeTablet ? 4 : 2),
                  Text(
                    type,
                    style: TextStyle(
                      fontSize: responsive.smallFontSize,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Text(
                    detail,
                    style: TextStyle(
                      fontSize: responsive.smallFontSize,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),

            // Price and Stock
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: responsive.priceFontSize,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryLight,
                  ),
                ),
                SizedBox(height: responsive.isLargeTablet ? 6 : 4),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsive.isLargeTablet ? 12 : 8,
                    vertical: responsive.isLargeTablet ? 6 : 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.stockGreen,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    stockStatus,
                    style: TextStyle(
                      fontSize: responsive.stockBadgeFontSize,
                      fontWeight: FontWeight.w600,
                      color: AppColors.stockGreenText,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}