import 'package:flutter/material.dart';
import 'package:flutter_task/app_theme.dart';

class CardData {
  CardData({
    required this.title,
    required this.titleOZ,
    required this.precentage,
    required this.metalPrize,
    required this.charge,
    required this.prize,
    required this.color,
  });

  String title;
  String prize;
  String precentage;
  String titleOZ;
  String metalPrize;
  String charge;
  Color color;

  static List<CardData> cardDataList = <CardData>[
    CardData(
      title: "Gold",
      titleOZ: '11.050 oz',
      precentage: '0.97 %',
      metalPrize: '\$1,999.00',
      charge: '-0.4 %',
      prize: '\$22,265.64',
      color: AppTheme.gold,
    ),
    CardData(
      title: "Silver",
      titleOZ: '0.000 oz',
      precentage: '0.0 %',
      metalPrize: '\$26.20',
      charge: '-0.15 %',
      prize: '\$0.00',
      color: AppTheme.silver,
    ),
    CardData(
      title: "Platinum",
      titleOZ: '0.000 oz',
      precentage: '0.0 %',
      metalPrize: '\$1,102.30',
      charge: '-0.8 %',
      prize: '\$0.00',
      color: AppTheme.platinum,
    )
  ];
}
