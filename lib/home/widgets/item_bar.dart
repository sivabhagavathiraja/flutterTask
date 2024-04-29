import 'package:flutter/material.dart';
import 'package:flutter_task/app_theme.dart';
import 'package:flutter_task/home/model/card_data.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.theme,
  });

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: CardData.cardDataList.map((cardData) {
        return buildCard(context, cardData);
      }).toList(),
    );
  }

  Widget buildCard(BuildContext context, CardData cardData) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: <BoxShadow>[
          BoxShadow(color: AppTheme.gray.withOpacity(0.6), offset: const Offset(1.1, 1.1), blurRadius: 10.0),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildIconAndText(cardData),
              buildTotalText(cardData),
            ],
          ),
          _buildDividerRow(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBalance(cardData, true),
              _buildBalance(cardData, false),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildIconAndText(CardData data) {
    return Row(
      children: [
        Material(
          color: Colors.white,
          child: Ink(
            decoration: ShapeDecoration(
              color: data.color.withOpacity(0.3),
              shape: const CircleBorder(),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.attach_money,
                size: 26,
                color: data.color,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.title,
              style: theme.titleMedium!.copyWith(color: data.color, fontWeight: FontWeight.w900, fontSize: 20),
            ),
            Text(
              data.titleOZ,
              style: theme.bodySmall!.copyWith(fontSize: 10, fontWeight: FontWeight.w700, color: AppTheme.gray),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildTotalText(CardData data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          data.prize,
          style: theme.titleMedium!.copyWith(fontWeight: FontWeight.w900),
        ),
        Text(
          data.precentage,
          style: theme.bodySmall!.copyWith(fontWeight: FontWeight.w700, color: AppTheme.gray),
        ),
      ],
    );
  }

  Widget _buildDividerRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8),
      child: Container(
        height: 2,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    );
  }

  Widget _buildBalance(CardData data, bool forMetal) {
    return Column(
      crossAxisAlignment: forMetal ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Text(
          forMetal ? "Metal prize" : "Charges",
          style: theme.bodySmall,
        ),
        const SizedBox(height: 3),
        Row(
          children: [
            Text(
              forMetal ? data.metalPrize : data.charge,
              style: theme.titleSmall!.copyWith(color: forMetal ? Colors.black : Colors.red),
            ),
          ],
        ),
      ],
    );
  }
}
