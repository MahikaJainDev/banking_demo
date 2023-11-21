class StatementData {
  DateTime? _date;
  String? _description;
  num? _amount;

  StatementData.fromJson(Map<String, dynamic> json) {
    if(json['date'] != null){
      List<String> str = json['date'].split('-');
      _date = DateTime(int.parse(str[0]), int.parse(str[1]), int.parse(str[2]));
    }
    _description = json['description'];
    _amount = json['amount'];
  }

  String get getDescription => _description ?? '';
  num get getAmount => _amount ?? 0.0;
  DateTime get getDateTime => _date ?? DateTime.now();
}