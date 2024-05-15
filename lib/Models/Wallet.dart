// -- wallet.dart --
import 'package:budget_planer/Models/BaseDefinition.dart';
import 'package:budget_planer/Models/WalletEntry.dart';

class Wallet extends BaseDefinition{
  List<WalletEntry>? entries;

  Wallet(id,ownerId,name,):super(id,ownerId,name){
    entries = List.empty();
  }
}