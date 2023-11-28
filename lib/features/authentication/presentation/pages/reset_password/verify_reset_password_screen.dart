import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../home/presentation/widgets/custom_appbar.dart';
import '../../widgets/custom_button.dart';
import 'reset_password_screen.dart';

class VerifyResetPasswordScreen extends StatelessWidget {
  const VerifyResetPasswordScreen({Key? key}) : super(key: key);

  static const String routeName = '/verify_reset_password';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const VerifyResetPasswordScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed:  () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back,
              color: Color.fromRGBO(28, 28, 30, 0.54)),
        ),
        title: Text(
          'Back to Home',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 48.h,
                ),
                Center(
                  child: Text(
                    'We’ve send you password reset email',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 24.sp),
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  'Please check your email inbox and  follow the instructions properly. If you don’t received any email tap on “Resend” button.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomButton(
                  title: 'Resend',
                  height: 48.h,
                  width: double.infinity,
                  color: Theme.of(context).primaryColor,
                  style: GoogleFonts.outfit(
                    fontSize: 18.sp,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, ResetPasswordScreen.routeName, arguments: '123');
                  },
                ),
                SizedBox(
                  height: 8.h,
                ),
                SecondaryCustomButton(
                  title: 'Back To Home',
                  height: 60.h,
                  width: double.infinity,
                  color: Colors.white,
                  borderColor: const Color.fromRGBO(28, 28, 30, 0.12),
                  style: GoogleFonts.outfit(
                    fontSize: 18.sp,
                    fontStyle: FontStyle.normal,
                    color: const Color.fromRGBO(28, 28, 30, 0.54),
                    fontWeight: FontWeight.w600,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
