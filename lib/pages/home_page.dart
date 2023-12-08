import 'package:fake_store_api/bloc/cart_bloc.dart';
import 'package:fake_store_api/bloc/home_page_product_bloc.dart';
import 'package:fake_store_api/data/vos/product_vo/product_vo.dart';
import 'package:fake_store_api/pages/cart_page.dart';
import 'package:fake_store_api/pages/product_detail_page.dart';
import 'package:fake_store_api/utils/extension/prefix_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/feature/random_color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CartBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Fake Store "),
          centerTitle: true,
          actions: [
            Badge(
                smallSize: 20,
                alignment: Alignment.topLeft,
                textColor: Colors.white,
                backgroundColor: Colors.red,
                label: (bloc.cartProducts.isEmpty)
                    ? const Text("0")
                    : Text("${bloc.cartProducts.length}"),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CartPage()));
                    },
                    icon: const Icon(Icons.shopping_cart)))
          ],
        ),
        body: Selector<HomePageProductBloc, List<ProductVO>?>(
            selector: (_, bloc) => bloc.getProducts,
            builder: (_, value, __) {
              if (value == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      productVO: value[index],
                    );
                  });
            }));
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productVO,
    this.hasRemove = false,
    this.onPressed,
  });

  final ProductVO? productVO;
  final bool hasRemove;
  final Function(ProductVO) ? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetailPage(id: productVO?.id ?? 0)));
        },
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: RandomColor.getRandomColor(),
          child: Text(
            productVO?.title.getPrefix() ?? "",
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        title: Text(productVO?.title ?? ""),
        titleTextStyle: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        subtitle: Text(
          productVO?.description ?? "",
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: (hasRemove)
            ? IconButton(
              onPressed:(){
                if(onPressed != null){
                  onPressed!(productVO!);
                }
            }, icon: const Icon(Icons.close))
            : null,
      ),
    );
  }
}
