import 'package:flutter/material.dart';

import '../../../core/providers/subscriptions/data/entities/author_entity.dart';
import '../../../core/style/colors.dart';

class AuthorTile extends StatelessWidget {
  const AuthorTile({super.key, required this.author});
  final AuthorEntity author;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            author.name,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 16,
            ),
          ),
          author.description.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Text(
                    author.description,
                    style: const TextStyle(
                      color: AppColors.defaultTextColor,
                      fontSize: 12,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          const SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
