import 'package:budget_planer/Models/Contexts/ITableContext.dart';

import '../Models/Category.dart';
import '../Models/Label.dart';
import '../Models/Wallet.dart';
import '../Models/WalletEntry.dart';

abstract class IDataContext{
  late ITableContext<WalletEntry> entries;
  late ITableContext<Category> categories;
  late ITableContext<Label> labels;
  late ITableContext<Wallet> wallets;
}