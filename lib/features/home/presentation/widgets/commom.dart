import 'dart:ui';

import '../../../../common/app_theme/app_colors.dart';

class Category {
  final String content;
  final Color color;

  Category({
    required this.content,
    required this.color,
  });
}

class Metalic {
  final String content;
  final Color color;

  Metalic({
    required this.content,
    required this.color,
  });
}

class Block {
  final String content;
  final Color color;

  Block({
    required this.content,
    required this.color,
  });
}

List<Metalic> listMetalic = [
  Metalic(content: "Metal", color: AppColors.colorEFF18E),
  Metalic(content: "Metalloid", color: AppColors.colorB4F5C2),
  Metalic(content: "Nonmetal", color: AppColors.colorF1E8FB),
  Metalic(content: "Unknown Properties", color: AppColors.colorE7E7EA),
];
List<Block> listBlock = [
  Block(content: "s Block ", color: AppColors.color5A3EE3),
  Block(content: "d Block", color: AppColors.colorC4292E),
  Block(content: "f Block", color: AppColors.color113352),
  Block(content: "p Block", color: AppColors.color2163E7),
];

List<Category> listCate = [
  Category(
    content: 'Alkali Metals',
    color: AppColors.colorFBE8E7,
  ),
  Category(
    content: 'Alkali Earth Metals',
    color: AppColors.colorFEC5B2,
  ),
  Category(
    content: 'Transition Metals',
    color: AppColors.colorEFF18E,
  ),
  Category(
    content: 'Post Transition Metals',
    color: AppColors.colorB4F5C2,
  ),
  Category(
    content: 'Lanthanides',
    color: AppColors.colorFEBCD4,
  ),
  Category(
    content: 'Actinides',
    color: AppColors.colorFB84AF,
  ),
  Category(
    content: 'Metalloids',
    color: AppColors.colorFDF7E2,
  ),
  Category(
    content: 'Other Nonmetals',
    color: AppColors.colorBBC1E2,
  ),
  Category(
    content: 'Halogens',
    color: AppColors.color90DEFF,
  ),
  Category(
    content: 'Noble Gases',
    color: AppColors.colorF1E8FB,
  ),
  Category(
    content: 'Unknown Properties',
    color: AppColors.colorE7E7EA,
  ),
];
