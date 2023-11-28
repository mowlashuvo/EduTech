import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/config/color_constants.dart';
import '../../bloc/registration/registration_bloc.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/login_with_gmail_view.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dropdownvalue = 'Item 1';
    String role = 'Select';

    // List of items in our dropdown menu
    var items = [
      'Student',
      'Housewife',
      'Entrepreneur',
      'Job Holder',
      'Businessman',
    ];

    bool isAgree = true;
    return BlocConsumer<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if (state is UpdateRegistrationState) {
          isAgree = state.isAgree ?? true;
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: 32.h,
            // ),
            // Center(
            //   child: Image(
            //     height: 56.h,
            //     width: 189.w,
            //     image: const AssetImage('assets/images/logo.jpeg'),
            //   ),
            // ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Signup with Email Address',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextFormField(
              title: 'Name',
              hintText: 'Full Name',
              error: false,
              preIcon: Icon(Icons.person_4_outlined,
                  color: Theme.of(context).primaryColor, size: 20.sp),
              onChanged: (value) {
                context
                    .read<RegistrationBloc>()
                    .add(UpdateRegistrationEvent(name: value));
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextFormField(
              title: 'Email',
              hintText: 'email address',
              error: false,
              preIcon: Icon(Icons.email_outlined,
                  color: Theme.of(context).primaryColor, size: 20.sp),
              onChanged: (value) {
                context
                    .read<RegistrationBloc>()
                    .add(UpdateRegistrationEvent(email: value));
              },
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'Minimum 8 Character.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextFormField(
              title: 'Password',
              hintText: 'password',
              error: false,
              isLast: false,
              preIcon: Icon(Icons.lock_outline_rounded,
                  color: Theme.of(context).primaryColor, size: 20.sp),
              onChanged: (value) {
                context
                    .read<RegistrationBloc>()
                    .add(UpdateRegistrationEvent(password: value));
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomConfirmPasswordField(
              title: 'Confirm Password',
              hintText: 'confirm password',
              // error: !isValidConfirmPassword,
              error: false,
              preIcon: Icon(Icons.lock_outline_rounded,
                  color: Theme.of(context).primaryColor, size: 20.sp),
              onChanged: (value) {
                context
                    .read<RegistrationBloc>()
                    .add(UpdateRegistrationEvent(confirmPassword: value));
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Theme.of(context).primaryColor,
                  value: isAgree,
                  onChanged: (value) {
                    context
                        .read<RegistrationBloc>()
                        .add(UpdateRegistrationEvent(isAgree: value));
                  },
                ),
                // SizedBox(width: 5.w,),
                Text(
                  'I\'m agree with the ',
                  style: GoogleFonts.outfit(
                    fontSize: 16.sp,
                    color: const Color.fromRGBO(28, 28, 30, 1),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'terms & conditions.',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomButton(
              title: 'Signup',
              height: 48.h,
              width: double.infinity,
              isLoading: false,
              color: Theme.of(context).primaryColor,
              style: GoogleFonts.outfit(
                fontSize: 18.sp,
                fontStyle: FontStyle.normal,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              onTap: () {
                // Navigator.pushNamed(context, VerifyScreen.routeName);
                // if (isValidName && isValidEmail && isValidPassword && isValidConfirmPassword) {
                if (isAgree) {
                  context
                      .read<RegistrationBloc>()
                      .add(ConfirmRegistrationEvent(context: context));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: ColorConstants.errorSnackBar,
                      content: Text(
                        'Please, agree with the terms and conditions',
                        style:
                            TextStyle(color: ColorConstants.errorSnackBarText),
                      ),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }

                // context.read<OtpBloc>().add(UpdateOtpEvent(email: 'mowlashuvo2@gmail.com'));
                // Navigator.pushNamed(context, VerifyScreen.routeName, arguments: {});
                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(
                //       backgroundColor: ColorConstants.errorSnackBar,
                //       content: Text(
                //         'Please, provide the information',
                //         style:
                //         TextStyle(color: ColorConstants.errorSnackBarText),
                //       ),
                //       duration: Duration(seconds: 2),
                //     ),
                //   );
                // }
              },
            ),
            SizedBox(
              height: 24.h,
            ),
            const LoginWithGmailView(),
            SizedBox(
              height: 20.h,
            ),
          ],
        );
      },
    );
  }
}
