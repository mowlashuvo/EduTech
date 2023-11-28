import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const Center(child: CircularProgressIndicator());
    return Center(
      child: Lottie.asset(
        height: 120.h,
        'assets/asset/loading.json',
        repeat: true,
        reverse: false,
        animate: true,
      ),
    );
  }
}