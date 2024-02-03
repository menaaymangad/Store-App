import 'package:storeapp/helper/api.dart';
import '../models/all_product_model.dart';

class CategoriesServices {
  Future<List<AllProductsModel>> getAllProducts(
      {required String category}) async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/category/$category');
    List<AllProductsModel> allProducts = [];
    for (int i = 0; i < data.length; i++) {
      allProducts.add(
        AllProductsModel.fromJson(data[i]),
      );
    }
    return allProducts;
  }
}
