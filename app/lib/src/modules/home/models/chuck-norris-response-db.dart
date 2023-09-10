class Answer {
  int? id;
  String? text;

  Answer({this.id, this.text});

  Answer.fromJson(var json) {
    id = json['id'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    return data;
  }
}