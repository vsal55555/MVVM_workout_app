import 'dart:convert';

import 'package:getx_example/models/shop_product.dart';
import 'package:http/http.dart' as http;
import 'package:getx_example/models/shop_product.dart';


class RemoteServices {
  
  static var client = http.Client();//whenever calling for remote service you are using same client
  static Map<String, String> qParams = {
  'product_category': 'powder',
  'product_type': 'blush',
};
   static Future<List<NewProduct>> fetchProducts() async {  //use future since async used
 
  var response = await client.get('https://makeup-api.herokuapp.com/api/v1/products.json?product_category=powder&product_type=blush');
// var response = await http.get('https://makeup-api.herokuapp.com/api/v1/products.json');
  if (response.statusCode == 200) {
    var jsonString = response.body;
    return newProductFromJson(jsonString);//newProductFromJson(jsonString);
  } else {
        print('Cannot fetch data');
        return [];
    }
}
}      
//Future<List<NewProduct>> 
//print(response.body); //here the response is in string. so need to parse into json with the help of class
// //var url = 
  // Uri(
  //   scheme: 'https',
  //   host: 'www.makeup-api.herokuapp.com',
  //   path: '/api/v1/products.json',
  //   queryParameters: qParams
  // );
    // Uri.https('https://makeup-api.herokuapp.com/api/v1/products.json');//, {'q': '{http}'})