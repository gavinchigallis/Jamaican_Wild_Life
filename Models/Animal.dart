import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Animal
{
    /*[Attributes]*/
    int id = 0;
    String name = "";
    int category = 0;
    String image = "";

    /*[Constructors]*/
    Animal();

    //JSON serialization
    Animal.fromJson(Map<String, dynamic> json):
        id = json['id'],
        name = json['name'],
        category = json['category'],
        image = json['image'];

    Map<String, dynamic> toJson() =>
    {
        'id': id,
        'name': name,
        'category': category,
        'image': image,
    };

    /*[Methods]*/
    int get getID{
        return this.id;
    }

}