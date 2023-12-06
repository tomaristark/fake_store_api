import 'package:fake_store_api/bloc/cart_bloc.dart';
import 'package:fake_store_api/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CartBloc>();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Cart Page"),
        ),
        body: ListView.builder(
            itemCount: bloc.cartProducts.length,
            itemBuilder: (context, index) {
              return ProductCard(productVO: bloc.cartProducts[index]);
            }));
  }
}
