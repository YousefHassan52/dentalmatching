import 'package:flutter/material.dart';

class RequestButton extends StatelessWidget {
  const RequestButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: () {},
        child: Container(
          alignment: Alignment.center,
          width: 150,
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
          child: FittedBox(
            child: Text(
              'Request',
              style: TextStyle(color: Colors.white,fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
