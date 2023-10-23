
import 'package:dio/dio.dart';
import 'package:fake_store_api/constant/api_constant.dart';
import 'package:fake_store_api/data/vos/product_vo/product_vo.dart';
import 'package:retrofit/retrofit.dart';

part 'fake_store_api.g.dart';
@RestApi(baseUrl: kBaseURL)
abstract class FakeStoreAPI{
  factory FakeStoreAPI(Dio dio) => _FakeStoreAPI(dio);
  @GET(kGetAllProductsEndPoint)
  Future<List<ProductVO>?> allProductResponse();

  @GET(kGetOneProductEndPoint)
  Future<ProductVO?> oneProductResponse(
    @Path(kPathParametersID)int id
  );


}