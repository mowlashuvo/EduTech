import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../home/presentation/widgets/custom_appbar.dart';
import '../../bloc/forget_password/forget_password_bloc.dart';
import '../../bloc/login/login_bloc.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../reset_password/verify_reset_password_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  static const String routeName = '/forget_password';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ForgetPasswordScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
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
          'Back',
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
            child: BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
              listener: (context, state) {
                if (state is ErrorForgetPasswordState) {
                  isLoading = true;
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(content: Text('Please wait')));
                } else {
                  isLoading = false;
                }
                return;
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 48.h,
                    ),
                    Center(
                      child: Text(
                        'Forget Password',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 24.sp),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'Enter your account email address',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormField(
                      title: 'Email',
                      hintText: 'email address',
                      error: false,
                      preIcon: Icon(Icons.email_outlined, color: Theme.of(context).primaryColor, size: 20.sp),
                      onChanged: (value) {
                        context.read<LoginBloc>().add(UpdateLoginEvent(email: value));
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomButton(
                      title: 'Continue',
                      height: 48.h,
                      width: double.infinity,
                      isLoading: isLoading,
                      color: Theme.of(context).primaryColor,
                      style: GoogleFonts.outfit(
                        fontSize: 18.sp,
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, VerifyResetPasswordScreen.routeName);
                      },
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
