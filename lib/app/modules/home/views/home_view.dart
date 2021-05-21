import 'package:flutter/material.dart';
import 'package:helmet/app/common/utils/app_colors.dart';
import 'package:helmet/app/modules/home/views/product_screen.dart';

import 'drawer_home.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        child: Stack(
          children: [
            DrawerHome(),
            ProductScreen(),
          ],
        ),
      ),
    );
  }
}
