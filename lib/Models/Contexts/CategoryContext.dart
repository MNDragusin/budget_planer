import 'package:budget_planer/Models/Category.dart';
import 'package:budget_planer/Models/Contexts/ITableContext.dart';

class CategoryContext extends ITableContext<Category>{
  CategoryContext(super.db);

  @override
  Future<Category> addNew(Category newEntry) {
    // TODO: implement addNew
    throw UnimplementedError();
  }

  @override
  Future<List<Category>> getAllAsync() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Category> getByIdAsync(String id) {
    // TODO: implement getByIdAsync
    throw UnimplementedError();
  }
  @override
  Category getById(String id) {
    return cache.firstWhere((element) => element.id == id);
  }

  @override
  Future<Category> getByWalletId(String id) {
    // TODO: implement getByWalletId
    throw UnimplementedError();
  }

  @override
  Future<bool> remove(Category newEntry) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<Category> update(Category newEntry) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<void> preloadData() async {
    final List<Map<String, Object?>> entriesMap = await db!.query('Categories');

    cache = [
      for (final {
      'Id': id as String,
      'OwnerId': ownerId as String,
      'Name': name as String
      } in entriesMap)
        Category(id, ownerId, name)
    ];
  }

  @override
  List<Category> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }
}