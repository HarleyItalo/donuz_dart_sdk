import 'package:donuz_dart_sdk/donuz_dart_sdk.dart';
import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

late DonuzSDK donuzSDK;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  donuzSDK = DonuzSDK(
      client: http.Client(),
      config: DonuzConfig(donuzToken: '<YOUR TOKEN>', appId: '<YOUR APPID>'));
  await donuzSDK.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Donuz SDK',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Donuz SDK'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
                future: donuzSDK.establisment.findEstablishmentById(),
                builder: (context, snapshot) {
                  var establisment = snapshot.data;
                  return Column(
                    children: [
                      if (establisment?.logo != null)
                        Image.network(establisment!.logo!),
                      Text(
                        establisment?.estabelecimento ?? '',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
