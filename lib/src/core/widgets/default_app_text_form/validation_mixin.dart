import 'package:flutter/material.dart';

mixin ValidationMixin<T extends StatefulWidget> on State<T> {
  // String? validateEmail(String? email) {
  //   if (email!.trim().isEmpty) {
  //     return AppLocalizations.of(context)!.translate('email_validation');
  //   } else if ((!isEmail(email))) {
  //     return AppLocalizations.of(context)!.translate('enter_email_valid');
  //   }

  //   return null;
  // }

  // String? validateUserNameOrEmail(String? userNameOrEmail) {
  //   if (userNameOrEmail!.trim().isEmpty) {
  //     return AppLocalizations.of(context)!
  //         .translate('user_name_or_email_validation');
  //   }
  //   return null;
  // }

  // String? validatePassword(String? password) {
  //   if (password!.trim().isEmpty) {
  //     return AppLocalizations.of(context)!.translate('password_validation');
  //   }
  //   return null;
  // }

  // String? validateNewPassword(String? newPassword) {
  //   _newPassword = newPassword;
  //   if (newPassword!.trim().isEmpty) {
  //     return AppLocalizations.of(context)!.translate('new_password_validation');
  //   }
  //   return null;
  // }

  // String? validateConfirmNewPassword(String? confirmNewPassword) {
  //   if (confirmNewPassword!.trim().isEmpty) {
  //     return AppLocalizations.of(context)!
  //         .translate('confirm_new_password_validation');
  //   } else if (_newPassword != confirmNewPassword) {
  //     return AppLocalizations.of(context)!.translate('password_not_identical');
  //   }
  //   return null;
  // }
}
