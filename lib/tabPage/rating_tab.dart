import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RatingTabpage extends StatefulWidget {
  const RatingTabpage({super.key});

  @override
  State<RatingTabpage> createState() => _RatingTabpageState();
}

class _RatingTabpageState extends State<RatingTabpage> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Ratting"),);
  }
}