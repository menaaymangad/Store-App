import 'package:flutter/material.dart';
import 'package:storeapp/Screens/update_product_page.dart';
import 'package:storeapp/models/all_product_model.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    super.key,
    required this.productsModel,
  });
  AllProductsModel productsModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.2),
                  blurRadius: 20,
                  spreadRadius: 0,
                  offset: const Offset(10, 10))
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      productsModel.title.substring(0, 7),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${productsModel.price.toString()}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Image.network(
            productsModel.image,
            height: 100,
            width: 100,
          )
        ],
      ),
    );
  }
}
