import 'package:flutter/material.dart';

import 'AppMenu.dart';
import 'MainPage.dart';

class SplitView extends StatelessWidget {
  static const threshold = 600.0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < threshold) {
      return singleView(context);
    }

    return splitView(context);
  }

  Widget splitView(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(width: 240, child: AppMenu()),
          Container(width: 0.5, color: Colors.black),
          SizedBox(
              width: MediaQuery.of(context).size.width - 240.5,
              child: MainPage())
        ],
      ),
      floatingActionButton: FloatingAddButton(),
    );
  }

  Widget singleView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('widget.title'),
      ),
      drawer: SizedBox(
        width: 240,
        child: AppMenu(),
      ),
      body: MainPage(),
      floatingActionButton:
          FloatingAddButton(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget FloatingAddButton() {
    return FloatingActionButton(
        onPressed: () => {}, child: const Icon(Icons.add));
  }
}
