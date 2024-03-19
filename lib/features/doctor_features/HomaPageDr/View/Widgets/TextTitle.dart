import 'package:dentalmatching/core/constants/styles.dart';
import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({
    super.key,
    required this.txtt,
    required this.onPressed,
  });
  final String txtt;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: FittedBox(
              child: Text(
                txtt,
                style: Styles.mediumTitle,
              ),
            ),
          ),
          const Spacer(),
          Flexible(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: MaterialButton(
                onPressed: onPressed,
                child: Row(
                  children: [
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: 'See All',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF0F2F6C),
                          ))
                    ])),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.double_arrow_outlined,
                      size: 18,
                      color: Color(0xFF0F2F6C),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
