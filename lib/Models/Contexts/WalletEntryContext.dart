import 'package:budget_planer/Models/Contexts/ITableContext.dart';

import '../WalletEntry.dart';

class WalletEntryContext extends ITableContext<WalletEntry>{

  WalletEntryContext(super.db);

  @override
  Future<WalletEntry> getByIdAsync(String id) {
    // TODO: implement getbyId
    throw UnimplementedError();
  }

  @override
  Future<WalletEntry> getByWalletId(String id) {
    // TODO: implement getByWalletId
    throw UnimplementedError();
  }

  @override
  Future<WalletEntry> addNew(WalletEntry newEntry) {
    // TODO: implement addNew
    throw UnimplementedError();
  }

  @override
  Future<List<WalletEntry>> getAllAsync() async {
    if(cache.isEmpty){
      await preloadData();
    }

    return cache;
  }

  @override
  Future<bool> remove(WalletEntry newEntry) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<WalletEntry> update(WalletEntry newEntry) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<void> preloadData() async{
    final List<Map<String, Object?>> entriesMap =
    //await db?.rawQuery("SELECT * FROM WalletEntries");
    await db!.query('WalletEntries');

    cache = [
        for (final {
        'EntryId': entryId as String,
        'Amount': amount as double,
        'CategoryId': categoryId as String,
        'Date': date as String,
        'LabelId': labelId as String,
        'WalletId': walletId as String
        } in entriesMap)
          WalletEntry(entryId, walletId, DateTime.parse(date), categoryId,
              labelId, amount)
      ];
  }

  @override
  WalletEntry getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  List<WalletEntry> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }
}