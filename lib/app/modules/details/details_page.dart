import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/style/colors.dart';
import 'details_controller.dart';
import 'widgets/author_tile.dart';
import 'widgets/feature_tile.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({super.key, required this.slug});

  final String slug;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final controller = DetailsController();

  @override
  void initState() {
    super.initState();
    controller.getSubscriptionBySlug(context, widget.slug);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.isLoading,
      builder: (context, value, child) {
        if (value) {
          return const Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          appBar: appBar,
          body: body,
        );
      },
    );
  }

  PreferredSizeWidget get appBar => AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
        ),
        title: Text(
          controller.subscription.name,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: AppColors.primary,
      );

  Widget get body => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 108 / 64,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.network(
                    controller.subscription.imageLarge,
                    //fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.3),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.subscription.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          controller.subscription.shortDescription,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.info,
                    color: AppColors.secondary,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Sobre',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                controller.subscription.description,
                style: const TextStyle(
                  color: AppColors.defaultTextColor,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              color: AppColors.divider,
              height: 8,
              thickness: 8,
            ),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(
                    Icons.person_2,
                    color: AppColors.secondary,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Autores',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ListView.builder(
              itemCount: controller.subscription.authors.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final author = controller.subscription.authors[index];
                return AuthorTile(
                  author: author,
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              color: AppColors.divider,
              height: 8,
              thickness: 8,
            ),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(
                    Icons.star_rounded,
                    color: AppColors.secondary,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Recursos',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 170,
              child: ListView.builder(
                itemCount: controller.subscription.features.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final feature = controller.subscription.features[index];
                  return FeatureTile(
                    feature: feature,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      );
}
