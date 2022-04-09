import 'package:cubit_weatherapp/cubits/cubit/settings_cubit.dart';
import 'package:cubit_weatherapp/widgets/error_dialog.dart';
import 'package:flutter/material.dart';

mixin SettingListener {
  static Future listener(BuildContext context, SettingsState state) async {
    if (state is ErrorState) {
      ErrorUtils.errorDialog(context, state.error);
    }
  }
}
