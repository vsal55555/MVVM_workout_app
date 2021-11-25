import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_example/controllers/cart_controller.dart';
import 'package:getx_example/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
   ShoppingPage({ Key? key }) : super(key: key);


  final shoppingController = Get.put(ShoppingController()); //create object and put in dependancy for later use.
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(

        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                    
                    return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.products[index].productName}',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text(
                                          '${controller.products[index].productDescription}'),
                                    ],
                                  ),
                                  Text('\$${controller.products[index].price}',
                                      style: TextStyle(fontSize: 24)),
                                ],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  cartController
                                      .addToCart(controller.products[index]);
                                },
                                color: Colors.blue,
                                textColor: Colors.white,
                                child: Text('Add to Cart'),
                              ),
                              IconButton(
                                    icon: controller
                                            .products[index].isFavorite.value
                                        ? Icon(Icons.check_box_rounded)
                                        : Icon(Icons
                                            .check_box_outline_blank_outlined),
                                    onPressed: () {
                                      controller.products[index].isFavorite.canUpdate;
                                    },
                                  ),
                            ],
                          ),
                        ),
                      );
                  },
                  );
                }
              ),
            ),
            GetX<CartController>(
              builder: (controller) {
                return Text('Total amount \$ ${controller.totalPrice}', style: TextStyle(fontSize: 32, color: Colors.white),);
              }
            ),
            SizedBox(height: 100)
          ],
        ),
      ),
    floatingActionButton: FloatingActionButton.extended(onPressed: () {},
    backgroundColor: Colors.amber,
    icon: Icon(
      Icons.add_shopping_cart_rounded,
      color: Colors.black,
    ),
    //3 ways for GetX state management Getx, GetBuilder, obs
    // label: GetX<CartController>(
    //   builder: (controller) {
    //     return Text(controller.cartItems.length.toString(),
    //     style: TextStyle(color: Colors.black, fontSize: 24),);
    //   }
    // )
  // label: GetBuilder<CartController>(
  //   builder: (controller) {
  //     return Text('${controller.testAmount}',
  //     style: TextStyle(fontSize: 32, color: Colors.white),);
  //   }
  // ),
  label: Obx(() {
    return Text('${cartController.count}',
      style: TextStyle(fontSize: 32, color: Colors.white),);
    }
  ),
    ),
    );
  }
}