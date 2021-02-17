import 'package:api_integration/models/product.dart';
import 'package:api_integration/services/remote_services.dart';
import 'package:get/state_manager.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = List<Product>().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        // ignore: deprecated_member_use, invalid_use_of_protected_member
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
