import 'package:flutter/material.dart';

class EmptyinfoWidget extends StatelessWidget {
  final String infoText;
  final String textInButton;
  const EmptyinfoWidget({
    super.key,
    required this.infoText,
    required this.textInButton,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        Center(
          child: Text(
            infoText,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  textInButton,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.white70),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    )),
              )),
        )
      ],
    );
  }
}
