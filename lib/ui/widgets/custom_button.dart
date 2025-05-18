import 'package:flutter/material.dart';
import 'package:klero_app/config/config.dart';

class CustomButton extends StatelessWidget {
  final String? label;
  final Widget? icon;
  final Widget? child;
  final bool isLoading;
  final void Function()? onPressed;
  final Key? buttonKey;

  const CustomButton({
    super.key,
    this.label,
    this.child,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.buttonKey,
  }) : assert(
            (label != null && child == null) ||
                (label == null && child != null),
            'You must provide a label (String) or a child (Widget), but not both.');

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      key: buttonKey,
      onPressed: isLoading ? null : onPressed,
      label: _buttonLabel(context: context),
      icon: _buttonIcon(icon: icon),
    );
  }

  Widget _buttonLabel({required BuildContext context}) {
    if (isLoading) return Text(context.translate("loading"));
    if (label != null) return Text("$label");
    return child!;
  }

  Widget? _buttonIcon({Widget? icon}) {
    if (isLoading) {
      return SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(strokeWidth: 3),
      );
    }
    return icon;
  }
}
