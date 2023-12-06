import 'package:fake_store_api/bloc/base_bloc.dart';
import 'package:fake_store_api/data/model/fake_store_model.dart';
import 'package:fake_store_api/data/model/fake_store_model_impl.dart';

import '../data/vos/product_vo/product_vo.dart';

class ProductDetailBloc extends BaseBloc{
  ProductVO ? _oneProduct  ;
  
  ProductVO ? get getOneProduct  => _oneProduct;
  ProductDetailBloc(int id){
    FakeStoreModel model =FakeStoreModelImpl();
    model.getOneProduct(id).then((value) {
      _oneProduct = value;
      notifyListeners();
    }
     );
  }
}