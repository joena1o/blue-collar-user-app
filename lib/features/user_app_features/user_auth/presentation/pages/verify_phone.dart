import 'package:blue_collar_app/core/config/get_it_setup.dart';
import 'package:blue_collar_app/utils/dialog_services.dart';
import 'package:blue_collar_app/utils/responsive.dart';
import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class VerifyPhone extends StatefulWidget {
  const VerifyPhone({super.key});

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phone = TextEditingController();

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SizedBox(
          width: Responsive.getSize(context).width,
          height: Responsive.getSize(context).height,
          child: ListView(
            padding: UtilityClass.horizontalPadding,
            children: [
              const SizedBox(
                height: kToolbarHeight + 80,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  "Provide a Service",
                  style: UtilityClass.blackSemiLargeHeader,
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Image(
                image: AssetImage(
                  "assets/png/rafiki.png",
                ),
                width: 220,
                height: 220,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Verify your number",
                style: UtilityClass.blackSemiLargeHeader,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              IntlPhoneField(
                controller: phone,
                flagsButtonPadding: const EdgeInsets.symmetric(horizontal: 10),
                dropdownTextStyle: const TextStyle(fontSize: 16),
                showDropdownIcon: false,
                disableAutoFillHints: true,
                showCountryFlag: true,
                disableLengthCheck: true,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintText: 'Phone Number',
                ),
                initialCountryCode: 'NG',
                onChanged: (phone) {},
              ),
              const SizedBox(
                height: 45,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28.0, vertical: 15),
                child: Text(
                  "We will send you a One Time Password on this mobile number",
                  textAlign: TextAlign.center,
                  style: UtilityClass.blackSmaller,
                ),
              ),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is OtpRequestSentState) {
                    context.push("/verify-otp", extra: phone.text);
                  }
                },
                builder: (context, state) {
                  return state is AuthLoadingState
                      ? Container(
                          margin: const EdgeInsets.all(20),
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator())
                      : Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          width: Responsive.getSize(context).width,
                          decoration: UtilityClass.buttonDecorationFill,
                          child: ElevatedButton(
                            onPressed: () {
                              if (phone.text.isEmpty) {
                                getIt<DialogServices>().showMessageError(
                                    "Please enter your phone number");
                                return;
                              }
                              if (phone.text.length >= 10 &&
                                  phone.text.length <= 11) {
                                BlocProvider.of<AuthBloc>(context)
                                    .add(SendPhoneOtp(phone: phone.text));
                              } else {
                                getIt<DialogServices>()
                                    .showMessageError("Invalid phone number");
                              }
                            },
                            child: const Text("Next"),
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
