import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

abstract class ITableContext<T>{
    @protected
    Database? db;
    @protected
    List<T> cache = List.empty();

    ITableContext(this.db);

    Future<T> getByIdAsync(String id);
    T getById(String id);
    Future<T> getByWalletId(String id);
    List<T> getAll();
    Future<List<T>> getAllAsync();
    Future<T> addNew(T newEntry);
    Future<T> update(T newEntry);
    Future<bool> remove(T newEntry);
    Future<void> preloadData();
}