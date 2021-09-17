import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBorderRedondeadoss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Color(0xff615AAB),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70.0),
              bottomRight: Radius.circular(70.0))),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();

    // Propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2.0;

    final path = new Path();

    //Dibujar con el path y el lapiz

    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.33);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTrianguloPainter(),
      ),
    );
  }
}

class _HeaderTrianguloPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    //Propiedades del paint
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20.0;

    final path = new Path();

    // path.moveTo(size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    // path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    //Propiedades del paint
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20.0;

    final path = new Path();

    // path.moveTo(size.width, size.height);
    path.lineTo(0, size.height * 0.20);
    path.lineTo(size.width * 0.50, size.height * 0.25);
    path.lineTo(size.width, size.height * 0.20);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, 0);
    // path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCircular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCircularPainter(),
      ),
    );
  }
}

class _HeaderCircularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    //Propiedades del paint
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20.0;

    final path = new Path();

    // path.moveTo(size.width, size.height);
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.50, size.width * 0.80, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    //Propiedades del paint
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20.0;

    final path = new Path();

    // path.moveTo(size.width, size.height);
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.width * 0.60,
        size.width * 0.5, size.height * 0.25);

    path.quadraticBezierTo(
        size.width * 0.75, size.width * 0.40, size.width, size.height * 0.25);

    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderClipPainter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderClipPainter(),
      ),
    );
  }
}

class _HeaderClipPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    paint
      ..color = Color(0xff615AAB)
      ..style = PaintingStyle.fill
      ..strokeWidth = 10;

    final path = new Path();

    path.moveTo(size.width * 0.15, 0);
    path.lineTo(size.width * 0.15, size.height * 0.35);
    path.lineTo(size.width * 0.20, size.height * 0.30);
    path.lineTo(size.width * 0.25, size.height * 0.35);
    path.lineTo(size.width * 0.25, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
