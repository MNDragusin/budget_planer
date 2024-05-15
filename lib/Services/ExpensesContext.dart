import 'package:budget_planer/Models/WalletEntry.dart';
import 'package:budget_planer/Services/IDataContext.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ExpensesContext extends IDataContext {
  Future<void> connectToDb(String dbName) async {
    WidgetsFlutterBinding.ensureInitialized();

    try{
      var path = join(await getDatabasesPath(), dbName);
      db = await openDatabase(path);
    }
    catch(e){
      print(e);
    }
  }

  Database? db;
  Future<List<WalletEntry>> getAllEntries() async {

    print('tables:');
    (await db?.query('sqlite_master', columns: ['type', 'name']))?.forEach((row) {
      print(row.values);
    });

    final List<Map<String, Object?>> entriesMap =
        //await db?.rawQuery("SELECT * FROM WalletEntries");
        await db!.query('WalletEntries');

    return [
      for (final {
            'EntryId': entryId as String,
            'Amount': amount as double,
            'CategoryId': categoryId as String,
            'Date': date as String,
            'LabelId': labelId as String,
            'WalletId': walletId as String
          } in entriesMap)
        WalletEntry(entryId, walletId, DateTime.parse(date), categoryId, labelId, amount)
    ];
  }
}
