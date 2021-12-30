import 'package:flutter/cupertino.dart';
import 'package:shopping_show/components/maka_page_state_widget.dart';
import 'package:shopping_show/data/models/add_product_content.dart';
import 'package:shopping_show/data/models/maka_response.dart';
import 'package:shopping_show/data/network/repository/product_repository.dart';

class ProductController with ChangeNotifier {
  PageState pageState = PageState.loaded;
  List<MakaResponse> productResponse = [];
  List<AddProductContent> addProductContent = [AddProductContent()];
  late ProductView _productView;
  final _productRepository = ProductRepository();

  bool get validInput {
    bool isValidInput = true;
    for (var i = 0; i < addProductContent.length; i++) {
      if (addProductContent[i].quantitySold == null ||
          !(isNotEmpty(addProductContent[i].itemName))) {
        isValidInput = false;
        break;
      }
    }
    return isValidInput;
  }

  bool isNotEmpty(String? s) => s != null && s.isNotEmpty && s != 'null';

  ProductController() {
    fetchProducts();
  }

  set setProductView(ProductView view) {
    _productView = view;
  }

  addMoreProduct() {
    addProductContent.add(AddProductContent());
  }

  fetchProducts() async {
    try {
      pageState = PageState.loading;
      notifyListeners();
      var data = await _productRepository.fetchProducts();
      if (data.isNotEmpty) {
        productResponse = data;
        pageState = PageState.loaded;
        notifyListeners();
      } else {
        pageState = PageState.error;
        notifyListeners();
      }
    } catch (_) {
      pageState = PageState.error;
      notifyListeners();
    }
  }

  addProduct() async {
    List<Map<String, dynamic>> dataChildContent =
        addProductContent.map((e) => e.toJson()).toList();
    try {
      pageState = PageState.loading;
      notifyListeners();
      var data = await _productRepository.addProduct(dataChildContent);
      if (data.statusCode == 201) {
        pageState = PageState.loaded;
        _productView.onSuccess(data.message);
        notifyListeners();
      } else {
        pageState = PageState.loaded;
        _productView.onError(data.message);
        notifyListeners();
      }
    } catch (_) {
      pageState = PageState.error;
      notifyListeners();
    }
  }

  buyProduct(String itemID) async {
    try {
      pageState = PageState.loading;
      notifyListeners();
      var data = await _productRepository.buyProduct(itemID);
      if (data.statusCode == 201) {
        pageState = PageState.loaded;
        _productView.onSuccess(data.message);
        notifyListeners();
      } else {
        pageState = PageState.loaded;
        _productView.onError(data.message);
        notifyListeners();
      }
    } catch (_) {
      pageState = PageState.error;
      notifyListeners();
    }
  }
}

abstract class ProductView {
  void onSuccess(String message);
  void onError(String error);
}
