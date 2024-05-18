import 'package:budget_planer/Models/Contexts/ITableContext.dart';
import 'package:budget_planer/Models/Wallet.dart';

class WalletsContext extends ITableContext<Wallet>{
  WalletsContext(super.db);

  @override
  Future<Wallet> addNew(Wallet newEntry) {
    // TODO: implement addNew
    throw UnimplementedError();
  }

  @override
  Future<List<Wallet>> getAllAsync() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Wallet getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<Wallet> getByIdAsync(String id) {
    // TODO: implement getByIdAsync
    throw UnimplementedError();
  }

  @override
  Future<Wallet> getByWalletId(String id) {
    // TODO: implement getByWalletId
    throw UnimplementedError();
  }

  @override
  Future<void> preloadData() async{
    final List<Map<String, Object?>> entriesMap = await db!.query('Wallets');

    cache = [
      for (final {
      'Id': id as String,
      'OwnerId': ownerId as String,
      'Name': name as String
      } in entriesMap)
        Wallet(id, ownerId, name)
    ];
  }

  @override
  Future<bool> remove(Wallet newEntry) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<Wallet> update(Wallet newEntry) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  List<Wallet> getAll() {
    return cache;
  }

}