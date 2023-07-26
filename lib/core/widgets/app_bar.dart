import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/widgets/custom_icon_button.dart';
import '../utils/navigator.dart';

PreferredSizeWidget defaultAppBar(
    {required BuildContext context, screen, title, isTitle}) {
  return AppBar(
    centerTitle: true,
    title: isTitle ??
        Text(
          title,
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: AppColors.green,
          ),
        ),
    leading: customIconButton(
        onTap: () {
          screen == null
              ? AppNavigator.pop(context: context)
              : AppNavigator.push(
                  context: context,
                  screen: screen,
                );
        },
        isIcon: true,
        icon: Icons.arrow_back_ios),
  );
}
