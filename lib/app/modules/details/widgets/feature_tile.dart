import 'package:flutter/material.dart';

import '../../../core/providers/subscriptions/data/entities/feature_entity.dart';
import '../../../core/style/colors.dart';

class FeatureTile extends StatelessWidget {
  const FeatureTile({super.key, required this.feature});
  final FeatureEntity feature;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      width: 300,
      child: Card(
        color: AppColors.surfaceColor,
        elevation: 0,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    feature.title,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    feature.description,
                    style: const TextStyle(
                      color: AppColors.defaultTextColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
