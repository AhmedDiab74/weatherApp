import 'package:flutter/material.dart';
import 'package:weatherapp/components/home_page_component.dart';
import 'package:weatherapp/screens/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage(
                    ubdateUi: updateUi,
                  );
                }));
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: (const HomePageComponent()),
    );
  }
}
