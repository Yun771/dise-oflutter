import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({@required this.onPressed, @required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  PinterestMenu({
    this.mostrar = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    @required this.items
  });

  // final List<PinterestButton> items = [
  //   PinterestButton(onPressed: () => print('Icon pie_chart'), icon: Icons.pie_chart),
  //   PinterestButton(onPressed: () => print('Icon search'), icon: Icons.search),
  //   PinterestButton(onPressed: () => print('Icon notifications'), icon: Icons.notifications),
  //   PinterestButton(
  //       onPressed: () => print('Icon supervised_user_circle'), icon: Icons.supervised_user_circle),
  // ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new _MenuModel(),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 250),
          opacity: (mostrar) ? 1 : 0,
          child: Builder(builder: (BuildContext context) {
            Provider.of<_MenuModel>(context).backGroundColor = this.backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = this.activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;

            return _PinteresMenuBackGround(
                backGroundColor: this.backgroundColor,
                child: Visibility(visible: mostrar, child: _MenuItems(menuItems: items)));
          }),
        ));
  }
}

class _PinteresMenuBackGround extends StatelessWidget {
  final Widget child;
  final Color backGroundColor;

  const _PinteresMenuBackGround({@required this.child, this.backGroundColor});

  @override
  Widget build(BuildContext context) {
    Color backGroundColor = Provider.of<_MenuModel>(context).backGroundColor;
    return Container(
      width: 250,
      height: 60,
      child: this.child,
      decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black38, blurRadius: 10.0, spreadRadius: -5)
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems({this.menuItems});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          menuItems.length, (i) => _PinterestMenuButtom(index: i, menuItem: menuItems[i])),
    );
  }
}

class _PinterestMenuButtom extends StatelessWidget {
  final int index;
  final PinterestButton menuItem;

  const _PinterestMenuButtom({this.index, this.menuItem});
  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    final activeColor = Provider.of<_MenuModel>(context).activeColor;
    final inactiveColor = Provider.of<_MenuModel>(context).inactiveColor;

    return GestureDetector(
        onTap: () {
          Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;
          menuItem.onPressed();
        },
        behavior: HitTestBehavior.translucent,
        child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            child: Icon(
              menuItem.icon,
              size: (itemSeleccionado == index) ? 30.0 : 25.0,
              color: (itemSeleccionado == index) ? activeColor : inactiveColor,
            )));
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  Color backGroundColor = Colors.white;
  Color activeColor = Colors.black;
  Color inactiveColor = Colors.blueGrey;

  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado(int index) {
    this._itemSeleccionado = index;

    notifyListeners();
  }

  // Color get backGroundColor => this._backGroundColor;

  // set backGroundColor(Color color) {
  //   this._backGroundColor = color;
  //   notifyListeners();
  // }

  // Color get activeColor => this._activeColor;

  // set activeColor(Color color) {
  //   this._activeColor = color;
  //   notifyListeners();
  // }

  // Color get inactiveColor => this._inactiveColor;

  // set inactiveColor(Color color) {
  //   this._inactiveColor = color;
  //   notifyListeners();
  // }
}
