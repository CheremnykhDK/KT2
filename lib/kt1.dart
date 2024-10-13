// main.dart
import 'api_provider.dart';
import 'product_model.dart';
import 'dart:async';

Future<void> main() async {
  final apiProvider = ApiProvider();

  try {
    // Получаем список продуктов
    List<Product> products = await apiProvider.fetchProducts();

    // Фильтрация продуктов со скидкой больше 20%
    var discountedProducts = products.where((product) => product.discountPercentage > 20);

    // Нахождение максимальной цены среди отфильтрованных продуктов
    double? maxPrice = discountedProducts.isNotEmpty
        ? discountedProducts.map((product) => product.price).reduce((a, b) => a > b ? a : b)
        : null;

    // Вывод результата
    if (maxPrice != null && maxPrice > 0) {
      print('Максимальная цена товара со скидкой больше 20%: $maxPrice');
    } else {
      print('Нет товаров со скидкой больше 20%');
    }
  } catch (e) {
    print('Ошибка: $e');
  }
}
