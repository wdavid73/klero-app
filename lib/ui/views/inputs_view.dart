import 'package:flutter/material.dart';
import 'package:front_scaffold_flutter_v2/config/config.dart';
import 'package:front_scaffold_flutter_v2/ui/widgets/widgets.dart';

class InputsWidget extends StatelessWidget {
  const InputsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs Widget"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: context.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Text:"),
                  const SizedBox(width: 50),
                  Expanded(
                    child: CustomTextFormField(
                      label: "Text",
                      hint: "Hint",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Text disable:"),
                  const SizedBox(width: 50),
                  Expanded(
                    child: CustomTextFormField(
                      label: "Text",
                      hint: "Hint",
                      enabled: false,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Number:"),
                  const SizedBox(width: 50),
                  Expanded(
                    child: CustomTextFormField(
                      label: "Number with error",
                      hint: "Hint",
                      errorMessage: "Error Message",
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Password:"),
                  const SizedBox(width: 50),
                  Expanded(
                    child: CustomTextFormField(
                      label: "Password",
                      hint: "Hint",
                      obscureText: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}