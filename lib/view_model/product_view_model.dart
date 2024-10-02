import 'package:flutter/foundation.dart';
import 'package:test_spintech/models/services/fetch_product_services.dart';

import '../models/product_model.dart';

class ProductViewModel with ChangeNotifier {
  List<Product> _allProducts = [];
  List<Product> get allProducts => _allProducts;
  Status _status = Status.initial;
  Status get status => _status;
  void getProducts() async {
    _status = Status.loading;
    notifyListeners();
    try {
      _allProducts = await ProductServices().fecthAllProduct();
      _status = Status.loaded;
      notifyListeners();
    } catch (e) {
      _status = Status.error;
      notifyListeners();
    }
  }
}

enum Status { initial, loading, loaded, error }
