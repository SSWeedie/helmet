import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:helmet/app/common/utils/app_colors.dart';
import 'package:helmet/app/common/utils/app_theme.dart';
import 'package:helmet/app/data/data.dart';

class DrawerHome extends StatefulWidget {
  const DrawerHome({Key key}) : super(key: key);

  @override
  _DrawerHomeState createState() => _DrawerHomeState();
}

class _DrawerHomeState extends State<DrawerHome> {
  AppStyle _appStyle;
  int _menuSelected = 0;

  @override
  void didChangeDependencies() {
    _appStyle = AppStyle.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.primaryColor,
        child: Column(
          children: [
            _buildProfile(),
            _buildMenu(),
            _buildMoreAction(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfile() => Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.colorWhite,
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Miroslava Savitskaya',
                  style: _appStyle.defaultTextBoldStyle(
                    color: AppColors.colorWhite,
                    size: 18,
                  ),
                ),
                Text(
                  'Active status',
                  style: _appStyle.defaultTextStyle(
                    color: AppColors.colorWhite,
                    size: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _buildMenu() => Expanded(
        child: Center(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final item = menu[index];
              return Material(
                color: AppColors.primaryColor,
                child: InkWell(
                  onTap: () async {},
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: _buildContentItemMenu(index),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
            itemCount: menu.length,
          ),
        ),
      );

  Widget _buildContentItemMenu(int index) {
    final item = menu[index];
    return Row(
      children: [
        item.icon != null
            ? Icon(
                item.icon,
                color: _menuSelected == index
                    ? AppColors.colorWhite
                    : AppColors.colorWhiteFA.withOpacity(0.7),
              )
            : Container(),
        SizedBox(
          width: item.icon != null ? 16 : 0,
        ),
        Expanded(
          child: Text(
            item.label,
            style: _appStyle.defaultTextBoldStyle(
              color: _menuSelected == index
                  ? AppColors.colorWhite
                  : AppColors.colorWhiteFA.withOpacity(0.7),
              size: 18,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildMoreAction() => Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              FontAwesome5Solid.cog,
              color: AppColors.colorWhiteFA.withOpacity(0.7),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              'Setting',
              style: _appStyle.defaultTextBoldStyle(
                color: AppColors.colorWhiteFA.withOpacity(0.7),
                size: 18,
              ),
            ),
            Container(
              width: 1,
              height: 20,
              color: AppColors.colorWhiteFA.withOpacity(0.7),
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),
            Text(
              'Log out',
              style: _appStyle.defaultTextBoldStyle(
                color: AppColors.colorWhiteFA.withOpacity(0.7),
                size: 18,
              ),
            ),
          ],
        ),
      );
}
