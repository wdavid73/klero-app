import 'package:flutter/material.dart';
import 'package:front_scaffold_flutter_v2/config/config.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Widget? icon;
  final bool isLoading;
  final void Function()? onPressed;
  final Key? buttonKey;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.buttonKey,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      key: buttonKey,
      onPressed: isLoading ? null : onPressed,
      label: _buttonLabel(context: context, label: label),
      icon: _buttonIcon(icon: icon),
    );
  }

  Widget _buttonLabel({required String label, required BuildContext context}) {
    return isLoading ? Text(context.translate("loading")) : Text(label);
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