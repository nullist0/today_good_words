import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  final VoidCallback? sharePhraseImage;

  const ShareButton({
    Key? key,
    this.sharePhraseImage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Share',
      child: TextButtonTheme(
        data: TextButtonThemeData(
          style: TextButton.styleFrom(
            fixedSize: const Size(30, 30),
            padding: EdgeInsets.zero,
            backgroundColor: Colors.blue,
            textStyle: const TextStyle(color: Colors.white),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
          ),
        ),
        child: TextButton(
          child: const Text('S'),
          onPressed: sharePhraseImage,
        ),
      ),
    );
  }
}
