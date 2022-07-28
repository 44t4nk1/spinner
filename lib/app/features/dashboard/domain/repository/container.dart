import 'package:dartz/dartz.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../data/container.dart';

class ContainerRepo {
  Future<Either<String, List<MyContainer>>> getContainers() async {
    var url = Uri.parse('https://spinner-backend.jugaldb.com/all');
    try {
      var response = await http.get(url);
      var resp = MyContainerList.fromJson(jsonDecode(response.body));
      return Right(resp.result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
