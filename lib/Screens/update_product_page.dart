import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/models/all_product_model.dart';
import 'package:storeapp/services/update_product.dart';
import 'package:storeapp/widgets/custom_button.dart';
import 'package:storeapp/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = 'UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? title, description, image, price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AllProductsModel model =
        ModalRoute.of(context)!.settings.arguments as AllProductsModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  function: (data) {
                    title = data;
                  },
                  hint: 'Product Name',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  function: (data) {
                    description = data;
                  },
                  hint: 'Product Description',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  textInputType: TextInputType.number,
                  function: (data) {
                    price = data;
                  },
                  hint: 'Product Price',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  function: (data) {
                    image = data;
                  },
                  hint: 'Product Image',
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  buttonName: 'Update',
                  function: () async{
                    isLoading = true;
                    setState(() {});
                    try {
                     await updateproduct(model);
                      print('sucess');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateproduct(AllProductsModel model) async{
    await UpdateProduct().updateProduct(
      title: title ?? model.title,
      description: description ?? model.description,
      price: price ?? model.price.toString(),
      image: image ?? model.image,
      category: model.category,
    );
  }
}
