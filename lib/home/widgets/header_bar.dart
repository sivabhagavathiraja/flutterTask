import 'package:flutter/material.dart';
import 'package:flutter_task/app_theme.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    super.key,
    required this.theme,
  });

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.primary,
      height: MediaQuery.of(context).size.height * 0.4,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          _buildHeader(),
          const SizedBox(height: 18),
          _buildDivider(),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBalance("Cash balance", "\$384.87", false),
              _buildBalance("Metal holding", "\$22,265.64", true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$22,650.51",
              style: theme.headlineLarge!.copyWith(fontWeight: FontWeight.w500, color: AppTheme.white),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppTheme.primaryDark,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
                child: Row(
                  children: [
                    Text(
                      "0.97 %",
                      style: theme.bodyMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.change_history,
                      size: 16,
                      color: AppTheme.green,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Account value",
                style: theme.labelMedium!.copyWith(color: AppTheme.white),
              ),
              Text(
                "since last purchase",
                style: theme.bodySmall!.copyWith(color: AppTheme.white, fontSize: 10),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: .3,
      decoration: const BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );
  }

  Widget _buildBalance(String label, String value, bool forMetal) {
    return Column(
      crossAxisAlignment: forMetal ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.bodySmall!.copyWith(color: AppTheme.white),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Text(
              value,
              style: theme.headlineSmall!.copyWith(color: AppTheme.white, fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 4),
            forMetal ? const SizedBox.shrink() : const Icon(Icons.info_outline, color: AppTheme.white, size: 16),
          ],
        ),
      ],
    );
  }
}
