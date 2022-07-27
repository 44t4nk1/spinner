// To parse this JSON data, do
//
//     final container = containerFromJson(jsonString);

import 'dart:convert';

Container containerFromJson(String str) => Container.fromJson(json.decode(str));

String containerToJson(Container data) => json.encode(data.toJson());

class Container {
  Container({
    required this.id,
    required this.name,
    required this.image,
    required this.created,
    required this.port,
    required this.portType,
    required this.state,
    required this.status,
  });

  String id;
  String name;
  String image;
  int created;
  int port;
  String portType;
  String state;
  String status;

  factory Container.fromJson(Map<String, dynamic> json) => Container(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        created: json["created"],
        port: json["port"],
        portType: json["portType"],
        state: json["state"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "created": created,
        "port": port,
        "portType": portType,
        "state": state,
        "status": status,
      };
}
