// -- wallet_entry.dart --
class WalletEntry {
  String entryId;
  DateTime date;
  String walletId;
  String categoryId;
  String labelId;
  double amount;

  WalletEntry(this.entryId,this.walletId,this.date,this.categoryId,this.labelId,this.amount);
}