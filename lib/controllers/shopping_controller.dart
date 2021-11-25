import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:getx_example/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

//controller are based upon functionality and not on page.
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProduct();
  }
  void fetchProduct() async {
    Future.delayed(Duration(seconds: 1));
    var productResponse = [

      Product(
        id: 1,
        productName: 'Firstprod',
        productImage: 'abc',
        productDescription: 'Some descrition',
        price: 30
),
       Product(
        id: 2,
        productName: 'seconProd',
        productImage: 'abc',
        productDescription: 'Some descrition',
        price: 50 
),

     Product(
        id: 3,
        productName: 'thirdProd',
        productImage: 'abc',
        productDescription: 'Some descrition',
        price: 60
)


    ];

    products.value = productResponse;
  }
}