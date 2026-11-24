enum StockStatus { inStock, limited, outOfStock }

class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final String currency;
  final String imageUrl;
  final StockStatus stockStatus;
  final int? remainingStock;
  final String? description;
  final List<String>? tags;
  final String? calories;
  final String? allergenInfo;
  final String? packInfo;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    this.currency = '₹',
    required this.imageUrl,
    this.stockStatus = StockStatus.inStock,
    this.remainingStock,
    this.description,
    this.tags,
    this.calories,
    this.allergenInfo,
    this.packInfo,
  });

  String get priceDisplay => '$currency${price.toStringAsFixed(0)}';

  String get stockLabel {
    switch (stockStatus) {
      case StockStatus.inStock:
        return 'In Stock';
      case StockStatus.limited:
        return 'Only $remainingStock left';
      case StockStatus.outOfStock:
        return 'Out of Stock';
    }
  }
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  double get totalPrice => product.price * quantity;
}

// Sample Data
class SampleData {
  static const List<String> categories = [
    'Snacks',
    'Beverages',
    'Protein & Health',
    'Chocolates',
    'Meals',
  ];

  static List<Product> get products => [
        const Product(
          id: '1',
          name: 'Kurkure Masala Munch',
          category: 'Snacks',
          price: 20,
          imageUrl: 'assets/images/kurkure.png',
          stockStatus: StockStatus.inStock,
        ),
        const Product(
          id: '2',
          name: "Lay's Classic Salted",
          category: 'Snacks',
          price: 20,
          imageUrl: 'assets/images/lays.png',
          stockStatus: StockStatus.inStock,
        ),
        const Product(
          id: '3',
          name: 'Frooti Mango 160ml',
          category: 'Beverages',
          price: 35,
          imageUrl: 'assets/images/frooti.png',
          stockStatus: StockStatus.inStock,
        ),
        const Product(
          id: '4',
          name: 'Protein Bar',
          category: 'Protein & Health',
          price: 60,
          imageUrl: 'assets/images/protein_bar.png',
          stockStatus: StockStatus.limited,
          remainingStock: 2,
        ),
        const Product(
          id: '5',
          name: 'Veg Meal Box',
          category: 'Meals',
          price: 120,
          imageUrl: 'assets/images/veg_meal.png',
          stockStatus: StockStatus.inStock,
          description:
              'Freshly packed vegetarian meal box with rice, dal, and mixed vegetables.',
          tags: ['Vegetarian'],
          calories: '450 kcal',
          allergenInfo: 'Contains gluten',
          packInfo: 'Packed today · Best before 6:00 PM',
        ),
        const Product(
          id: '6',
          name: 'Non-Veg Meal Box',
          category: 'Meals',
          price: 150,
          imageUrl: 'assets/images/nonveg_meal.png',
          stockStatus: StockStatus.outOfStock,
          description:
              'Freshly packed non-vegetarian meal box with rice, chicken curry, and salad.',
          tags: ['Non-Vegetarian'],
          calories: '550 kcal',
          allergenInfo: 'Contains gluten',
          packInfo: 'Packed today · Best before 6:00 PM',
        ),
      ];

  static const List<String> searchFilters = [
    'Vegetarian',
    'Vegan',
    'Gluten-Free',
    'Sugar-Free',
    'High Protein',
  ];
}