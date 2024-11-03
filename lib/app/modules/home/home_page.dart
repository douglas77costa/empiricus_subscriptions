import 'package:empiricus_subscriptions/app/modules/home/widgets/subscription_tile.dart';
import 'package:flutter/material.dart';

import '../../core/style/colors.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String name;

  HomePage({super.key, required this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    controller.getSubscriptions(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }

  PreferredSizeWidget get appBar => AppBar(
        leading: const Icon(
          Icons.person,
          color: Colors.white,
        ),
        title: Text(
          'Bem-vindo, ${widget.name}',
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: AppColors.primary,
      );

  Widget get body => ValueListenableBuilder(
        valueListenable: controller.isLoading,
        builder: (context, value, child) {
          if (value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.only(
              top: 16,
              left: 8,
              right: 8,
              bottom: 16,
            ),
            itemCount: controller.subscriptions.length,
            itemBuilder: (context, index) {
              final subscription = controller.subscriptions[index];
              return SubscriptionTile(subscription: subscription);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: AppColors.defaultTextColor.withOpacity(0.2),
              );
            },
          );
        },
      );
}
