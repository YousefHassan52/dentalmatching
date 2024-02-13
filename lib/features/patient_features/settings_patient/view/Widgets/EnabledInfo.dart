
import 'package:flutter/material.dart';

class EnabledInfo extends StatelessWidget {
   final String info ;
   final IconData icon ;
  const EnabledInfo({
    super.key, required this.info, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(
          icon,
          color: Colors.grey,
          
        ),
        const SizedBox(width: 10,),
        Text(info,style: const TextStyle(color: Colors.grey, fontSize: 20,),),
      ],
    );
  }
}