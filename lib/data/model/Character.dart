// ignore_for_file: file_names

class Character {
  late int charId;
  late String name;
  late String status;
  late String spiecies;
  late String gender;
  late Map<String, dynamic> location;
  late String img;

  Character.fromJson(Map<String, dynamic> json) {
    charId = json['id'];
    name = json['name'];
    status = json['status'];
    spiecies = json['species'];
    gender = json['gender'];
    location = json['location'];
    img = json['image'];
  }
}
