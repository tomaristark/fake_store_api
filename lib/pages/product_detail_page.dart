 import 'package:fake_store_api/bloc/cart_bloc.dart';
import 'package:fake_store_api/bloc/detail_page_bloc.dart';
import 'package:fake_store_api/data/vos/product_vo/product_vo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProductDetailPage extends StatelessWidget {
   const ProductDetailPage({super.key, required this.id});

    final int  id;
   @override
   Widget build(BuildContext context) {
        return ChangeNotifierProvider<ProductDetailBloc>(
          create: (_)=>ProductDetailBloc(id),
          child: Scaffold(
          appBar: AppBar(
            title: const Text("Product"),
          ),
          body: Selector<ProductDetailBloc,ProductVO ?>(
            selector: (_,bloc)=> bloc.getOneProduct,
            builder: (_,value,__){
              if(value == null){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ProductDetailView(productVO: value,);
            })
          ),
        );
      }
 }

 class ProductDetailView extends StatelessWidget {
   const ProductDetailView({super.key, required this.productVO});

   final  ProductVO  productVO;
 
   @override
   Widget build(BuildContext context) {
     return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImageView(image: productVO.image),
                ProductPriceView(price: productVO.price),
                const ProductDetailHeadTextView(headText: "Description"),
                ProductDescriptionView(description: productVO.description ),
                const ProductDetailHeadTextView(headText: "Category"),
                ProductCategoryView(category: productVO.category,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ElevatedButton(onPressed: (){
                    final bloc = context.read<CartBloc>();
                    bloc.addToCart(productVO);
                  }, 
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(MediaQuery.of(context).size.width, 50)
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.yellow
                    )
                  ),
                  child: const Center(
                    child: Text("Buy",style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                    ),),
                  ),
                  ),
                )
              ],
            ),
          );
   }
 }


class ProductCategoryView extends StatelessWidget {
  const ProductCategoryView({super.key, required this.category});

  final String category;
  @override
  Widget build(BuildContext context) {
    return Text(category,
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500
    ) ,
    );
  }
}

 class ProductDescriptionView extends StatelessWidget {
  const ProductDescriptionView({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
      style: const TextStyle(fontWeight: FontWeight.w500),
    );
  }
}

class ProductPriceView extends StatelessWidget {
  const ProductPriceView({
    super.key,
    required this.price,
  });

  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding:const  EdgeInsets.symmetric(vertical: 15),
     child: Row(
       children: [
        const  Icon(
           Icons.monetization_on_outlined,
           size: 30,
         ),
         Padding(
           padding: const EdgeInsets.only(left: 20),
           child: Text(
             "${price} \$",
             style: const TextStyle(fontSize: 18),
           ),
         )
       ],
     ),
                );
  }
}

class ProductImageView extends StatelessWidget {
  const ProductImageView({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Image.network(
          image,
          // "https://www.bellobello.my/wp-content/uploads/2022/09/homegrown-food-product-brands-malaysia.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ProductDetailHeadTextView extends StatelessWidget {
  const ProductDetailHeadTextView({
    super.key, required this.headText,
  });
  final String headText;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:const EdgeInsets.symmetric(vertical: 5),
        child: Text(
          headText,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ));
  }
}


