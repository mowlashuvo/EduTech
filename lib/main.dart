import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/config/app_router.dart';
import 'core/config/theme.dart';
import 'core/simple_bloc_observer.dart';
import 'features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'features/authentication/data/repository/auth_repository_impl.dart';
import 'features/authentication/domain/usecases/auth_usecase.dart';
import 'features/authentication/presentation/bloc/login/login_bloc.dart';
import 'features/authentication/presentation/bloc/registration/registration_bloc.dart';
import 'features/authentication/presentation/bloc/show_hide_confirm_password/show_hide_confirm_password_bloc.dart';
import 'features/authentication/presentation/bloc/show_hide_password/show_hide_password_bloc.dart';
import 'features/dashboard/data/data_sources/enrolled_course_remote_data_source.dart';
import 'features/dashboard/data/repository/enrolled_course_repository_impl.dart';
import 'features/dashboard/domain/usecases/enrolled_course_use_case.dart';
import 'features/dashboard/presentation/bloc/enrolled_course/enrolled_course_bloc.dart';
import 'features/home/presentation/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'core/injection_container.dart';
import 'features/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Hive.initFlutter();
  await dotenv.load(fileName: "assets/.env");
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationBarBloc>(
          create: (context) => BottomNavigationBarBloc(),
        ),
        BlocProvider<ShowHidePasswordBloc>(
          create: (context) => ShowHidePasswordBloc()..add(HidePasswordEvent()),
        ),
        BlocProvider<ShowHideConfirmPasswordBloc>(
          create: (context) =>
          ShowHideConfirmPasswordBloc()..add(HideConfirmPasswordEvent()),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
            useCase: AuthUseCase(
              repository: AuthRepositoryImpl(
                remoteDataSource: AuthRemoteDataSourceImpl(),
              ),
            ),
          ),
        ),
        BlocProvider<EnrolledCourseBloc>(
          create: (context) => EnrolledCourseBloc(
            useCase: EnrolledCourseUseCase(
              repository: EnrolledCourseRepositoryImpl(
                remoteDataSource: EnrolledCourseRemoteDataSourceImpl(),
              ),
            ),
          ),
        ),
        BlocProvider<RegistrationBloc>(
          create: (context) => RegistrationBloc(
            useCase: AuthUseCase(
              repository: AuthRepositoryImpl(
                remoteDataSource: AuthRemoteDataSourceImpl(),
              ),
            ),
          ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 844),
        builder: (context, child) => MaterialApp(
          title: 'EduTech',
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
