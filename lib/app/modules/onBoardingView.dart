import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class onBoardingView extends StatefulWidget {
  const onBoardingView({super.key});

  @override
  State<onBoardingView> createState() => _onBoardingViewState();
}

class _onBoardingViewState extends State<onBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Stack(
                // alignment: ,
                ),
          ),
        ),
      ),
    );
  }
}
