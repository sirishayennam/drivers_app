import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EarningTabpage extends StatefulWidget {
  const EarningTabpage({super.key});

  @override
  State<EarningTabpage> createState() => _EarningTabpageState();
}

class _EarningTabpageState extends State<EarningTabpage> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Rating"),);
  }
}