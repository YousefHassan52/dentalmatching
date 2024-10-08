import 'package:flutter/material.dart';

class EnabledInfo extends StatelessWidget {
  final String info;
  final IconData icon;
  const EnabledInfo({
    super.key,
    required this.info,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:15.0 , vertical: 5),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
              width: 200,
              child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    info,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ))),
        ],
      ),
    );
  }
}
