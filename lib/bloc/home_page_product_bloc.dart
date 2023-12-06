import 'package:fake_store_api/bloc/base_bloc.dart';
import 'package:fake_store_api/data/model/fake_store_model.dart';
import 'package:fake_store_api/data/model/fake_store_model_impl.dart';
import 'package:fake_store_api/data/vos/product_vo/product_vo.dart';
import 'package:fake_store_api/network/data_agent/fake_store_data_agent.dart';
import 'package:fake_store_api/network/data_agent/fake_store_data_agent_impl.dart';


class HomePageProductBloc extends BaseBloc{
  List<ProductVO> ? _allProduct = [];

 List<ProductVO> ? get getProducts => _allProduct;

  HomePageProductBloc(){
    FakeStoreModel model = FakeStoreModelImpl();
    model.getAllProducts().then((value) {
      _allProduct= value;
      notifyListeners();
    } );
    
  }
}