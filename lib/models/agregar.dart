import 'package:flutter/material.dart';

class Agregar {
  String title;
  String text;
  String id;

  Agregar({
    @required this.title,
    @required this.text,
    this.id,
  });

  Agregar.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    text = json['text'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['title'] = title;
    json['text'] = text;
    json['id'] = id;
    return json;
  }
}
