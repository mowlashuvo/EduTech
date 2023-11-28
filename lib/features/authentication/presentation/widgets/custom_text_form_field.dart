import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/show_hide_confirm_password/show_hide_confirm_password_bloc.dart';
import '../bloc/show_hide_password/show_hide_password_bloc.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.hintText,
    this.editingController,
    this.onChanged,
    required this.error,
    this.isLast,
    this.isReadOnly,
    this.preIcon,
  }) : super(key: key);

  final String title;
  final String hintText;
  final bool error;
  final Function(String)? onChanged;
  final TextEditingController? editingController;
  final bool? isLast;
  final bool? isReadOnly;
  final Icon? preIcon;

  @override
  Widget build(BuildContext context) {
    bool obscureText = false;
    var keyboardType = TextInputType.text;
    switch (title) {
      case 'Phone':
        keyboardType = TextInputType.phone;
        break;
      case 'Email':
        keyboardType = TextInputType.emailAddress;
        break;
      case 'Password':
        obscureText = true;
        keyboardType = TextInputType.visiblePassword;
        break;
      case 'Number':
        keyboardType = TextInputType.number;
        break;
      case 'Product':
        keyboardType = TextInputType.multiline;
        break;
      case 'Name':
        keyboardType = TextInputType.text;
        break;
    }
    TextInputAction textInputAction = TextInputAction.next;
    if (isLast == true) {
      textInputAction = TextInputAction.done;
    } else {
      textInputAction = TextInputAction.next;
    }
    return BlocBuilder<ShowHidePasswordBloc, ShowHidePasswordState>(
      builder: (context, state) {
        return TextFormField(
          //key: _formKey,
          cursorColor: Theme.of(context).primaryColor,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          readOnly: isReadOnly??false,
          maxLines: title=='Product'?null:1,
          onChanged: onChanged,
          controller: editingController,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 14.0.h, horizontal: 16.0.w),
              isDense: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color:
                        error ? Colors.red : Theme.of(context).hintColor, width: 0.5.w),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0.r),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color:
                        error ? Colors.red : Theme.of(context).primaryColor, width: 0.5.w),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0.r),
                ),
              ),

              focusColor: Colors.white,
              fillColor: Colors.white,
              filled: false,
              hoverColor: Colors.white,
              hintText: hintText,
              // suffixIcon: suffix,
              prefixIcon: preIcon,
              // prefixIconColor: Theme.of(context).primaryColor,
              hintStyle: Theme.of(context).textTheme.displaySmall,
              suffixIcon: title == 'Password'
                  ? GestureDetector(
                      onTap: () {
                        if (state is ShowPasswordState) {
                          obscureText = true;
                          context
                              .read<ShowHidePasswordBloc>()
                              .add(HidePasswordEvent());
                        } else if (state is HidePasswordState) {
                          obscureText = false;
                          context
                              .read<ShowHidePasswordBloc>()
                              .add(ShowPasswordEvent());
                        }
                      },
                      child: Icon(
                        !obscureText
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : null),
          obscureText: title == 'Password'
              ? state is HidePasswordState
                  ? true
                  : false
              : false,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Theme.of(context).primaryColor),
        );
      },
    );
  }
}

class CustomConfirmPasswordField extends StatelessWidget {
  const CustomConfirmPasswordField({
    Key? key,
    required this.title,
    required this.hintText,
    this.editingController,
    this.onChanged,
    required this.error,
    this.preIcon,
  }) : super(key: key);

  final String title;
  final String hintText;
  final bool error;
  final Function(String)? onChanged;
  final TextEditingController? editingController;
  final Icon? preIcon;

  @override
  Widget build(BuildContext context) {
    bool obscureText = false;
    var keyboardType = TextInputType.text;
    switch (title) {
      case 'Phone':
        keyboardType = TextInputType.phone;
        break;
      case 'Email':
        keyboardType = TextInputType.emailAddress;
        break;
      case 'Confirm Password':
        obscureText = true;
        keyboardType = TextInputType.visiblePassword;
        break;
    }
    return BlocBuilder<ShowHideConfirmPasswordBloc,
        ShowHideConfirmPasswordState>(
      builder: (context, state) {
        return TextFormField(
          //key: _formKey,
          keyboardType: keyboardType,
          onChanged: onChanged,
          controller: editingController,
          decoration: InputDecoration(
            contentPadding:
            EdgeInsets.symmetric(vertical: 14.0.h, horizontal: 16.0.w),
            isDense: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color:
                  error ? Colors.red : Theme.of(context).hintColor, width: 0.5.w),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0.r),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color:
                  error ? Colors.red : Theme.of(context).primaryColor, width: 0.5.w),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0.r),
              ),
            ),
            focusColor: Colors.white,
            fillColor: Colors.white,
            filled: false,
            hoverColor: Colors.white,
            hintText: hintText,
            prefixIcon: preIcon,
            hintStyle: Theme.of(context).textTheme.displaySmall,
            suffixIcon: title == 'Confirm Password'
                ? GestureDetector(
                    onTap: () {
                      if (state is ShowConfirmPasswordState) {
                        obscureText = true;
                        context
                            .read<ShowHideConfirmPasswordBloc>()
                            .add(HideConfirmPasswordEvent());
                      } else if (state is HideConfirmPasswordState) {
                        obscureText = false;
                        context
                            .read<ShowHideConfirmPasswordBloc>()
                            .add(ShowConfirmPasswordEvent());
                      }
                    },
                    child: Icon(
                      !obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : null,
          ),
          obscureText: title == 'Confirm Password'
              ? state is HideConfirmPasswordState
                  ? true
                  : false
              : false,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Theme.of(context).primaryColor),
        );
      },
    );
  }
}

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    Key? key,
    required this.title,
    required this.hintText,
    this.editingController,
    this.onChanged,
    required this.error,
    this.isLast,
    this.preIcon, this.focusNode, this.autofocus,
  }) : super(key: key);

  final String title;
  final String hintText;
  final bool error;
  final Function(String)? onChanged;
  final TextEditingController? editingController;
  final bool? isLast;
  final Icon? preIcon;
  final FocusNode? focusNode;
  final bool? autofocus;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      padding: EdgeInsets.symmetric(vertical: 0.0.h, horizontal: 0.0.w),
      child: TextFormField(
        //key: _formKey,
        cursorColor: Theme.of(context).primaryColor,
        textInputAction: TextInputAction.search,
        keyboardType: TextInputType.text,
        maxLines: title=='Product'?null:1,
        onChanged: onChanged,
        focusNode: focusNode,
        // onFieldSubmitted: onChanged,
        autofocus: autofocus??false,
        controller: editingController,
        decoration: InputDecoration(
            contentPadding:
            EdgeInsets.symmetric(vertical: 0.0.h, horizontal: 10.0.w),
            isDense: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color:
                  error ? Colors.red : Theme.of(context).hintColor, width: 0.5.w),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0.r),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color:
                  error ? Colors.red : Theme.of(context).primaryColor, width: 0.5.w),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0.r),
              ),
            ),
            focusColor: Colors.white,
            fillColor: Colors.white,
            filled: false,
            hoverColor: Colors.white,
            hintText: hintText,
            // suffixIcon: suffix,
            prefixIcon: preIcon,
            // prefixIconColor: Theme.of(context).primaryColor,
            hintStyle: Theme.of(context).textTheme.displaySmall,
            ),
        style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
