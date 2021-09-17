import 'package:custom_painter_cursp/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 30.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.pink,
            child: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                porcentaje += 10;
                if (porcentaje > 100) {
                  porcentaje = 0;
                }
              });
            }),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomRadialProgess(
                  porcentaje: porcentaje,
                  color: Colors.blue,
                ),
                CustomRadialProgess(
                  porcentaje: porcentaje,
                  color: Colors.red,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomRadialProgess(
                  porcentaje: porcentaje,
                  color: Colors.orange,
                ),
                CustomRadialProgess(
                    porcentaje: porcentaje, color: Colors.purple)
              ],
            )
          ],
        )
        // Text('$porcentaje %',style: TextStyle(fontSize: 50.0), ),
        // child: CircularProgress(50),
        );
  }
}

class CustomRadialProgess extends StatelessWidget {
  final double porcentaje;
  final Color color;

  const CustomRadialProgess({
    @required this.porcentaje,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      width: 200,
      height: 200,
      // color: Colors.red,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorSecundario: Colors.grey,
        grosorPrimario: 10,
        grosorSecundario: 10,
      ),
    );
  }
}
