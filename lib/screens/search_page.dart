import 'package:flutter/material.dart';

import '../components/search_page_component.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  SearchPage({super.key, this.ubdateUi});
  VoidCallback? ubdateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SearchPageComponent(
        updateUi: ubdateUi,
      ),
    );
  }
}
