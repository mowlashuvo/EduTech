import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/config/color_constants.dart';
import '../../../../home/presentation/pages/home_screen.dart';
import '../../bloc/login/login_bloc.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/login_with_gmail_view.dart';
import '../forget_password/forget_password_screen.dart';
import '../registration/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 12.0.h,
                      right: 12.0.w,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    right: 100.w, left: 100.w, bottom: 24.h, top: 48.h),
                child: Material(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: const Color.fromRGBO(28, 28, 30, 0.12),
                          width: 1.0.w),
                      borderRadius: BorderRadius.circular(8.0.r)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 3.0.w, vertical: 3.0.h),
                    child: TabBar(
                      // controller: controller,
                      onTap: (index) {
                        // context
                        //     .read<PageViewBloc>()
                        //     .add(ChangePageViewEvent(index: index));
                      },
                      splashBorderRadius: BorderRadius.circular(8.0.r),
                      splashFactory: NoSplash.splashFactory,
                      indicator: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8.0.r),
                      ),
                      // labelColor: Colors.black,
                      // dividerColor: Colors.black,
                      unselectedLabelColor: ColorConstants.textColor,
                      unselectedLabelStyle:
                          Theme.of(context).textTheme.titleLarge,
                      labelStyle: Theme.of(context).textTheme.bodyLarge,
                      // ignore: prefer_const_literals_to_create_immutables
                      tabs: [
                        const Tab(
                          text: 'Login',
                        ),
                        const Tab(
                          text: 'Signup',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                      child: const LoginView(),
                    ),
                    SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                      child: const RegistrationView(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    bool isRememberMe = true;
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is ErrorLoginState) {
          isLoading = true;
          // ScaffoldMessenger.of(context).showSnackBar(
          //     const SnackBar(content: Text('Please wait')));
        } else {
          isLoading = false;
        }
        if (state is UpdateLoginState) {
          isRememberMe = state.isRememberMe ?? true;
        }
        return;
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
              'Login with Existing Account',
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
              preIcon: Icon(Icons.email_outlined,
                  color: Theme.of(context).primaryColor, size: 20.sp),
              onChanged: (value) {
                context.read<LoginBloc>().add(UpdateLoginEvent(email: value));
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextFormField(
              title: 'Password',
              hintText: 'password',
              error: false,
              isLast: true,
              preIcon: Icon(Icons.lock_outline_rounded,
                  color: Theme.of(context).primaryColor, size: 20.sp),
              onChanged: (value) {
                context
                    .read<LoginBloc>()
                    .add(UpdateLoginEvent(password: value));
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            Text('NB: password must be - At least 8 characters, one uppercase, one lowercase, one digit, one special character.', style: Theme.of(context).textTheme.bodySmall,),
            // Check if the password meets the following criteria:
            // - At least 8 characters long
            // - Contains at least one uppercase letter
            // - Contains at least one lowercase letter
            // - Contains at least one digit
            // - Contains at least one special character
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: Theme.of(context).primaryColor,
                      value: isRememberMe,
                      onChanged: (value) {
                        context
                            .read<LoginBloc>()
                            .add(UpdateLoginEvent(isRememberMe: value));
                      },
                    ),
                    // SizedBox(width: 5.w,),
                    Text(
                      'Remember Me',
                      style: GoogleFonts.outfit(
                        fontSize: 16.sp,
                        color: const Color.fromRGBO(28, 28, 30, 1),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Navigator.pushNamed(
                    //     context, ForgetPasswordScreen.routeName);
                  },
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.outfit(
                      fontSize: 18.sp,
                      color: const Color.fromRGBO(67, 54, 255, 1),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomButton(
              title: 'Sign In',
              height: 48.h,
              width: double.infinity,
              isLoading: BlocProvider.of<LoginBloc>(context).isFetching,
              color: Theme.of(context).primaryColor,
              style: GoogleFonts.outfit(
                fontSize: 18.sp,
                fontStyle: FontStyle.normal,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              onTap: () {
                context
                    .read<LoginBloc>()
                    .add(ConfirmLoginEvent(context: context, loginMethod: ''));
                // Navigator.popAndPushNamed(context, DashboardScreen.routeName);
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
