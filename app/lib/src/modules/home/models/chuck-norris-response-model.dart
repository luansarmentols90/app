class ChuckNorrisResponseModel {
  List<String>? categories;
  String? createdAt;
  String? iconUrl;
  int? id;
  String? updatedAt;
  String? url;
  String? value;

  ChuckNorrisResponseModel(
      {this.categories,
        this.createdAt,
        this.iconUrl,
        this.id = 1,
        this.updatedAt,
        this.url,
        this.value});

  ChuckNorrisResponseModel.fromJson(Map<dynamic, dynamic> json) {
    //categories = json['categories']!.cast<String>();
    createdAt = json['created_at'];
    iconUrl = json['icon_url'];
    id = 1;
    updatedAt = json['updated_at'];
    url = json['url'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories'] = this.categories;
    data['created_at'] = this.createdAt;
    data['icon_url'] = this.iconUrl;
    data['id'] = 1;
    data['updated_at'] = this.updatedAt;
    data['url'] = this.url;
    data['value'] = this.value;
    return data;
  }
}