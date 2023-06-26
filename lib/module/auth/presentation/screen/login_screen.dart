import 'package:demo/module/auth/presentation/screen/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../../core/presentation/resources/forms/buttons.dart';
import '../../../../core/presentation/resources/forms/textfields.dart';
import '../../../../core/presentation/resources/size_constants.dart';
import '../../../../core/presentation/resources/ui_assets.dart';

class LoginPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
    final _formKey = GlobalKey<FormBuilderState>();

    final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 34, 55, 1),
      body: FormBuilder(
      key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: SC.lH, vertical: SC.mH),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 192,
                  width: 289,
                  child: Image.asset(UIAssets.getDummyImage("feature.png")),
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: SC.lH, vertical: SC.mH),
                  // height: 300,
                  // width: 376,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(43, 43, 67, 1),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0.0, 0.0),
                            blurRadius: 5.0,
                            spreadRadius: 2.0)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 35,
                            ),
                            PrimaryTextField(
                              onSaved: (_) {},
                              hintTxt: "lokendragharti576@gmail.com",
                              fillColor: Color.fromRGBO(33, 34, 55, 1),
                              borderRadius: 28,
                              prefixIcon: Icons.email,
                              controller: _emailCtrl,
                          validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: "email address is required"),
                      ]),                       
                       ),
                            SBC.xLH,
                            PrimaryTextField(
                              onSaved: (_) {},
                              hintTxt: "***************",
                              fillColor: Color.fromRGBO(33, 34, 55, 1),
                              borderRadius: 28,
                              prefixIcon: Icons.lock_outline,
                              controller: _passwordCtrl,
                                  validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: "password is required"),
                      ]), 
                              suffixIcon: const Icon(
                                Icons.visibility_off,
                                color: Color.fromRGBO(0, 206, 209, 1),
                              ),
                              
                            ),
                            SBC.xLH,
                            const Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.check_box_outline_blank,
                                  color: Color.fromRGBO(137, 137, 137, 1),
                                ),
                                Text(
                                  "Remember me",
                                  style: TextStyle(
                                    color: Color.fromRGBO(137, 137, 137, 1),
                                    fontSize: 15,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "Forget password?",
                                  style: TextStyle(
                                    color: Color.fromRGBO(137, 137, 137, 1),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            SBC.xxLX,
                           PrimaryButton(
                                onPressed: () {
                                  if (_formKey.currentState!.saveAndValidate()) {
                                    // Form is valid, continue with login logic
                                  } else {
                                    // Form validation failed, print errors
                                    print('Form validation failed');
                                    final errors =
                                        _formKey.currentState!.errors;
                                    errors.entries.forEach((entry) {
                                      // print(
                                      //     '${entry.key}: ${entry.value.join(', ')}');
                                    });
                                  }
                                },
                                title: "Sign in",
                                width: 300,
                                radius: 28,
                                height: 56,
                                color: Color.fromRGBO(0, 206, 209, 1),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SBC.xxLX,
                const Text(
                  "Already Have an Account !",
                  style: TextStyle(
                      color: Color.fromRGBO(137, 137, 137, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                PrimaryTextButton(title: "Click hera to go textfield", onPressed: (){
                  Navigator.push(
      context, MaterialPageRoute(builder: (context) =>  TextScreen()));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}