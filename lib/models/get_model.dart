class GetModel {
  late bool important;
  late int number;
  late String title;
  late String description;
  late String time;
  GetModel.fromJson(Map<String, dynamic> json) {
    important = json["isImportant"];
    number = json["number"];
    title = json["title"];
    description = json["description"];
    time = json["time"];
  }
}
