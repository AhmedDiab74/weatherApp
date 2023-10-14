// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weatherapp/screens/home_page.dart';

class Forcast extends StatelessWidget {
  String? date;
  IconData? icon;
  String? minTemp;
  String? maxTemp;
  Color? white = Colors.white;

  Forcast({super.key, this.date, this.icon, this.minTemp, this.maxTemp});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListTile(
        trailing: Text(
          "$maxTemp / $minTemp",
          style: TextStyle(color: white, fontSize: 20),
        ),
        leading: SizedBox(
          height: double.infinity,
          child: Text("$date", style: TextStyle(color: white, fontSize: 20)),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const HomePage();
          }));
        },
        title: Container(
          alignment: Alignment.center,
          child: Icon(
            icon,
            size: 50,
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }
}
