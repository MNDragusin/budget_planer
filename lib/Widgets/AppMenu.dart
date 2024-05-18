import 'package:budget_planer/Services/IDataContext.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AppMenu extends StatelessWidget{
  final ctx = GetIt.I<IDataContext>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu')),
      body: Container(
        width: 240,
        child: Column(
          // Note: use ListView.builder if there are many items
          children: <Widget>[
            // iterate through the keys to get the page names
            ListTile(
              title: const Text('Dashboard'),
            ),
            ListTile(
              title: const Text('Wallets'),
            ),
            for (var w in ctx.wallets.getAll())
              ListTile(
                title: Row(
                  children: [
                    SizedBox(width: 15),
                    Text(w.name),
                  ],
                ),
              ),
            ListTile(
              title: const Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}