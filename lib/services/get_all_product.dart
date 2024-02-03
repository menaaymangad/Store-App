import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/all_product_model.dart';



class AllProductsServices {
  Future<List<AllProductsModel>> getAllProducts() async {
    List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products');

    List<AllProductsModel> allProducts = [];
    for (int i = 0; i < data.length; i++) {
      allProducts.add(
        AllProductsModel.fromJson(data[i]),
      );
    }
    return allProducts;
  }
}
