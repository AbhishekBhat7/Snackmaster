import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;

  Responsive(this.context);

  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;
  double get shortestSide => MediaQuery.of(context).size.shortestSide;
  bool get isPortrait => screenHeight > screenWidth;

  bool get isMobile => shortestSide < 600;
  bool get isTablet => shortestSide >= 600 && shortestSide < 900;
  bool get isLargeTablet => shortestSide >= 900;
  bool get isLandscape => screenWidth > screenHeight;

  // Grid columns based on screen size
  int get gridColumns {
    if (screenWidth >= 1200) return 4;
    if (screenWidth >= 900) return 3;
    if (screenWidth >= 600) return 3;
    return 2;
  }

  // Dynamic sizing
  double get horizontalPadding {
    if (isLargeTablet) return 32.0;
    if (isTablet) return 24.0;
    return 16.0;
  }

  double get cardBorderRadius {
    if (isLargeTablet) return 20.0;
    if (isTablet) return 16.0;
    return 12.0;
  }

  double get titleFontSize {
    if (isLargeTablet) return 36.0;
    if (isTablet) return 30.0;
    return 24.0;
  }

  double get subtitleFontSize {
    if (isLargeTablet) return 20.0;
    if (isTablet) return 18.0;
    return 16.0;
  }

  double get bodyFontSize {
    if (isLargeTablet) return 18.0;
    if (isTablet) return 16.0;
    return 14.0;
  }

  double get smallFontSize {
    if (isLargeTablet) return 15.0;
    if (isTablet) return 13.0;
    return 11.0;
  }

  double get chipFontSize {
    if (isLargeTablet) return 16.0;
    if (isTablet) return 14.0;
    return 12.0;
  }

  double get iconSize {
    if (isLargeTablet) return 28.0;
    if (isTablet) return 24.0;
    return 20.0;
  }

  double get buttonHeight {
    if (isLargeTablet) return 60.0;
    if (isTablet) return 54.0;
    return 48.0;
  }

  double get productImageHeight {
    if (isLargeTablet) return 200.0;
    if (isTablet) return 170.0;
    return 140.0;
  }

  double get detailImageHeight {
    if (isLandscape) return screenHeight * 0.45;
    if (isLargeTablet) return screenHeight * 0.38;
    if (isTablet) return screenHeight * 0.33;
    return screenHeight * 0.3;
  }

  double get bottomBarHeight {
    if (isLargeTablet) return 90.0;
    if (isTablet) return 80.0;
    return 70.0;
  }

  double get searchBarHeight {
    if (isLargeTablet) return 56.0;
    if (isTablet) return 50.0;
    return 44.0;
  }

  double get chipHeight {
    if (isLargeTablet) return 44.0;
    if (isTablet) return 40.0;
    return 36.0;
  }

  double get addButtonSize {
    if (isLargeTablet) return 44.0;
    if (isTablet) return 40.0;
    return 36.0;
  }

  double get searchResultImageSize {
    if (isLargeTablet) return 80.0;
    if (isTablet) return 70.0;
    return 56.0;
  }

  double get quantityButtonSize {
    if (isLargeTablet) return 48.0;
    if (isTablet) return 42.0;
    return 36.0;
  }

  double get priceFontSize {
    if (isLargeTablet) return 22.0;
    if (isTablet) return 19.0;
    return 16.0;
  }

  double get largePriceFontSize {
    if (isLargeTablet) return 30.0;
    if (isTablet) return 26.0;
    return 22.0;
  }

  EdgeInsets get cardPadding {
    if (isLargeTablet) return const EdgeInsets.all(16);
    if (isTablet) return const EdgeInsets.all(12);
    return const EdgeInsets.all(10);
  }

  double get gridSpacing {
    if (isLargeTablet) return 20.0;
    if (isTablet) return 16.0;
    return 12.0;
  }

  double get gridChildAspectRatio {
    if (isLandscape) return 0.85;
    if (isLargeTablet) return 0.72;
    if (isTablet) return 0.7;
    return 0.68;
  }

  double get backButtonSize {
    if (isLargeTablet) return 48.0;
    if (isTablet) return 44.0;
    return 38.0;
  }

  double get stockBadgeFontSize {
    if (isLargeTablet) return 13.0;
    if (isTablet) return 11.0;
    return 10.0;
  }

  // Detail page specific
  double get detailTitleFontSize {
    if (isLargeTablet) return 38.0;
    if (isTablet) return 32.0;
    return 26.0;
  }

  double get detailDescFontSize {
    if (isLargeTablet) return 18.0;
    if (isTablet) return 16.0;
    return 14.0;
  }

  double get payButtonFontSize {
    if (isLargeTablet) return 22.0;
    if (isTablet) return 20.0;
    return 18.0;
  }

  double get quantityFontSize {
    if (isLargeTablet) return 22.0;
    if (isTablet) return 20.0;
    return 18.0;
  }

  double get infoBannerFontSize {
    if (isLargeTablet) return 16.0;
    if (isTablet) return 14.0;
    return 12.0;
  }
}