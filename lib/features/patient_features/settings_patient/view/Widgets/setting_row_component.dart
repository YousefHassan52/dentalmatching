import 'package:flutter/material.dart';

class SettingsRowComponent extends StatelessWidget {
  const SettingsRowComponent({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
    required this.textColor,
    required this.iconColor,
  });

  final void Function() onTap;
  final String text;
  final IconData icon;
  final Color textColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: MaterialButton(
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: textColor),
                ),
              ),
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
