class TransactionsModel {
  String? sTypename;
  List<TransactionsData>? transactions;

  TransactionsModel({this.sTypename, this.transactions});

  TransactionsModel.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    if (json['transactions'] != null) {
      transactions = <TransactionsData>[];
      json['transactions'].forEach((v) {
        transactions!.add(new TransactionsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TransactionsData {
  String? sTypename;
  String? date;
  String? description;
  double? amount;
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
    date = json['date'];
    description = json['description'];
    amount = json['amount'];
    fromAccount = json['fromAccount'];
    toAccount = json['toAccount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['date'] = this.date;
    data['description'] = this.description;
    data['amount'] = this.amount;
    data['fromAccount'] = this.fromAccount;
    data['toAccount'] = this.toAccount;
    return data;
  }
}