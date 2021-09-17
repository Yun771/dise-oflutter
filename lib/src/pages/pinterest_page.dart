import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:custom_painter_cursp/src/widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
        // body: PinterestMenu(),
        body: Stack(
          alignment: Alignment.center,
          children: [PinterestGrid(), _PinterestMenuLocation()],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    return Positioned(
      child: PinterestMenu(
        items: [
          PinterestButton(onPressed: () => print('Icon pie_chart'), icon: Icons.pie_chart),
          PinterestButton(onPressed: () => print('Icon search'), icon: Icons.search),
          PinterestButton(onPressed: () => print('Icon notifications'), icon: Icons.notifications),
          PinterestButton(
              onPressed: () => print('Icon supervised_user_circle'),
              icon: Icons.supervised_user_circle),
          PinterestButton(
              onPressed: () {
              
              },
              icon: Icons.access_alarm)
        ],
        mostrar: mostrar,
        // activeColor: Colors.purple,
        // inactiveColor: Colors.green,
        // backgroundColor: Colors.white,
      ),
      bottom: 30,
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (i) => i);

  ScrollController controller = new ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollAnterior && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
      scrollAnterior = controller.offset;
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(
        index: index,
      ),
      staggeredTileBuilder: (int index) => StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem({this.index});

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(5.0),
      decoration:
          BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Center(
          child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text('$index'),
      )),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => this._mostrar;

  set mostrar(bool mostrar) {
    this._mostrar = mostrar;
    notifyListeners();
  }
}
