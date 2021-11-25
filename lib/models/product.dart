import 'package:get/state_manager.dart';
import 'package:get/get.dart';
// class Product extends StatelessWidget {

//   const Product({Key? key}) : super(key: key);
//   final int id;
//   final String productName;
//   final String productImage;
//   final String productDescription;
//   final double price;

//   Product({
//     this.id,
//     this.productName,
//     this.productImage,
//     this.productDescription,
//     this.price
//   });
// }



class Product {

  final int? id;
  final String? productName;
  final String? productImage;
  final String? productDescription;
  final double? price;

   Product({this.id, this.productName, this.productImage, this.productDescription, this.price});
  
  final RxBool isFavorite = false.obs;
  // Product({
  //   this.id,
  //   this.productName,
  //   this.productImage,
  //   this.productDescription,
  //   this.price
  // });
 
}