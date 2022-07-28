// To parse this JSON data, do
//
//     final container = containerFromJson(jsonString);

import 'dart:convert';

MyContainerList myContainerListFromJson(String str) =>
    MyContainerList.fromJson(json.decode(str));

String myContainerListToJson(MyContainerList data) =>
    json.encode(data.toJson());

class MyContainerList {
  MyContainerList({
    required this.result,
  });

  List<MyContainer> result;

  factory MyContainerList.fromJson(Map<String, dynamic> json) =>
      MyContainerList(
        result: List<MyContainer>.from(
            json["result"].map((x) => MyContainer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class MyContainer {
  MyContainer({
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

  factory MyContainer.fromJson(Map<String, dynamic> json) => MyContainer(
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
