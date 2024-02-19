import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/Screens/update_product_page.dart';
import 'package:storeapp/models/all_product_model.dart';
import 'package:storeapp/services/get_all_product.dart';
import 'package:storeapp/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Trends',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.cartPlus),
            onPressed: () {
              Navigator.pushNamed(context, UpdateProductPage.id );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
        child: FutureBuilder<List<AllProductsModel>>(
            future: AllProductsServices().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<AllProductsModel> productList = snapshot.data!;
                return GridView.builder(
                  itemCount: productList.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100,
                  ),
                  itemBuilder: ((context, index) {
                    return CustomCard(
                      productsModel: productList[index],
                    );
                  }),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
