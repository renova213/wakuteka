import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProductEntity extends Equatable {
  final UniqueKey uniqueKey;
  final String title;
  final List<String> image;
  final String description;
  final int price;
  final List<VariantProductEntity> variantProduct;

  const ProductEntity(
      {required this.uniqueKey,
      required this.description,
      required this.image,
      required this.price,
      required this.title,
      required this.variantProduct});

  @override
  List<Object> get props => [uniqueKey, description, image, price, title];
}

class VariantProductEntity extends Equatable {
  final String variantName;
  final String variantName2;
  final String titleVariant;
  final String titleVariant2;
  final int stock;
  final String image;
  final int price;

  const VariantProductEntity(
      {required this.variantName,
      required this.variantName2,
      required this.titleVariant,
      required this.titleVariant2,
      required this.stock,
      required this.image,
      required this.price});

  @override
  List<Object> get props => [
        variantName,
        variantName2,
        titleVariant,
        titleVariant2,
        stock,
        image,
        price
      ];
}
