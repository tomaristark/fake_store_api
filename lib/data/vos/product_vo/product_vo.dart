
import 'package:fake_store_api/data/vos/rating_vo/rating_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_vo.g.dart';

@JsonSerializable()
class ProductVO{
  @JsonKey(name : "id")
    final int id;
  
    @JsonKey(name : "title")
    final String title;
  
    @JsonKey(name : "price")
    final double price;
  
    @JsonKey(name : "description")
    final String description;
  
    @JsonKey(name : "category")
    final String category;
  
    @JsonKey(name : "image")
    final String image;
  
    @JsonKey(name : "rating")
    final RatingVO rating;

  ProductVO(this.id, this.title, this.price, this.description, this.category, this.image, this.rating);

  factory ProductVO.fromJson(Map<String,dynamic>json)=> _$ProductVOFromJson(json);
  
}