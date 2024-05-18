import 'package:budget_planer/Models/Contexts/ITableContext.dart';
import 'package:budget_planer/Models/Label.dart';

class LabelsContext extends ITableContext<Label> {
  LabelsContext(super.db);

  @override
  Future<Label> addNew(Label newEntry) {
    // TODO: implement addNew
    throw UnimplementedError();
  }

  @override
  Future<List<Label>> getAllAsync() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Label getById(String id) {
    return cache.firstWhere((element) => element.id == id);
  }

  @override
  Future<Label> getByIdAsync(String id) {
    // TODO: implement getByIdAsync
    throw UnimplementedError();
  }

  @override
  Future<Label> getByWalletId(String id) {
    // TODO: implement getByWalletId
    throw UnimplementedError();
  }

  @override
  Future<void> preloadData() async{
    final List<Map<String, Object?>> entriesMap = await db!.query('Labels');

    cache = [
      for (final {
      'Id': id as String,
      'OwnerId': ownerId as String,
      'Name': name as String
      } in entriesMap)
        Label(id, ownerId, name)
    ];
  }

  @override
  Future<bool> remove(Label newEntry) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<Label> update(Label newEntry) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  List<Label> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }
}