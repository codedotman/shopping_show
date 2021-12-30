import 'package:shopping_show/data/models/add_product_response.dart';
import 'package:shopping_show/data/models/maka_response.dart';
import 'package:shopping_show/data/network/http_request.dart';
import 'package:shopping_show/data/network/routes/route_path.dart';

class ProductRepository {
  final ServerData _serverData = ServerData();

  Future<List<MakaResponse>> fetchProducts() async {
    var responseData = await _serverData.getData(path: Routes.showProducts);
    return List<MakaResponse>.from(
        responseData.data.map((model) => MakaResponse.fromJson(model)));
  }

  Future<AddProductResponse> addProduct(
    List<Map<String, dynamic>> body,
  ) async {
    var responseData =
        await _serverData.postData(path: Routes.addProduct, body: body);
    return AddProductResponse.fromJson(responseData.data);
  }

  Future<AddProductResponse> buyProduct(String itemId) async {
    var responseData =
        await _serverData.postData(path: Routes.buyProduct(itemId));
    return AddProductResponse.fromJson(responseData.data);
  }
}
