import 'package:custom_painter_cursp/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple,
        body: Column(
          children: [
            Expanded(child: MiSlideshow()),
            Expanded(child: MiSlideshow()),
            // Expanded(child: MiSlideshow()),
            // Expanded(child: MiSlideshow())
          ],
        ));
  }
}

class MiSlideshow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimario: 20,
      bulletSecundario: 10,
      colorPrimario: Colors.green,
      colorSecundario: Colors.white,
      // puntosArriba: true,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
        // SvgPicture.asset('assets/svgs/slide-6.svg'),
      ],
    );
  }
}
