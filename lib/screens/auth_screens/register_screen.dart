// ignore_for_file: prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:login_demo_flutter/constants/strings/text_strings.dart';
import 'package:login_demo_flutter/constants/strings/title_strings.dart';
import 'package:login_demo_flutter/models/register_model/register_model.dart';
import 'package:login_demo_flutter/screens/auth_screens/widgets/email_field.dart';
import 'package:login_demo_flutter/screens/auth_screens/widgets/password_field.dart';
import 'package:login_demo_flutter/screens/common_widgets/in_date_time_form_field.dart';
import 'package:login_demo_flutter/screens/common_widgets/in_text_form_field.dart';
import 'package:provider/provider.dart';

import '../../business/auth_manager.dart';
import '../../constants/main_helpers/routes/route_strings.dart';
import '../../constants/strings/button_strings.dart';
import '../../helper/validator.dart';
import '../../utilities/toastr.dart';
import '../common_widgets/in_button_colorful.dart';
import '../common_widgets/loading_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterModel register = RegisterModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 10,
            vertical: MediaQuery.of(context).size.height / 80),
        child: ListView(
          children: [
            Card(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 40),
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    const Divider(),
                    const EmailField(),
                    const Divider(),
                    const PasswordField(),
                    const Divider(),
                    nameField(),
                    const Divider(),
                    surnameField(),
                    const Divider(),
                    salaryField(),
                    const Divider(),
                    birthDateField(),
                    const Divider(),
                    genderField(),
                    const Divider(),
                    RegisterButton(formKey: _formKey, register: register),
                    const Divider(),
                    const LoginButton(),
                    const Divider(),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownButtonFormField<bool> genderField() => DropdownButtonFormField<bool>(
        isExpanded: true,
        enableFeedback: true,
        validator: (value) => value == null ? TextStrings.REQUIRED : null,
        hint: Row(children: const [
          Icon(Icons.female),
          Icon(Icons.male),
          Text(TextStrings.SELECT_GENDER)
        ]),
        items: _genders,
        onChanged: (value) => setState(() => register.gender = value),
        value: register.gender,
      );

  List<DropdownMenuItem<bool>> get _genders {
    return const [
      DropdownMenuItem(child: Text(TextStrings.MALE), value: true),
      DropdownMenuItem(child: Text(TextStrings.FEMALE), value: false),
    ];
  }

  InTextFormField nameField() => InTextFormField(
        label: const Text(TextStrings.NAME),
        textInputAction: TextInputAction.next,
        onChanged: (value) => register.firstName = value,
        prefixIcon: const Icon(Icons.abc),
        validator: Validations.validator.requiredValidator,
      );

  InTextFormField surnameField() => InTextFormField(
      label: const Text(TextStrings.SURNAME),
      validator: Validations.validator.requiredValidator,
      onChanged: (value) => register.lastName = value,
      textInputAction: TextInputAction.next,
      prefixIcon: const Icon(Icons.abc));

  InDateTimeFormField birthDateField() => InDateTimeFormField(
        validator: (value) => value == null ? TextStrings.REQUIRED : null,
        onDateSelected: (value) => register.birthDate = int.parse(
            value.day.toString() +
                value.month.toString() +
                value.year.toString()),
        label: const Text(TextStrings.BIRTH_DATE),
      );

  InTextFormField salaryField() => InTextFormField(
      label: const Text(TextStrings.MOUNTLY_SALARY),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      onChanged: (value) => register.salary = double.parse(value),
      validator: (value) => Validations.decimalTextFieldValidator(value),
      prefixIcon: const Icon(Icons.money));
}

AppBar get _appBar {
  return AppBar(
    title: const Text(TitleStrings.REGISTER),
  );
}

class RegisterButton extends StatelessWidget {
  RegisterButton({Key? key, required this.formKey, required this.register})
      : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RegisterModel register;
  @override
  Widget build(BuildContext context) {
    return InButtonColorful(
        onPressed: () async {
          await registerButtonOperations(context);
        },
        label: ButtonStrings.REGISTER,
        icon: Icons.login);
  }

  Future<void> registerButtonOperations(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      LoadingWidget.getLoadingCircularDialog(context: context);

      bool result = await context.read<AuthManager>().register(register);
      if (result == true) {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, RouteStrings.LOGIN);
      } else {
        Navigator.pop(context);
        Toastr.buildErrorToast(TextStrings.FAIL);
      }
    }
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InButtonColorful(
      backgroundColor: Theme.of(context).backgroundColor,
      onPressed: () {
        Navigator.pushReplacementNamed(context, RouteStrings.LOGIN);
      },
      label: ButtonStrings.LOG_IN,
      icon: Icons.login,
    );
  }
}
