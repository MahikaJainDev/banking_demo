class StatementsModel {
  String? sTypename;
  List<StatementsData>? statements;

  StatementsModel({this.sTypename, this.statements});

  StatementsModel.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    if (json['statements'] != null) {
      statements = <StatementsData>[];
      json['statements'].forEach((v) {
        statements!.add(new StatementsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    if (this.statements != null) {
      data['statements'] = this.statements!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['date'] = this.date;
    data['description'] = this.description;
    data['amount'] = this.amount;
    return data;
  }
}