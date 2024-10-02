import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:test_spintech/models/product_model.dart';

class ProductServices {
  Future<List<Product>> fecthAllProduct() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode != HttpStatus.ok) {
        throw Exception('something went wrong');
      }
      final data = jsonDecode(response.body) as List;
      final products = data
          .map((e) => Product(
              id: e['id'],
              title: e['title'],
              price:double.tryParse( e['price'].toString())?? 0,
              description: e['description'],
              image: e['image'],))
              //rating: e['rating']))
          .toList();
      return products;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
