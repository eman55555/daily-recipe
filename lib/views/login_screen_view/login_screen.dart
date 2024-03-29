import 'package:daily_recipe/utils/global_keys.dart';
import 'package:daily_recipe/utils/images.dart';
import 'package:daily_recipe/views/forget_password_view/forget_password_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../view_model/provider/app_auth_provider.dart';
import '../components/text_button.dart';
import '../components/text_form_field.dart';
import '../signup_screen_view/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    Provider.of<AppAuthProvider>(context, listen: false)
        .initAuthProviderLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImagePath.signinImg), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  // flex: 3,
                  child: Center(
                    child: Form(
                        key: GKeys.loginFormKey,
                        child: SingleChildScrollView(
                          child: SafeArea(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                TextFieldWidget(
                                    hint: "Email address ",
                                    txt: Provider.of<AppAuthProvider>(context,
                                            listen: false)
                                        .emailController!,
                                    widget: Icon(
                                      Icons.email_outlined,
                                      color: ligthGrey,
                                    ),
                                    type: TextInputType.emailAddress,
                                    obscure: false,
                                    formatter: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[a-zA-Z || @ || . || 0-9]')),
                                    ]
                                    //  true
                                    ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFieldWidget(
                                    hint: "Password ",
                                    txt: Provider.of<AppAuthProvider>(context,
                                            listen: false)
                                        .passwordController!,
                                    suffixWidget: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            Provider.of<AppAuthProvider>(
                                                        context,
                                                        listen: false)
                                                    .isHidden =
                                                !Provider.of<AppAuthProvider>(
                                                        context,
                                                        listen: false)
                                                    .isHidden!;
                                          });
                                        },
                                        child: Icon(
                                          Provider.of<AppAuthProvider>(context,
                                                      listen: false)
                                                  .isHidden!
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: ligthGrey,
                                        )),
                                    widget: Icon(
                                      Icons.lock,
                                      color: ligthGrey,
                                    ),
                                    type: TextInputType.text,
                                    obscure: Provider.of<AppAuthProvider>(
                                            context,
                                            listen: false)
                                        .isHidden!,
                                    formatter: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[a-zA-Z || 0-9]')),
                                    ]),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ForgetPasswordScreen()));
                                      },
                                      child: Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                            color: lightBlue,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      )),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                TextButtonWidget(
                                  // font: 19.0,
                                  press: () async {
                                    Provider.of<AppAuthProvider>(context,
                                            listen: false)
                                        .login(context);
                                  },
                                  txt: "Sign In",
                                  color: orange,
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
                if (MediaQuery.of(context).viewInsets.bottom == 0)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an acount?',
                          style: TextStyle(
                              color: ligthGrey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Register.',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: orange),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignupScreen()));
                              },
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
