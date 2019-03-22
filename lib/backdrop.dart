import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'model/product.dart';

// Velocity we want our animation to have
const double _kFlingVelocity = 2.0;

// This class is used to customize the home screen
// Backdrop is our own widget that mainly consists
// of a Stack that holds 2 children: frontLayer and backLayer.

class Backdrop extends StatefulWidget {
  final Category currentCategory;
  final Widget frontLayer;
  final Widget backLayer;
  final Widget frontTitle;
  final Widget backTitle;

  const Backdrop({
    // @required is a best practice when you have properties in the constructor
    // that have no default value and cannot be null and therefore should not be forgotten.
    @required this.currentCategory,
    @required this.frontLayer,
    @required this.backLayer,
    @required this.frontTitle,
    @required this.backTitle,
  })  : assert(currentCategory != null),  // these asserts check the values passed into those fields are indeed not null
        assert(frontLayer != null),
        assert(backLayer != null),
        assert(frontTitle != null),
        assert(backTitle != null);

  @override
  _BackdropState createState() => _BackdropState();
}

// TODO: Add _BackdropTitle class (104)

class _BackdropState extends State<Backdrop>
    with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');

  // The AnimationController coordinates Animations and gives you API to play,
  // reverse, and stop the animation.
  // Don't forget to dispose it in dispose()
  AnimationController _controller;

  // The initState() method is only called once,
  // before the widget is part of its render tree.
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      // Animations should not be long
      duration: Duration(milliseconds: 300),
      value: 1.0,
      vsync: this,
    );
  }

  // TODO: Add override for didUpdateWidget (104)

  // The dispose() method is also only called once,
  // when the widget is removed from its tree for good.
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Functions to get and change front layer visibility
  bool get _frontLayerVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed || status == AnimationStatus.forward;
  }

  void _toggleBackdropLayerVisibility() {
    _controller.fling(velocity: _frontLayerVisible ? -_kFlingVelocity : _kFlingVelocity);
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    const double layerTitleHeight = 48.0;
    final Size layerSize = constraints.biggest;
    final double layerTop = layerSize.height - layerTitleHeight;

    // TODO: Create a RelativeRectTween Animation (104)
    Animation<RelativeRect> layerAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(
          0.0, layerTop, 0.0, layerTop - layerSize.height),
      end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(_controller.view);

    // A Stack's children can overlap
    return Stack(
      key: _backdropKey,
      children: <Widget>[
        // ExcludeSemantics widget will exclude the backLayer's menu items
        // from the semantics tree when the back layer isn't visible.
        ExcludeSemantics(
          child: widget.backLayer,
          excluding: _frontLayerVisible,
        ),
        PositionedTransition(
          rect: layerAnimation,
          // Wrap front layer in _FrontLayer
          child: _FrontLayer(
            // TODO: Implement onTap property on _BackdropState (104)
            child: widget.frontLayer,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      brightness: Brightness.light,
      elevation: 0.0,
      titleSpacing: 0.0,
      // TODO: Remove leading property (104)
      // TODO: Create title with _BackdropTitle parameter (104)
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: _toggleBackdropLayerVisibility,
      ),
      title: Text('SHRINE'),
      actions: <Widget>[
        // TODO: Add shortcut to login screen from trailing icons (104)
        IconButton(
          icon: Icon(
            Icons.search,
            semanticLabel: 'search',
          ),
          onPressed: () {
            // TODO: Add open login (104)
          },
        ),
        IconButton(
          icon: Icon(
            Icons.tune,
            semanticLabel: 'filter',
          ),
          onPressed: () {
            // TODO: Add open login (104)
          },
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      // LayoutBuilder widget uses _buildStack as its builder.
      // LayoutBuilder is used when a widget must know its parent widget's size
      // in order to lay itself out (and the parent size does not depend on the child.)
      // LayoutBuilder takes a function that returns a Widget.
      // Here we've delayed the build of the front/back layer stack until layout time
      // using LayoutBuilder so that we can incorporate the backdrop's actual overall height.
      body: LayoutBuilder(builder: _buildStack),
    );
  }
}

// Front layer with an angled cut in the upper-left corner
class _FrontLayer extends StatelessWidget {
  // TODO: Add on-tap callback (104)
  const _FrontLayer({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 16.0,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(46.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // TODO: Add a GestureDetector (104)
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}