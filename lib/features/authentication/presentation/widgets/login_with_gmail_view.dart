import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/login/login_bloc.dart';

class LoginWithGmailView extends StatelessWidget {
  const LoginWithGmailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Or, Login with',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Card(
          elevation: 0,
          color: Colors.white,
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0.r),
            ),
            onTap: () async {
              context
                  .read<LoginBloc>()
                  .add(ConfirmLoginEvent(context: context, loginMethod: 'google'));
            },
            child: SizedBox(
              height: 50.h,
              width: 50.w,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 10.0.h, horizontal: 10.0.w),
                child: SvgPicture.asset(
                  'assets/images/google.svg',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}