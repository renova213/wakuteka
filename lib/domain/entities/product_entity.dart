import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProductEntity extends Equatable {
  final UniqueKey uniqueKey;
  final String productName;
  final List<String> images;
  final String description;
  final int price;
  final int stock;
  final double averageStar;
  final List<ReviewProductEntity> reviews;
  final List<ProductVariantEntity> variants;

  const ProductEntity(
      {required this.uniqueKey,
      required this.description,
      required this.averageStar,
      required this.images,
      required this.price,
      required this.stock,
      required this.productName,
      required this.reviews,
      required this.variants});

  @override
  List<Object> get props =>
      [uniqueKey, description, images, price, productName, variants, reviews];
}

class ProductVariantEntity extends Equatable {
  final String variant;
  final String subVariant;
  final String titleVariant;
  final String subTitleVariant;
  final int stock;
  final String image;
  final int price;

  const ProductVariantEntity(
      {required this.variant,
      required this.subVariant,
      required this.titleVariant,
      required this.subTitleVariant,
      required this.stock,
      required this.image,
      required this.price});

  @override
  List<Object> get props =>
      [variant, subVariant, titleVariant, subTitleVariant, stock, image, price];
}

class ReviewProductEntity extends Equatable {
  final String userId;
  final String imageProfile;
  final String reviewerName;
  final String review;
  final double star;

  const ReviewProductEntity(
      {required this.userId,
      required this.imageProfile,
      required this.reviewerName,
      required this.review,
      required this.star});

  @override
  List<Object?> get props => throw UnimplementedError();
}
