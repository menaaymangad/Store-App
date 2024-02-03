import 'package:storeapp/constants.dart';
import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/all_product_model.dart';

class AddProduct {
  Future<AllProductsModel> addProduct(
      {required String title,
      required String description,
      required String price,
      required String image,
      required String category}) async {
    // ignore: missing_required_param
    Map<String, dynamic> data = await Api().post(url: '$uri/products', body: {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category,
    });
    return AllProductsModel.fromJson(data);
  }
}
