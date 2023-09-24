import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant/components/my_button.dart';
import 'package:sushi_restaurant/models/food_model.dart';
import 'package:sushi_restaurant/models/shop_model.dart';
import 'package:sushi_restaurant/themes/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  // remove from cart
  void removeFromCart(FoodModel foodModel, BuildContext context) {
    // get access to shop
    final shopModel = context.read<ShopModel>();

    // remove
    shopModel.removeFromCart(foodModel);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopModel>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: const Text('My Cart'),
            backgroundColor: primaryColor,
          ),
          body: Column(
            children: [
              // Custom Cart
              Expanded(
                child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    // get food from cart
                    final FoodModel foodModel = value.cart[index];

                    // get food name
                    final String foodName = foodModel.name;

                    // get food price
                    final String foodPrice = foodModel.price;

                    return Container(
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin:
                          const EdgeInsets.only(left: 20, top: 20, right: 20),
                      child: ListTile(
                        title: Text(
                          foodName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          foodPrice,
                          style: TextStyle(
                            color: Colors.grey[200],
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () => removeFromCart(
                            foodModel,
                            context,
                          ),
                          icon: Icon(
                            Icons.delete,
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Pay Button
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: MyButton(text: "Pay Now ", onTap: () {}),
              ),
            ],
          ),
        );
      },
    );
  }
}
