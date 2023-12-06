import 'package:fake_store_api/bloc/base_bloc.dart';

import '../data/vos/product_vo/product_vo.dart';

class CartBloc extends BaseBloc{
  List<ProductVO> cartProducts = [];
  


  void addToCart( ProductVO  product){
    cartProducts.add(product);
    notifyListeners();
  }

  void removeFromCart(ProductVO product){
    cartProducts.remove(product);
    notifyListeners();
  }


}