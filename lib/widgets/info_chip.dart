import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

class InfoChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? borderColor;

  const InfoChip({
    super.key,
    required this.label,
    this.icon,
    this.iconColor,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.isLargeTablet ? 16 : 12,
        vertical: responsive.isLargeTablet ? 8 : 6,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: borderColor ?? AppColors.chipBorder,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: responsive.chipFontSize + 2,
              color: iconColor ?? AppColors.textSecondary,
            ),
            SizedBox(width: responsive.isLargeTablet ? 8 : 6),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: responsive.chipFontSize,
              fontWeight: FontWeight.w500,
              color: iconColor ?? AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}