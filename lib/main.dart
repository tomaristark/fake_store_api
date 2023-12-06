import 'package:fake_store_api/bloc/cart_bloc.dart';
import 'package:fake_store_api/bloc/home_page_product_bloc.dart';
import 'package:fake_store_api/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(
    MultiProvider(providers:[
      ChangeNotifierProvider(create: (_)=> HomePageProductBloc()),
      ChangeNotifierProvider(create: (_)=> CartBloc()),
    ] ,
    child: const MyApp(),)
    );

  // FakeStoreModel _model = FakeStoreModelImpl();
  // _model.getAllProducts().then((value) => print(value));
  // FakeStoreDataAgent _data = FakeStoreDataAgentImpl();
  // _data.getOneProduct(1).then((value) => print(value));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}