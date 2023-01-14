import 'package:flutter/material.dart';
import 'package:smstest/app/dependcy_injection.dart';
import 'package:smstest/presentaion/view_models/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var homeViewModel = dependencyInjection<HomeViewModel>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.getSms();
  }

  @override
  Widget build(BuildContext context) {
    homeViewModel.getSms();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TextField(),
            SingleChildScrollView(
              child: Column(),
            ),
          ],
        ),
      ),
    );
  }
}
