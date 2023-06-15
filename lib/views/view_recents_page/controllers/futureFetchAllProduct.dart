import '../../../models/product/product.dart';
import '../../product page/controllers/futureGetProduct.dart';

Future<List<Product>> fetchAllProduct(data) async {
  List<Product> listProduct = <Product>[];
  for (var id in data)
    await futureGetProduct(id).then((value) {
      listProduct.add(value);
    });
  return listProduct;
}
