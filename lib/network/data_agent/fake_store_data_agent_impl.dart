
import 'package:fake_store_api/data/vos/product_vo/product_vo.dart';

abstract class FakeStoreDataAgent{

  Future<List<ProductVO>?> getAllProducts();

  Future<ProductVO?>getOneProduct(int id);
}