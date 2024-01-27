import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final  void Function()? onPressed;
  const CustomButton({
    super.key,
    required this.text,
   this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width:150 ,
      child: MaterialButton(
        disabledColor: Color(0xFF1E496B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: onPressed,
        textColor: Colors.white,
        child: Text(text,style: TextStyle(fontSize: 25),),
      
      ),
    );
  }
}
