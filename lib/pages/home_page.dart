
import 'package:fake_store_api/data/model/fake_store_model.dart';
import 'package:fake_store_api/data/model/fake_store_model_impl.dart';
import 'package:fake_store_api/data/vos/product_vo/product_vo.dart';
import 'package:fake_store_api/pages/product_detail_page.dart';
import 'package:fake_store_api/utils/extension/prefix_extension.dart';
import 'package:flutter/material.dart';

import '../utils/feature/random_color.dart';

FakeStoreModel _products = FakeStoreModelImpl();
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fake Store "),
       centerTitle: true,
      ),
      body: FutureBuilder(
        future: _products.getAllProducts() ,
         builder: (context,snapShot){
          if(snapShot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(snapShot.hasError){
            return Center(child: Text("${snapShot.error}"),);
          }
          final result = snapShot.data;
          return ListView.builder(
            itemCount: result?.length,
            itemBuilder: (context,index){
              return ProductCard(productVO: result?[index],

              );
            });
         })
      );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.productVO, 
  });

  final ProductVO ? productVO;


  @override
  Widget build(BuildContext context) {
    return Card(
      child:ListTile(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDetailPage(id: productVO?.id ?? 0)));
        },
        contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          leading: CircleAvatar(
         radius: 25,
       backgroundColor: RandomColor.getRandomColor() ,
    child: Text(productVO?.title.getPrefix() ?? "",style: const TextStyle(
      fontSize: 20,
      color: Colors.white
    ),),

          ),
          title: Text(productVO?.title ?? ""),
          titleTextStyle: const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize:20
          ),
          subtitle:Text(productVO?.description??"",
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          ),
          ) ,
    );
  }
}