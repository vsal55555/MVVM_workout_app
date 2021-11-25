import 'package:get/state_manager.dart';
import 'package:getx_example/models/shop_product.dart';
import 'package:getx_example/services/remote_services.dart';

class ProductController extends GetxController {
  
  var productList = <NewProduct>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    isLoading(true);
    var products = await RemoteServices.fetchProducts();
    try {
      if (products != null) {
        productList.value = products;
      }
    } finally {
      // TODO
      isLoading(false);
      print('Someting went wrong while fetching');
    }
  } 
}