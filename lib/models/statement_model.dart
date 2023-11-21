class StatementsData {
  String? sTypename;
  DateTime? date;
  String? description;
  double? amount;

  StatementsData({this.sTypename, this.date, this.description, this.amount});

  StatementsData.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    if(json['date'] != null){
      List<String> str = json['date'].split('-');
      date = DateTime(int.parse(str[0]), int.parse(str[1]), int.parse(str[2]));
    }
    description = json['description'];
    amount = json['amount'];
  }
}