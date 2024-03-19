import 'package:flutter/material.dart';

class RequestAndCancelButton extends StatelessWidget {
  const RequestAndCancelButton({
    super.key,
    required this.onPressed,
    this.isCancelButton = false,
  });
  final void Function() onPressed;
  final bool isCancelButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: onPressed,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isCancelButton
                    ? [
                        const Color.fromARGB(255, 209, 88, 7),
                        const Color.fromRGBO(228, 99, 40, 0.475),
                      ]
                    : [
                        const Color(0xFF4A6BAD),
                        const Color.fromRGBO(25, 63, 138, 0.48),
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
          child: FittedBox(
            child: Text(
              isCancelButton ? 'Cancel' : 'Request',
              style: const TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
