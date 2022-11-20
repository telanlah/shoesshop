import 'package:flutter/material.dart';
import 'package:shamo/models/category_model.dart';
import 'package:shamo/models/gallery_model.dart';

class ProductModel {
  int? id;
  late String name;
  late double price;
  late String description;
  String? tags;
  late CategoryModel category;
  DateTime? createdAt;
  DateTime? updatedAt;
  late List<GalleryModel> galleries;

  ProductModel(
      {this.id,
      required this.name,
      required this.price,
      required this.description,
      this.tags,
      required this.category,
      this.createdAt,
      this.updatedAt,
      required this.galleries});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    tags = json['tags'];
    category = CategoryModel.fromJson(json['category']);
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
    galleries = json['galleries']
        .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'category': category.toJson(),
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
      'galleries': galleries.map((gallery) => gallery.toJson()),
    };
  }
}

class UninitializedProductModel extends ProductModel {
  UninitializedProductModel(
      {String? name,
      String? price,
      String? description,
      String? category,
      String? galleries})
      : super(
            name: '',
            price: 0,
            description: '',
            category: CategoryModel(name: ''),
            galleries: []);
}
