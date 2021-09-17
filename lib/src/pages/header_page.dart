import 'package:custom_painter_cursp/src/widgets/headers.dart';
import 'package:flutter/material.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: HeaderClipPainter()));
  }
}

class PruebaBoton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
      primary: Colors.blue,
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ).copyWith(
      side: MaterialStateProperty.resolveWith<BorderSide>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed))
            return BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1,
            );
          return null; // Defer to the widget's default.
        },
      ),
    );

    return OutlinedButton(
      style: outlineButtonStyle,
      onPressed: () {},
      child: Text('Looks like an OutlineButton'),
    );
  }
}
