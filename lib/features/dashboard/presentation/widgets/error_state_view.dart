import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorStateView extends StatelessWidget {
  final String message;
  final Function() onRefresh;

  const ErrorStateView({
    super.key,
    required this.message,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: onRefresh,
            icon: const Icon(Icons.refresh),
          ),
          SizedBox(height: 8.0.h),
          Text(message, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}