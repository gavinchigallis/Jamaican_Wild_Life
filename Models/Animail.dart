import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Animail
{
    /*[Attributes]*/
    int id = 0;
    String name = "";
    int category = 0;
    //List<dynamic> contents = [];

    /*[Constructors]*/
    Animail();

    //JSON serialization
    Animail.fromJson(Map<String, dynamic> json):
        id = json['id'],
        name = json['name'],
        category = json['category'];

    Map<String, dynamic> toJson() =>
    {
        'id': id,
        'name': name,
        'category': category,
    };

    /*[Methods]*/
    int get getID{
        return this.id;
    }

}