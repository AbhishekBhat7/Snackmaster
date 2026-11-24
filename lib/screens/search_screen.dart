import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/category_chip.dart';
import '../widgets/search_result_tile.dart';
import 'product_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  final List<Product> products;

  const SearchScreen({
    super.key,
    required this.products,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String selectedFilter = 'Vegetarian';
  List<Product> searchResults = [];

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase().trim();
    if (query.isEmpty) {
      setState(() {
        searchResults = [];
      });
      return;
    }

    setState(() {
      searchResults = widget.products.where((product) {
        return product.name.toLowerCase().contains(query) ||
            product.category.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Bar with Back Button and Search
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsive.horizontalPadding,
                vertical: responsive.isLargeTablet ? 16 : 12,
              ),
              child: Row(
                children: [
                  // Back Button
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
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
                        Icons.arrow_back,
                        size: responsive.iconSize,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SizedBox(width: responsive.isLargeTablet ? 16 : 12),

                  // Search Field
                  Expanded(
                    child: Container(
                      height: responsive.searchBarHeight,
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius:
                            BorderRadius.circular(responsive.searchBarHeight / 2),
                        border: Border.all(
                          color: AppColors.chipBorder,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                              width: responsive.isLargeTablet ? 16 : 12),
                          Icon(
                            Icons.search,
                            size: responsive.iconSize,
                            color: AppColors.textMuted,
                          ),
                          SizedBox(width: responsive.isLargeTablet ? 12 : 8),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              focusNode: _focusNode,
                              style: TextStyle(
                                fontSize: responsive.bodyFontSize,
                                color: AppColors.textPrimary,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Search for food...',
                                hintStyle: TextStyle(
                                  fontSize: responsive.bodyFontSize,
                                  color: AppColors.textMuted,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                                isDense: true,
                              ),
                            ),
                          ),
                          if (_searchController.text.isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                _searchController.clear();
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      responsive.isLargeTablet ? 14 : 10,
                                ),
                                child: Icon(
                                  Icons.close,
                                  size: responsive.iconSize,
                                  color: AppColors.textMuted,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Filter Chips
            SizedBox(
              height: responsive.chipHeight + 16,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.horizontalPadding,
                  vertical: 8,
                ),
                itemCount: SampleData.searchFilters.length,
                separatorBuilder: (_, __) =>
                    SizedBox(width: responsive.isLargeTablet ? 12 : 8),
                itemBuilder: (context, index) {
                  final filter = SampleData.searchFilters[index];
                  return CategoryChip(
                    label: filter,
                    isSelected: selectedFilter == filter,
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                  );
                },
              ),
            ),

            // Results
            if (searchResults.isNotEmpty) ...[
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.horizontalPadding,
                  vertical: responsive.isLargeTablet ? 12 : 8,
                ),
                child: Text(
                  'Top matches',
                  style: TextStyle(
                    fontSize: responsive.bodyFontSize,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),

              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsive.horizontalPadding,
                  ),
                  itemCount: searchResults.length,
                  separatorBuilder: (_, __) =>
                      SizedBox(height: responsive.isLargeTablet ? 12 : 8),
                  itemBuilder: (context, index) {
                    final product = searchResults[index];
                    return SearchResultTile(
                      name: product.name,
                      type: product.category,
                      detail: product.description ?? '',
                      price: product.priceDisplay,
                      stockStatus: product.stockLabel,
                      imageUrl: product.imageUrl,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(
                              product: product,
                              onAddToCart: (product, quantity) {},
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ] else if (_searchController.text.isNotEmpty) ...[
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_off_rounded,
                        size: responsive.isLargeTablet ? 80 : 60,
                        color: AppColors.textMuted.withOpacity(0.4),
                      ),
                      SizedBox(height: responsive.isLargeTablet ? 20 : 16),
                      Text(
                        'No results found',
                        style: TextStyle(
                          fontSize: responsive.subtitleFontSize,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      SizedBox(height: responsive.isLargeTablet ? 8 : 4),
                      Text(
                        'Try searching for something else',
                        style: TextStyle(
                          fontSize: responsive.bodyFontSize,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ] else ...[
              const Expanded(child: SizedBox()),
            ],
          ],
        ),
      ),
    );
  }
}