import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../../../../core/config/color_constants.dart';
import '../../../../home/presentation/widgets/custom_appbar.dart';
import '../../bloc/otp/otp_bloc.dart';
import '../../widgets/custom_button.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  static const String routeName = '/verify';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const VerifyScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    String code = '';
    bool isVerified = false;
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
          'Back to Home',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: BlocConsumer<OtpBloc, OtpState>(listener: (context, state) {
            if(state is ErrorOtpState){
              isLoading = true;
            } else{
              isLoading = false;
            }
            if (state is UpdateOtpState) {
              if (state.isVerified != null) {
                isVerified = state.isVerified ?? false;
                if (isVerified) {
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: ColorConstants.errorSnackBar,
                      content: Text(
                        'Please, enter the valid otp',
                        style:
                            TextStyle(color: ColorConstants.errorSnackBarText),
                      ),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              }
            }
          }, builder: (context, state) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 48.h,
                  ),
                  Center(
                    child: Text(
                      'Please Verify Yourself',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 24.sp),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'We’ve send you verification email. Please check your email inbox and  follow the instructions properly. If you don’t received any email tap on “Resend” button.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  OTPTextField(
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 45.w,
                    style: Theme.of(context).textTheme.titleLarge!,
                    // textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.box,
                    contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
                    outlineBorderRadius: 12.r,

                    otpFieldStyle: OtpFieldStyle(
                        borderColor: Theme.of(context).primaryColor,
                        enabledBorderColor: Colors.black12,
                        disabledBorderColor: Theme.of(context).primaryColor,
                        focusBorderColor: Theme.of(context).primaryColor),
                    onChanged: (pin) {},
                    onCompleted: (pin) {
                      // do it here
                      context.read<OtpBloc>().add(UpdateOtpEvent(code: pin));
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomButton(
                    title: 'Submit',
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
                      context.read<OtpBloc>().add(ConfirmOtpEvent(context));
                    },
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SecondaryCustomButton(
                    title: 'Resend',
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
            );
          }),
        ),
      ),
    );
  }
}
