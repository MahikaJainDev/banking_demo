class TransactionsData {
  String? sTypename;
  DateTime? date;
  String? description;
  num? amount;
  String? fromAccount;
  String? toAccount;

  TransactionsData(
      {this.sTypename,
        this.date,
        this.description,
        this.amount,
        this.fromAccount,
        this.toAccount});

  TransactionsData.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    if(json['date'] != null){
      List<String> str = json['date'].split('-');
      date = DateTime(int.parse(str[0]), int.parse(str[1]), int.parse(str[2]));
    }
    description = json['description'];
    amount = json['amount'];
    fromAccount = json['fromAccount'];
    toAccount = json['toAccount'];
  }
}