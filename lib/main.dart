import 'package:custom_painter_cursp/src/pages/pinterest_page.dart';
import 'package:flutter/material.dart';

import 'package:custom_painter_cursp/src/pages/slideshow_page.dart';

// import 'package:custom_painter_cursp/src/pages/graficas_circulares_page.dart';
// import 'package:custom_painter_cursp/src/labs/circular_progress_page.dart';
// import 'package:custom_painter_cursp/src/retos/cuadrado_animado_page.dart';
import 'package:custom_painter_cursp/src/pages/header_page.dart';
// import 'package:custom_painter_cursp/src/pages/animaciones_page.dart';
// import 'package:custom_painter_cursp/src/pages/header_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Diseño app',
        home: HeaderPage());
  }
}
