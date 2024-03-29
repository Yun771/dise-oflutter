import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  const Slideshow(
      {@required this.slides,
      this.puntosArriba = false,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey,
      this.bulletPrimario = 12,
      this.bulletSecundario = 10});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SliderShowModel(),
      child: SafeArea(
        child: Center(child: Builder(
          builder: (BuildContext context) {
            Provider.of<_SliderShowModel>(context).colorPrimario =
                this.colorPrimario;

            Provider.of<_SliderShowModel>(context).colorSecundario =
                this.colorSecundario;

            Provider.of<_SliderShowModel>(context).bulletPrimario =
                this.bulletPrimario;

            Provider.of<_SliderShowModel>(context).bulletSecundario =
                this.bulletSecundario;

            return _CrearEstructuraSlideshow(
                puntosArriba: puntosArriba, slides: slides);
          },
        )),
      ),
    );
  }
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow({
    Key key,
    @required this.puntosArriba,
    @required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (this.puntosArriba)
          _Dots(
            dots: slides.length,
          ),
        Expanded(child: _Slides(slides: this.slides)),
        if (!this.puntosArriba)
          _Dots(
            dots: slides.length,
          )
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int dots;

  const _Dots({
    this.dots,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            dots,
            (i) => _Dot(
                  index: i,
                )),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot({
    this.index,
  });
  @override
  Widget build(BuildContext context) {
    final slideshowModel = Provider.of<_SliderShowModel>(context);

    double tamano;
    Color color;

    if (slideshowModel.currentPage >= index - 0.5 &&
        slideshowModel.currentPage <= index + 0.5) {
      tamano = slideshowModel.bulletPrimario;
      color = slideshowModel.colorPrimario;
    } else {
      tamano = slideshowModel.bulletSecundario;
      color = slideshowModel.colorSecundario;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides({this.slides});

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SliderShowModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        // children: [
        //   _Slide(svg: 'assets/svgs/slide-1.svg'),
        //   _Slide(svg: 'assets/svgs/slide-2.svg'),
        //   _Slide(svg: 'assets/svgs/slide-3.svg')
        // ],
        children: widget.slides.map((slide) => _Slide(slide: slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide({this.slide});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SliderShowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario;
  double _bulletSecundario;

  double get currentPage => this._currentPage;

  set currentPage(double pagina) {
    this._currentPage = pagina;
    // print(pagina);
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;

  set colorPrimario(Color color) {
    this._colorPrimario = color;
  }

  Color get colorSecundario => this._colorSecundario;

  set colorSecundario(Color color) {
    this._colorSecundario = color;
  }

  double get bulletPrimario => this._bulletPrimario;

  set bulletPrimario(double bulletPrimario) {
    this._bulletPrimario = bulletPrimario;
  }

  double get bulletSecundario => this._bulletSecundario;

  set bulletSecundario(double bulletSecundario) {
    this._bulletSecundario = bulletSecundario;
  }
}
