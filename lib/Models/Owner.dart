// -- owner.dart --
import 'package:budget_planer/Models/Category.dart';
import 'package:budget_planer/Models/Label.dart';
import 'package:budget_planer/Models/Wallet.dart';

class Owner {
  String ownerId;
  String name;
  List<Wallet>? wallets;
  List<Category>? categories;
  List<Label>? labels;

  Owner(this.ownerId,this.name,this.wallets,this.categories,this.labels,);
}
