import 'package:flutter/material.dart';

class TimeRow extends StatelessWidget {
  const TimeRow({
    super.key, required this.time, required this.icon,
  });
final String time;
final  IconData icon;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment:
          MainAxisAlignment.start,
      children: [
        Flexible(
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Icon(
                icon,
                color: Colors.white,
                size: 15,
              )),
        ),
        const SizedBox(
          width: 6,
        ),
        Flexible(
         //flex: 1,
          child: FittedBox(
            child: Text(
              time,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
        ),
        
    
        // SizedBox(
        //   width: 5,
        // ),
      ],
    );
  }
}
