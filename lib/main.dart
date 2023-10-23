import 'package:fake_store_api/data/model/fake_store_model.dart';
import 'package:fake_store_api/network/data_agent/fake_store_data_agent.dart';
import 'package:fake_store_api/network/data_agent/fake_store_data_agent_impl.dart';
import 'package:fake_store_api/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'data/model/fake_store_model_impl.dart';

void main() {
  runApp(const MyApp());

  FakeStoreDataAgent _data = FakeStoreDataAgentImpl();
  _data.getOneProduct(2).then((value) => print(value));
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