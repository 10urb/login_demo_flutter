// ignore_for_file: prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:login_demo_flutter/business/weather_manager.dart';
import 'package:login_demo_flutter/constants/main_helpers/routes/route_strings.dart';
import 'package:login_demo_flutter/constants/strings/text_strings.dart';
import 'package:login_demo_flutter/helper/environment.dart';
import 'package:login_demo_flutter/models/login_response_model/login_response_model.dart';
import 'package:provider/provider.dart';
import '../../business/auth_manager.dart';
import '../../constants/strings/button_strings.dart';
import '../../constants/strings/title_strings.dart';
import '../../utilities/toastr.dart';
import '../common_widgets/in_button_colorful.dart';
import '../common_widgets/loading_widget.dart';
import 'widgets/email_field.dart';
import 'widgets/image_widget.dart';
import 'widgets/password_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(TitleStrings.LOGIN)),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 10,
            vertical: MediaQuery.of(context).size.height / 80),
        child: ListView(
          children: [
            Card(
              elevation: 7,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 40),
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    const Divider(),
                    const ImageWidget(),
                    const Divider(),
                    const EmailField(),
                    const Divider(),
                    const PasswordField(),
                    const Divider(),
                    LoginButton(formKey: _formKey),
                    const Divider(),
                    const RegisterButton(),
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
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InButtonColorful(
        backgroundColor: Theme.of(context).backgroundColor,
        onPressed: () {
          Navigator.pushReplacementNamed(context, RouteStrings.REGISTER);
        },
        label: ButtonStrings.REGISTER,
        icon: Icons.login);
  }
}

class LoginButton extends StatelessWidget {
  LoginButton({
    Key? key,
    required this.formKey,
  }) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return InButtonColorful(
        onPressed: () async {
          await loginButtonOperations(context);
        },
        label: ButtonStrings.LOG_IN,
        icon: Icons.login);
  }

  Future<void> loginButtonOperations(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      LoadingWidget.getLoadingCircularDialog(context: context);

      LoginResponseModel? result = await context.read<AuthManager>().login();
      if (result?.accessToken != null) {
        Environment.token = result?.accessToken;
        Environment.expiration = result?.expiration;
        await context.read<WeatherManager>().getWeathers();
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, RouteStrings.WEATHER);
      } else {
        Navigator.pop(context);
        Toastr.buildErrorToast(TextStrings.FAIL);
      }
    }
  }
}
