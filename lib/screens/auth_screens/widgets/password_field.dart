import 'package:flutter/material.dart';
import 'package:login_demo_flutter/business/auth_manager.dart';
import 'package:provider/provider.dart';

import '../../../constants/strings/text_strings.dart';
import '../../../helper/validator.dart';
import '../../common_widgets/in_text_form_field.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({Key? key}) : super(key: key);
  final bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return InTextFormField(
      label: const Text(TextStrings.PASSWORD),
      keyboardType: TextInputType.visiblePassword,
      prefixIcon: const Icon(Icons.lock),
      validator: Validations.validator.requiredValidator,
      suffixIcon: const Icon(Icons.remove_red_eye),
      obscureText: showPassword,
      textInputAction: TextInputAction.next,
      onChanged: (value) => context.read<AuthManager>().setPassword = value,
    );
  }
}
