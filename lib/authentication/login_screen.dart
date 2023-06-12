import 'package:drivers_app/authentication/signup_Screen.dart';
import 'package:drivers_app/global/global.dart';
import 'package:drivers_app/splash_screen.dart';
import 'package:drivers_app/widgets/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextedtingController = TextEditingController();

  TextEditingController passwordTextedtingController = TextEditingController();
  validateForm() {
    if (!emailTextedtingController.text.contains("@")) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Email Address is Not Valied"),
        duration: Duration(seconds: 1),
      ));
    } else if (passwordTextedtingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("password is requried"),
        duration: Duration(seconds: 1),
      ));
    } else {
      loginDividerInfo();
    }
  }

  loginDividerInfo() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return ProgressDialog(
            message: "Processing, Please wait..",
          );
        });
    final User? firebaseUser = (await fAut
            .signInWithEmailAndPassword(
      email: emailTextedtingController.text.trim(),
      password: passwordTextedtingController.text.trim(),
    )
            .catchError((msg) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error:" + msg.toString()),
          duration: Duration(seconds: 1),
        ),
      );
    }))
        .user;
    if (firebaseUser != null) {
      currentFirebaseUser = firebaseUser;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Successful."),
          duration: Duration(seconds: 1),
        ),
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (c) => const MySplashScreen()));
    } else {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error Occourred during Login."),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.network(
                "https://th.bing.com/th/id/OIP.HyJD9gI5jXZyEqIZewRDnQHaDn?w=302&h=171&c=7&r=0&o=5&pid=1.7",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Login as a Driver",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: emailTextedtingController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.grey),
              decoration: const InputDecoration(
                labelText: "Email",
                hintText: "Email",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            TextField(
              controller: passwordTextedtingController,
              keyboardType: TextInputType.text,
              obscureText: true,
              style: const TextStyle(color: Colors.grey),
              decoration: const InputDecoration(
                labelText: "password",
                hintText: "Password",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () {
                  validateForm();
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpscreen()));
                },
                child: const Text(
                  "Donot have an Account? SignUp here",
                  style: TextStyle(color: Colors.grey),
                ))
          ],
        ),
      )),
    );
  }
}
