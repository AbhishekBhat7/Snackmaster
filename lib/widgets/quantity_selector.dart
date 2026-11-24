import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onChanged;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final buttonSize = responsive.quantityButtonSize;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.quantityBg,
        borderRadius: BorderRadius.circular(buttonSize),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Minus Button
          GestureDetector(
            onTap: quantity > 1 ? () => onChanged(quantity - 1) : null,
            child: Container(
              width: buttonSize,
              height: buttonSize,
              decoration: BoxDecoration(
                color: quantity > 1
                    ? AppColors.quantityBg
                    : AppColors.quantityBg.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.remove,
                size: responsive.iconSize * 0.85,
                color: quantity > 1 ? AppColors.textPrimary : AppColors.textMuted,
              ),
            ),
          ),

          // Quantity Display
          Container(
            constraints: BoxConstraints(
              minWidth: responsive.isLargeTablet ? 50 : 40,
            ),
            alignment: Alignment.center,
            child: Text(
              '$quantity',
              style: TextStyle(
                fontSize: responsive.quantityFontSize,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),

          // Plus Button
          GestureDetector(
            onTap: () => onChanged(quantity + 1),
            child: Container(
              width: buttonSize,
              height: buttonSize,
              decoration: const BoxDecoration(
                color: AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                size: responsive.iconSize * 0.85,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}