import 'package:daily_recipe/utils/global_keys.dart';
import 'package:daily_recipe/utils/images.dart';
import 'package:daily_recipe/view_model/provider/app_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../components/text_button.dart';
import '../components/text_form_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  void initState() {
    Provider.of<AppAuthProvider>(context, listen: false)
        .initAuthProviderForget();
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
                  image: AssetImage(ImagePath.logoImg), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Form(
                        key: GKeys.forgetEmailFormKey,
                        child: SingleChildScrollView(
                          child: SafeArea(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Reset Password",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.5,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                TextFieldWidget(
                                    hint:
                                        "Enter Your Email To Change Password ",
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
                                const SizedBox(
                                  height: 40,
                                ),
                                TextButtonWidget(
                                  // font: 19.0,
                                  press: () async {
                                    var txt = Provider.of<AppAuthProvider>(
                                            context,
                                            listen: false)
                                        .emailController!
                                        .text;
                                    Provider.of<AppAuthProvider>(context,
                                            listen: false)
                                        .forgotPassword(context, txt);
                                  },
                                  txt: "Send Email",
                                  color: orange,
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
