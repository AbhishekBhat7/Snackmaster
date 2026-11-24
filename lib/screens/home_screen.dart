import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/category_chip.dart';
import '../widgets/product_card.dart';
import '../widgets/cart_bottom_bar.dart';
import 'search_screen.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Snacks';
  List<CartItem> cartItems = [];
  late List<Product> allProducts;

  @override
  void initState() {
    super.initState();
    allProducts = SampleData.products;
  }

  List<Product> get filteredProducts {
    return allProducts
        .where((p) =>
            p.category.toLowerCase() == selectedCategory.toLowerCase())
        .toList();
  }

  // Show all products if filtered list is empty
  List<Product> get displayProducts {
    final filtered = filteredProducts;
    return filtered.isNotEmpty ? filtered : allProducts;
  }

  int get totalCartItems =>
      cartItems.fold(0, (sum, item) => sum + item.quantity);

  double get totalCartPrice =>
      cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);

  void _addToCart(Product product) {
    setState(() {
      final existingIndex =
          cartItems.indexWhere((item) => item.product.id == product.id);
      if (existingIndex != -1) {
        cartItems[existingIndex].quantity++;
      } else {
        cartItems.add(CartItem(product: product));
      }
    });

    // Show snackbar
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} added to cart'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _navigateToSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchScreen(products: allProducts),
      ),
    );
  }

  void _navigateToDetail(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(
          product: product,
          onAddToCart: (product, quantity) {
            setState(() {
              final existingIndex =
                  cartItems.indexWhere((item) => item.product.id == product.id);
              if (existingIndex != -1) {
                cartItems[existingIndex].quantity += quantity;
              } else {
                cartItems.add(CartItem(product: product, quantity: quantity));
              }
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsive.horizontalPadding,
                vertical: responsive.isLargeTablet ? 20 : 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Grab a Bite!',
                    style: TextStyle(
                      fontSize: responsive.titleFontSize,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      letterSpacing: -0.5,
                    ),
                  ),
                  GestureDetector(
                    onTap: _navigateToSearch,
                    child: Container(
                      width: responsive.backButtonSize,
                      height: responsive.backButtonSize,
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.chipBorder,
                          width: 1,
                        ),
                      ),
                      child: Icon(
                        Icons.search,
                        size: responsive.iconSize,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Category Chips
            SizedBox(
              height: responsive.chipHeight + 16,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.horizontalPadding,
                  vertical: 8,
                ),
                itemCount: SampleData.categories.length,
                separatorBuilder: (_, __) =>
                    SizedBox(width: responsive.isLargeTablet ? 12 : 8),
                itemBuilder: (context, index) {
                  final category = SampleData.categories[index];
                  return CategoryChip(
                    label: category,
                    isSelected: selectedCategory == category,
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  );
                },
              ),
            ),

            // Product Grid
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.horizontalPadding,
                ),
                child: GridView.builder(
                  padding: EdgeInsets.only(
                    top: responsive.isLargeTablet ? 16 : 8,
                    bottom: totalCartItems > 0
                        ? responsive.bottomBarHeight + 16
                        : 16,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: responsive.gridColumns,
                    crossAxisSpacing: responsive.gridSpacing,
                    mainAxisSpacing: responsive.gridSpacing,
                    childAspectRatio: responsive.gridChildAspectRatio,
                  ),
                  itemCount: displayProducts.length,
                  itemBuilder: (context, index) {
                    final product = displayProducts[index];
                    return ProductCard(
                      product: product,
                      onTap: () => _navigateToDetail(product),
                      onAddTap: () => _addToCart(product),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      // Cart Bottom Bar
      bottomNavigationBar: totalCartItems > 0
          ? CartBottomBar(
              itemCount: totalCartItems,
              totalPrice: totalCartPrice,
              onViewCart: () {
                // Handle view cart
              },
            )
          : null,
    );
  }
}