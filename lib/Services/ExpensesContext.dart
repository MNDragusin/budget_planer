import 'dart:io';
import 'package:budget_planer/Models/Contexts/CategoryContext.dart';
import 'package:budget_planer/Models/Contexts/LabelsContext.dart';
import 'package:budget_planer/Models/Contexts/WalletEntryContext.dart';
import 'package:budget_planer/Models/Contexts/WalletsContext.dart';
import 'package:budget_planer/Services/IDataContext.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ExpensesContext extends IDataContext {
  Database? db;

  Future<void> init(String dbName) async {
    WidgetsFlutterBinding.ensureInitialized();

    try {
      var path = await getDatabasesPath();
      await Directory(path).create(recursive: true);

      path = join(path, dbName);
      db = await openDatabase(path);
    } catch (e) {
      print(e);
    }

    print('tables:');
    (await db?.query('sqlite_master', columns: ['type', 'name']))
        ?.forEach((row) {
      print(row.values);
    });

    //all of these should be injected
    wallets = WalletsContext(db);
    await wallets.preloadData();

    categories = CategoryContext(db);
    await categories.preloadData();

    labels = LabelsContext(db);
    await labels.preloadData();

    entries = WalletEntryContext(db);
  }
}
