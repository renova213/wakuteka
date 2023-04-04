import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class ProductModel extends ProductEntity {
  const ProductModel(
      {required super.uniqueKey,
      required super.description,
      required super.averageStar,
      required super.images,
      required super.price,
      required super.stock,
      required super.productName,
      required super.reviews,
      required super.variants});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      uniqueKey: UniqueKey(),
      description: json['description'],
      averageStar: double.parse(json['averageStar'].toString()),
      images:
          (json['images'] as List).map((e) => e["urlImage"] as String).toList(),
      price: json['price'],
      stock: json['stock'],
      productName: json['productName'],
      reviews: json['reviews'] != null
          ? (json['reviews'] as List)
              .map((e) => ReviewProductModel.fromJson(e))
              .toList()
          : [],
      variants: json['variants'] != null
          ? (json['variants'] as List)
              .map((e) => ProductVariantModel.fromJson(e))
              .toList()
          : []);
}

class ProductVariantModel extends ProductVariantEntity {
  const ProductVariantModel(
      {required super.variant,
      required super.subVariant,
      required super.titleVariant,
      required super.subTitleVariant,
      required super.stock,
      required super.image,
      required super.price});

  factory ProductVariantModel.fromJson(Map<String, dynamic> json) =>
      ProductVariantModel(
          variant: json['variant'],
          subVariant: json['subVariant'] ?? "",
          titleVariant: json['titleVariant'],
          subTitleVariant: json['subTitleVariant'] ?? "",
          stock: json['stock'],
          image: json['image']["urlImage"] ?? "",
          price: json['price']);
}

class ReviewProductModel extends ReviewProductEntity {
  const ReviewProductModel(
      {required super.userId,
      required super.imageProfile,
      required super.reviewerName,
      required super.review,
      required super.star});

  factory ReviewProductModel.fromJson(Map<String, dynamic> json) =>
      ReviewProductModel(
          userId: json['userId'],
          imageProfile: json['imageProfile'] ?? "",
          reviewerName: json['reviewerName'],
          review: json['review'],
          star: json['star']);
}
