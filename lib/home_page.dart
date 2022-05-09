import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart'
    as intl_phone_number_input;
import 'package:phone_number/phone_number.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  String initialCountry = 'US';
  intl_phone_number_input.PhoneNumber number =
      intl_phone_number_input.PhoneNumber(isoCode: 'US');
  Timer onStoppedTyping;
  bool isValidPhoneNumber = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('International Phone Number Input Field'),
        actions: [
          IconButton(
            onPressed: () {
              if (formKey.currentState.validate()) {}
            },
            icon: const Icon(Icons.check_rounded),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            intl_phone_number_input.InternationalPhoneNumberInput(
              spaceBetweenSelectorAndTextField: 0,
              onInputChanged:
                  (intl_phone_number_input.PhoneNumber phoneNumber) {
                print('onInputChanged: $phoneNumber');
                setState(() {});
                // Duration duration = const Duration(seconds: 1);
                // if (onStoppedTyping != null) {
                //   setState(() => onStoppedTyping.cancel());
                // }
                // setState(() {
                //   () => onStoppedTyping = Timer(duration, () async {
                //         if (phoneNumber.phoneNumber.isNotEmpty) {
                //           PhoneNumberUtil phoneNumberUtil = PhoneNumberUtil();
                //           try {
                //             isValidPhoneNumber = await phoneNumberUtil.validate(
                //               phoneNumber.phoneNumber,
                //               phoneNumber.isoCode,
                //             );
                //             print('try: $isValidPhoneNumber');
                //           } catch (error) {
                //             isValidPhoneNumber = false;
                //             print('catch: $isValidPhoneNumber');
                //           }
                //         } else {
                //           isValidPhoneNumber = true;
                //         }
                //       });
                // });
              },
              onInputValidated: (bool isValid) {
                print(_phoneController.text);
                // if (_phoneController.text.isEmpty) return true;
                print('onInputValidated: $isValid');
                isValidPhoneNumber = isValid;
              },
              errorMessage:
                  _phoneController.text.isEmpty ? '' : 'Invalid Phone Number',
              selectorConfig: const intl_phone_number_input.SelectorConfig(
                selectorType:
                    intl_phone_number_input.PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              // ignoreBlank: false,
              autoValidateMode: AutovalidateMode.onUserInteraction,
              selectorTextStyle: const TextStyle(color: Colors.black),
              textFieldController: _phoneController,
              keyboardType: TextInputType.phone,
              inputBorder: const OutlineInputBorder(),
              /*inputDecoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: _phoneController.text.isEmpty
                        ? Theme.of(context).primaryColor
                        : Colors.redAccent,
                  ),
                ),
              ),*/
            ),
            /*if (!isValidPhoneNumber)
              const Text(
                'Invalid Phone Number',
                style: TextStyle(color: Colors.redAccent),
              ),*/
          ],
        ),
      ),
    );
  }
}
