import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'color_constants.dart';

class Tools {
  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static String formattedDate(DateTime timeStamp) {
    String formattedDate = DateFormat.yMd()
        .format(DateTime(timeStamp.year, timeStamp.month, timeStamp.day));
    return formattedDate;
  }

  static String formattedDateYYYDmm(DateTime timeStamp) {
    String formattedDate = DateFormat('yyy-MM-dd')
        .format(DateTime(timeStamp.year, timeStamp.month, timeStamp.day));
    return formattedDate;
  }

  static String orderStatus(int status) {
    return status == 0
        ? 'accepted.'
        : status == 1
            ? 'pickup.'
            : status == 2
                ? 'picked up.'
                : status == 3
                    ? 'received at Central Hub.'
                    : status == 4
                        ? 'on the way to customer address.'
                        : 'delivered.';
  }

  static String statusImage(int status) {
    return status == 0
        ? 'assets/images/ic_accepted.svg'
        : status == 1
            ? 'assets/images/ic_accepted.svg'
            : status == 2
                ? 'assets/images/ic_pickup.svg'
                : status == 3
                    ? 'assets/images/ic_transit.svg'
                    : status == 4
                        ? 'assets/images/ic_delivered.svg'
                        : 'assets/images/ic_cancelled.svg';
  }

  // static Color statusTextColor(int status) {
  //   return status == 0
  //       ? const Color(0xFFEA2894)
  //       : status == 1
  //           ? const Color(0xFFC20071)
  //           : status == 2
  //               ? const Color(0xFF02AFF9)
  //               : status == 3
  //                   ? const Color(0xFF00A6BB)
  //                   : status == 4
  //                       ? const Color(0xFF00A6BB)
  //                       : const Color(0xFF00AE11);
  // }

  static Color statusTextColor(int status) {
    return status == 0
        ? const Color(0xFFEA2894)
        : status == 1
            ? const Color(0xFFC20071)
            : status == 2
                ? const Color(0xFF02AFF9)
                : status == 3
                    ? const Color(0xFF00A6BB)
                    : status == 4
                        ? const Color(0xFF00AE11)
                        : const Color.fromRGBO(255, 21, 7, 1);
  }

  static Color statusImageBoarderColor(int status, int position) {
    return status == 5
        ? const Color.fromRGBO(255, 21, 7, 1)
        : status == position
            ? ColorConstants.primaryColorLight
            : status > position
                ? ColorConstants.successColor
                : ColorConstants.textColor;
  }

  static Color statusImageColor(int status, int position) {
    return status == 5
        ? const Color.fromRGBO(255, 21, 7, 1)
        : status == position
            ? ColorConstants.primaryColor
            : status > position
                ? ColorConstants.successColor
                : ColorConstants.textColor;
  }

  static String consignmentStatusName(int status) {
    return status == 0
        ? 'Pending'
        : status == 1
            ? 'Accepted'
            : status == 2
                ? 'Picked up.'
                : status == 3
                    ? 'In Transit'
                    : status == 4
                        ? 'Delivered'
                        : 'Canceled';
  }

  static String consignmentStatusFilter(String status) {
    return status == 'Pending'
        ? 'pending'
        : status == 'Accepted'
            ? 'accepted'
            : status == 'All'
                ? 'all'
                : status == 'Picked up'
                    ? 'picked'
                    : status == 'In Transit'
                        ? 'intransit'
                        : status == 'Delivered'
                            ? 'delivered'
                            : 'canceled';
  }

  static String consignmentStatusFilterView(String status) {
    return status == 'pending'
        ? 'Pending'
        : status == 'accepted'
            ? 'Accepted'
            : status == 'all'
                ? 'All'
                : status == 'picked'
                    ? 'Picked up'
                    : status == 'intransit'
                        ? 'In Transit'
                        : status == 'delivered'
                            ? 'Delivered'
                            : 'Canceled';
  }

  static String consignmentTimelineFilter(String timeline) {
    return timeline == 'This Year'
        ? 'year'
        : timeline == 'This Month'
            ? 'month'
            : timeline == 'This Week'
                ? 'week'
                : '';
  }

  static String consignmentTimelineFilterView(String timeline) {
    return timeline == 'year'
        ? 'This Year'
        : timeline == 'month'
            ? 'This Month'
            : 'This Week';
  }

  static int consignmentStatus(String status) {
    return status == 'Pending'
        ? 0
        : status == 'Accepted'
            ? 1
            : status == 'Picked Up'
                ? 2
                : status == 'In Transit'
                    ? 3
                    : status == 'Delivered'
                        ? 4
                        : 5;
  }

  static String orderStatusImage(int status) {
    return status == 0
        ? 'ic_tracking1'
        : status == 1
            ? 'ic_tracking2'
            : status == 2
                ? 'ic_tracking3'
                : status == 3
                    ? 'ic_tracking4'
                    : status == 4
                        ? 'ic_tracking5'
                        : 'ic_tracking6';
  }
}
