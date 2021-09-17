import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;

  RadialProgress(
      {@required this.porcentaje,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey,
      this.grosorSecundario = 4,
      this.grosorPrimario = 10});

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;

    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      // child: ,
      builder: (BuildContext context, Widget child) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress(
                porcentaje: (widget.porcentaje - diferenciaAnimar) +
                    (diferenciaAnimar * controller.value),
                colorPrimario: widget.colorPrimario,
                colorSecundario: widget.colorSecundario,
                grosorPrimario: widget.grosorPrimario,
                grosorSecundario: widget.grosorSecundario),
          ),
        );
      },
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  _MiRadialProgress(
      {@required this.porcentaje,
      @required this.colorPrimario,
      this.colorSecundario,
      this.grosorPrimario,
      this.grosorSecundario});

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = new Rect.fromCircle(center: Offset(0, 0), radius: 180);

    final Gradient gradiente = new LinearGradient(
      colors: <Color>[Color(0xFFFFFB02), Color(0xFF199B44), Color(0xA4FF0464)],
    );

    //* Circulo Completo
    final paint = new Paint()
      ..strokeWidth = grosorSecundario
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    final center = new Offset(size.width * 0.5, size.height * 0.5);
    final radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    //* Arco

    final paintArco = new Paint()
      ..strokeWidth = grosorPrimario
      // ..color = colorPrimario
      ..shader = gradiente.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    //* Parte que se debe ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
