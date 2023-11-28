import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../core/config/constant.dart';
import '../../domain/entities/enrolled_course_entity.dart';
import '../bloc/enrolled_course/enrolled_course_bloc.dart';
import '../widgets/error_state_view.dart';
import '../widgets/loading_widget.dart';
import '../widgets/no_product_view.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  static const String routeName = '/dashboard';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const DashboardScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.read<EnrolledCourseBloc>().add(EnrolledCourseLoadEvent());
    final box = GetStorage();
    String? token = box.read(Constant.apiToken);
    String? role = box.read(Constant.role);
    List<EnrolledCourseDataEntity> productItem = [];
    Future<bool> onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                'Are you sure?',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              content: Text('Do you want to exit an App',
                  style: Theme.of(context).textTheme.displaySmall),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('No',
                      style: Theme.of(context).textTheme.displaySmall),
                ),
                TextButton(
                  onPressed: () => SystemNavigator.pop(),
                  child: Text('Yes',
                      style: Theme.of(context).textTheme.displaySmall),
                ),
              ],
            ),
          )) ??
          false;
    }

    return SafeArea(
      child: WillPopScope(
        onWillPop: onWillPop,
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<EnrolledCourseBloc>().add(EnrolledCourseLoadEvent());
          },
          child: Column(
            children: [
              SizedBox(height: 16.h,),
              Text('Enrolled Course', style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: 16.h,),
              Expanded(
                child: BlocBuilder<EnrolledCourseBloc, EnrolledCourseState>(
                  builder: (context, state) {
                    if (state is EnrolledCourseLoadingState) {
                      return const LoadingWidget();
                    } else if (state is EnrolledCourseSuccessState) {
                      productItem.clear();
                      productItem.addAll(state.courses);
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    } else if (state is EnrolledCourseErrorState &&
                        productItem.isEmpty) {
                      return ErrorStateView(
                        message: state.error,
                        onRefresh: () {
                          context
                              .read<EnrolledCourseBloc>()
                              .add(EnrolledCourseLoadEvent());
                        },
                      );
                    }
                    if (productItem.isNotEmpty) {
                      return GridView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0.w,
                          // vertical: 10.0.h,
                        ),
                        itemCount: productItem.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0.w,
                            mainAxisSpacing: 8.0.h,
                            childAspectRatio: (.80)),
                        itemBuilder: (context, index) {
                          final product = productItem[index];
                          return InkWell(
                            onTap: () {
                              // details
                            },
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // const PosterViewWidget(),
                                Material(
                                  elevation: 0,
                                  // margin: EdgeInsets.symmetric(horizontal: 16.w),
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0.r),
                                  ),
                                  child: Stack(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: product.image??'',
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                        height: 200.h,
                                        placeholder: (context, url) =>
                                            SizedBox(
                                              height: 20.h,
                                              width: 20.w,
                                              child: CircularProgressIndicator(
                                                                                        color: Theme.of(context).indicatorColor,
                                                                                      ),
                                            ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                      Positioned(
                                        top: 10.h,
                                        left: 18.75.w,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 3.0.h, horizontal: 10.w),
                                          // width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16.r),
                                            color: const Color(0xFFFAE3F0),
                                          ),
                                          child: Text(
                                            '${product.name}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color: const Color(0xFFEA2894),
                                                ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 10.h,
                                        right: 5.17.w,
                                        child: const Icon(Icons.more_horiz),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return const NoCourseView();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
