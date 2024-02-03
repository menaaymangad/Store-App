import '../helper/api.dart';
import '../models/all_product_model.dart';

class UpdateProduct{
  Future<AllProductsModel> updateProduct(
      {required String title,
      required String description,
      required String price,
      required String image,
      required String category}) async {
    // ignore: missing_required_param
    Map<String, dynamic> data = await Api().post(url: 'https://fakestoreapi.com/products', body: {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category,
    });
    return AllProductsModel.fromJson(data);
  }
}