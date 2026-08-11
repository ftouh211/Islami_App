import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SephaTab extends StatefulWidget {
  const SephaTab({super.key});

  @override
  State<SephaTab> createState() => _SephaTabState();
}

class _SephaTabState extends State<SephaTab> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/main_bg.png"),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Center(child: Text("SephaTab")),

          ),
          // body: Column(
          //
          // ),
        )
      ],
    );
  }
}
