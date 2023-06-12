import 'dart:ui';

import 'package:drivers_app/global/global.dart';
import 'package:drivers_app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_database/firebase_database.dart';

class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({super.key});

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  
  String? selectedcartype;
  TextEditingController carmodelTextedtingController = TextEditingController();
  TextEditingController carnumberTextedtingController = TextEditingController();
  TextEditingController carcalorTextedtingController = TextEditingController();
  List<String> carTypelist = ["under_x", "under_go", "bike"];
  saveCarInfo(){
      Map drivercarInfoMap = {
        "car_color": carcalorTextedtingController.text.trim(),
        "car_number": carnumberTextedtingController.text.trim(),
        "car_model": carmodelTextedtingController.text.trim(),
        "type": selectedcartype,
      };
        DatabaseReference driversRef =
          FirebaseDatabase.instance.ref().child("driver");
      driversRef.child(currentFirebaseUser!.uid).child("car_details").set(drivercarInfoMap);
      // currentFirebaseUser = FirebaseUser;
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("car details has been saved.Congrarulations."),
          duration: Duration(seconds: 1),
         
        ),
      );
        
     
      Navigator.push(context, MaterialPageRoute(builder: (c)=>MySplashScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.network(
                  "https://th.bing.com/th/id/OIP.HyJD9gI5jXZyEqIZewRDnQHaDn?w=302&h=171&c=7&r=0&o=5&pid=1.7"),
            ),
            const Text(
              "Write Car Details",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: carmodelTextedtingController,
              style: const TextStyle(color: Colors.grey),
              decoration: const InputDecoration(
                labelText: "Name",
                hintText: "Name",
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
              controller: carnumberTextedtingController,
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
              controller: carcalorTextedtingController,
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.grey),
              decoration: const InputDecoration(
                labelText: "Phone Number",
                hintText: "Phone Number",
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
            const SizedBox(height: 10,),
            DropdownButton(
              iconSize: 26,
              dropdownColor: Colors.black,
              hint: const Text(
                "please chouse carType",
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
              value: selectedcartype,
              onChanged: (value) {
                setState(() {
                  selectedcartype = value.toString();
                });
              },
              items: carTypelist.map((car) {
                return DropdownMenuItem(
                    child: Text(
                      car,
                      style:  const TextStyle(color: Colors.grey),
                    ),
                    value: car,
                    );
              }).toList(),
            ),
          const SizedBox(height: 50,),
           ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () {
                 if(carcalorTextedtingController.text.isNotEmpty&&carmodelTextedtingController.text.isNotEmpty&&carnumberTextedtingController.text.isNotEmpty&&carTypelist!=null){
                  saveCarInfo();
                 }
                },
                child: const Text(
                  "Save Now",
                  style: TextStyle(color: Colors.black54,fontSize: 18),
                ))
          ]),
        ));
  }
}
