import 'package:drivers_app/global/global.dart';
import 'package:drivers_app/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileTabpage extends StatefulWidget {
  const ProfileTabpage({super.key});

  @override
  State<ProfileTabpage> createState() => _ProfileTabpageState();
}

class _ProfileTabpageState extends State<ProfileTabpage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("sign out"),
        onPressed: () {
          fAut.signOut();
           Navigator.push(
          context, MaterialPageRoute(builder: (c) => const MySplashScreen()));
        },
      ),
    );
  }
}
