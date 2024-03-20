import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });
  final String buttonText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      child: Container(
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF4A6BAD),
                  Color.fromRGBO(25, 63, 138, 0.48),
                ]),
            boxShadow: const [
              BoxShadow(
                color: Color(0xffC3C3C3),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: const Icon(
            Icons.search_rounded,
            color: Colors.white,
          )),
    );
  }
}
