import 'package:api_integration/models/product.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  // ignore: missing_return
  static Future<List<Product>> fetchProducts() async {
    var url =
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString); //productFromJson copy from model
    } else {
      //show error message
      return null;
    }
  }
}
