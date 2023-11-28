import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  const CustomAppBar({Key? key, this.leading, this.title, this.actions, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
      elevation: 0,
      leading: leading,
      title: title,
      centerTitle: false,
      iconTheme: IconThemeData(color: Theme.of(context).cardColor),
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(65.0.h);

}
