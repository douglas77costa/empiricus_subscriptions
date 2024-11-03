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
      appBar: AppBar(
        leading: const Icon(
          Icons.person,
          color: Colors.white,
        ),
        title: Text(
          'Bem-vindo, ${widget.name}',
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: ValueListenableBuilder(
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
              final item = controller.subscriptions[index];
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(item.imageSmall),
                ),
                title: Text(item.name),
                subtitle: Text(
                  item.shortDescription,
                  style: const TextStyle(color: AppColors.defaultTextColor),
                ),
                isThreeLine: true,
                trailing: const Icon(
                  Icons.chevron_right,
                  color: AppColors.defaultTextColor,
                ),
                onTap: () {},
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: AppColors.defaultTextColor.withOpacity(0.2),
              );
            },
          );
        },
      ),
    );
  }
}
