import 'package:budget_planer/Services/IDataContext.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ctx = GetIt.I<IDataContext>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ctx.entries.getAllAsync(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data?.length,
                prototypeItem: ListTile(
                  title: Text(snapshot.data!.first.amount.toString()),
                  subtitle: Text(snapshot.data!.first.date.toString()),
                ),
                itemBuilder: (context, index) {
                  return Scaffold(
                    body: ListTile(
                        title: Text(
                            snapshot.data![index].amount.toStringAsFixed(2)),
                        subtitle: Row(
                          children: [
                            SizedBox(
                                width: 100,
                                child: Text(DateFormat.yMMMd()
                                    .format(snapshot.data![index].date))),
                            SizedBox(width: 50),
                            SizedBox(
                                width: 100,
                                child: Text(ctx.categories
                                    .getById(snapshot.data![index].categoryId)
                                    .name)),
                            SizedBox(width: 50),
                            SizedBox(
                                width: 100,
                                child: Text(ctx.labels
                                    .getById(snapshot.data![index].labelId)
                                    .name)),
                            IconButton(
                                onPressed: () => {},
                                icon: const Icon(Icons.edit)),
                            IconButton(
                              onPressed: () => {},
                              icon: const Icon(Icons.delete),
                              color: Colors.red,
                            )
                          ],
                        )),
                  );
                });
          } else {
            return Center(child: const Text("Loading data"));
          }
        });
  }
}
