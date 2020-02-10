import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Animal
{
    /*[Attributes]*/
    int id = 0;
    String name = "";
    int category_id = 0;
    String image = "";

    /*[Constructors]*/
    Animal();

    //JSON serialization
    Animal.fromJson(Map<String, dynamic> json):
        id = json['id'],
        name = json['name'],
        category_id = json['category_id'],
        image = json['image'];

    Map<String, dynamic> toJson() =>
    {
        'id': id,
        'name': name,
        'category_id': category_id,
        'image': image,
    };

    /*[Methods]*/
    int get getID{
        return this.id;
    }

}