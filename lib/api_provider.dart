// api_provider.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'product_model.dart';

class ApiProvider {
  final String apiUrl = 'https://dummyjson.com/products';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      List<dynamic> productsData = jsonData['products'];
      return productsData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Ошибка при получении данных');
    }
  }
}
