import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.color,
    required this.height,
    required this.width,
    required this.style,
    this.icon,
    this.isLoading,
  });

  final Function() onTap;
  final String title;
  final String? icon;
  final Color color;
  final double height;
  final double width;
  final TextStyle style;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0.r),
        ),
        child: InkWell(
          onTap: onTap,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLoading == true
                  ? Padding(
                      padding: EdgeInsets.only(right: 8.0.w),
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : const Center(),
              Text(
                title,
                style: style,
              ),
              icon != null
                  ? Padding(
                      padding: EdgeInsets.only(left: 9.0.w),
                      child: SvgPicture.asset(
                        width: 42.22.w,
                        height: 20.h,
                        'assets/images/$icon',
                      ),
                    )
                  : const Center(),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondaryCustomButton extends StatelessWidget {
  const SecondaryCustomButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.color,
    required this.borderColor,
    required this.height,
    required this.width,
    required this.style,
    this.rightIcon,
    this.isLoading, this.leftIcon,
  });

  final Function() onTap;
  final String title;
  final Widget? rightIcon;
  final Widget? leftIcon;
  final Color color;
  final Color borderColor;
  final double height;
  final double width;
  final TextStyle style;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        color: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor, width: 1.w),
          borderRadius: BorderRadius.circular(8.0.r),
        ),
        child: InkWell(
          onTap: onTap,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLoading == true
                  ? Padding(
                      padding: EdgeInsets.only(right: 8.0.w),
                      child: CircularProgressIndicator(
                        color: Theme.of(context).indicatorColor,
                      ),
                    )
                  : const Center(),

              leftIcon ?? const Center(),
              SizedBox(width: 8.w,),
              Text(
                title,
                style: style,
              ),
              SizedBox(width: 8.w,),
              rightIcon ?? const Center(),
            ],
          ),
        ),
      ),
    );
  }
}
