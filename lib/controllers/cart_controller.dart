import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_example/models/product.dart';
import 'package:get/get.dart';


class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  int get count => cartItems.length; //get property
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + (item.price as double));

  //var testAmount = 0;  //In getbuilder, you don't need obs

  addToCart(Product product) {
    cartItems.add(product);
    //for get builder
    //testAmount = count;
    //update();  //you need this in get builder to update the widget
  }
}