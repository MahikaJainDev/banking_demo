class TransactionsData {
  String? _description;
  String? _fromAccount;
  String? _toAccount;
  DateTime? _date;
  num? _amount;

  TransactionsData.fromJson(Map<String, dynamic> json) {
    if(json['date'] != null){
      List<String> str = json['date'].split('-');
      _date = DateTime(int.parse(str[0]), int.parse(str[1]), int.parse(str[2]));
    }
    _description = json['description'];
    _amount = json['amount'];
    _fromAccount = json['fromAccount'];
    _toAccount = json['toAccount'];
  }
  String get getDescription => _description ?? '';
  String get getFromAccount => _fromAccount ?? '';
  String get getToAccount => _toAccount ?? '';
  num get getAmount => _amount ?? 0;
  DateTime get getDateTime => _date ?? DateTime.now();
}