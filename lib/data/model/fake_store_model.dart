
import 'package:fake_store_api/data/model/fake_store_model_impl.dart';
import 'package:fake_store_api/data/vos/product_vo/product_vo.dart';
import 'package:fake_store_api/network/data_agent/fake_store_data_agent.dart';
import 'package:fake_store_api/network/data_agent/fake_store_data_agent_impl.dart';

class FakeStoreModelImpl extends FakeStoreModel{
  final FakeStoreDataAgent _dataAgent = FakeStoreDataAgentImpl() ;

  FakeStoreModelImpl._();

  static final FakeStoreModelImpl _singleton = FakeStoreModelImpl._();

   factory FakeStoreModelImpl() => _singleton;

  @override
  Future<List<ProductVO>?> getAllProducts() {
    return _dataAgent.getAllProducts();
  }

  @override
  Future<ProductVO?> getOneProduct(int id) {
   return _dataAgent.getOneProduct(id);
  } 

   
}