import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: responsive.chipHeight,
        padding: EdgeInsets.symmetric(
          horizontal: responsive.isLargeTablet ? 24 : (responsive.isTablet ? 20 : 16),
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.chipSelected : Colors.transparent,
          borderRadius: BorderRadius.circular(responsive.chipHeight / 2),
          border: Border.all(
            color: isSelected ? AppColors.chipSelectedBorder : AppColors.chipBorder,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: responsive.chipFontSize,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected ? AppColors.primaryLight : AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}