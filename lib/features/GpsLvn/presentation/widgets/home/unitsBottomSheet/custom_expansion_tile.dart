import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpsLVN/core/utils/size_config.dart';
import 'package:gpsLVN/features/GpsLvn/domain/entities/devices.dart' as device;
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/map/map_bloc.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../../theme.dart';

const Duration _kExpand = Duration(milliseconds: 200);

///
///  * [ListTile], useful for creating expansion tile [children] when the
///    expansion tile represents a sublist.
///  * The "Expand/collapse" section of
///    <https://material.io/guidelines/components/lists-controls.html>.
class CustomExpansionTile extends StatefulWidget {
  /// Creates a single-line [ListTile] with a trailing button that expands or collapses
  /// the tile to reveal or hide the [children]. The [initiallyExpanded] property must
  /// be non-null.
  const CustomExpansionTile({
    Key key,
    this.subtitle,
    this.backgroundColor,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.trailing,
    this.initiallyExpanded = false,
    this.maintainState = false,
    this.tilePadding,
    this.expandedCrossAxisAlignment,
    this.expandedAlignment,
    this.childrenPadding,
    this.imageUrl,
    this.unitName,
    this.handleTap,
    this.item,
  })  : assert(initiallyExpanded != null),
        assert(maintainState != null),
        assert(
          expandedCrossAxisAlignment != CrossAxisAlignment.baseline,
          'CrossAxisAlignment.baseline is not supported since the expanded children '
          'are aligned in a column, not a row. Try to use another constant.',
        ),
        super(key: key);

  final String imageUrl;
  final String unitName;
  final Function(LatLng) handleTap;
  final device.Item item;
  final Widget subtitle;
  final ValueChanged<bool> onExpansionChanged;
  final List<Widget> children;
  final Color backgroundColor;
  final Widget trailing;
  final bool initiallyExpanded;
  final bool maintainState;
  final EdgeInsetsGeometry tilePadding;
  final Alignment expandedAlignment;
  final CrossAxisAlignment expandedCrossAxisAlignment;
  final EdgeInsetsGeometry childrenPadding;

  @override
  _ExpansionTileState createState() => _ExpansionTileState();
}

class _ExpansionTileState extends State<CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeOutTween =
      CurveTween(curve: Curves.easeOut);
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  final ColorTween _borderColorTween = ColorTween();
  final ColorTween _headerColorTween = ColorTween();
  final ColorTween _iconColorTween = ColorTween();
  final ColorTween _backgroundColorTween = ColorTween();

  AnimationController _controller;
  Animation<double> _iconTurns;
  Animation<double> _heightFactor;
  Animation<Color> _borderColor;
  Animation<Color> _headerColor;
  Animation<Color> _iconColor;
  Animation<Color> _backgroundColor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _borderColor = _controller.drive(_borderColorTween.chain(_easeOutTween));
    _headerColor = _controller.drive(_headerColorTween.chain(_easeInTween));
    _iconColor = _controller.drive(_iconColorTween.chain(_easeInTween));
    _backgroundColor =
        _controller.drive(_backgroundColorTween.chain(_easeOutTween));

    _isExpanded = PageStorage.of(context)?.readState(context) as bool ??
        widget.initiallyExpanded;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    _isExpanded = !_isExpanded;
    if (_isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse().then<void>((void value) {
        if (!mounted) return;
        setState(() {
          // Rebuild without widget.children.
        });
      });
    }
    if (widget.onExpansionChanged != null)
      widget.onExpansionChanged(_isExpanded);
  }

  Widget _buildChildren(BuildContext context, Widget child) {
    final Color borderSideColor = _borderColor.value ?? Colors.transparent;
    return Container(
      decoration: BoxDecoration(
        color: _backgroundColor.value ?? Colors.transparent,
        border: Border(
          top: BorderSide(color: borderSideColor),
          bottom: BorderSide(color: borderSideColor),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTileTheme.merge(
            iconColor: _iconColor.value,
            textColor: _headerColor.value,
            child: ListTile(
                onTap:
                    widget.handleTap(LatLng(widget.item.lat, widget.item.lng)),
                contentPadding: widget.tilePadding,
                // leading: Text(""),
                title: Row(
                  children: [
                    Flexible(
                      child: Checkbox(
                        value: widget.item.deviceData.checked == "0"
                            ? false
                            : true,
                        onChanged: (bool value) {
                          BlocProvider.of<FlutterMapBloc>(context).add(
                              ItemsUpdated(widget.item.copyWith(
                                  deviceData: widget.item.deviceData.copyWith(
                                      checked:
                                          widget.item.deviceData.checked == "0"
                                              ? "1"
                                              : "0"))));
                        },
                        //tristate: true,
                        activeColor: AppTheme2.primaryColor18,
                        checkColor: AppTheme2.primaryColor20,
                      ),
                    ),
                    Flexible(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CachedNetworkImage(
                            imageUrl: widget.imageUrl,
                            fit: BoxFit.contain,
                            height: 24,
                            width: 24,
                            // placeholder: (context, url) => Container(color: Theme.of(context).focusColor,),
                            // errorWidget: (context, url, error) => Image.asset("assets/car2.png",height: 24,
                            //  width: 24,),
                          )),
                    ),

                    Flexible(
                        child: FractionallySizedBox(
                      widthFactor: 1.1,
                      child: Text(
                        "${widget.unitName}",
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: SizeConfig.screenWidth / 35,
                            color: AppTheme2.primaryColor18),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),

                    Flexible(
                        child: FractionallySizedBox(
                      widthFactor: 1.5,
                      child: Text(
                        "",
                      ),
                    )),

                    //   Spacer(flex: 2),

                    Flexible(
                        child: Container(
                      padding: const EdgeInsets.all(8.0),
                    )),
                    InkWell(
                      onTap: _handleTap,
                      child: RotationTransition(
                        turns: _iconTurns,
                        child: const Icon(
                          Icons.expand_more,
                          color: AppTheme2.primaryColor18,
                        ),
                      ),
                    ),

                    Flexible(
                      child: ClipOval(
                          child: Material(
                              color: AppTheme2.primaryColor20,
                              child: IconButton(
                                  highlightColor: AppTheme2.primaryColor21,
                                  icon: Icon(
                                    Ionicons.remove_circle_outline,
                                    color: AppTheme2.primaryColor18,
                                    // size: SizeConfig.screenWidth / 25,
                                  ),
                                  onPressed: null))),
                    ),

                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          "assets/satalite2.png",
                          fit: BoxFit.contain,
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),

                    Flexible(
                      child: ClipOval(
                          child: Material(
                              color: AppTheme2.primaryColor20,
                              child: IconButton(
                                  highlightColor: AppTheme2.primaryColor21,
                                  icon: Icon(
                                    Ionicons.ellipse,
                                    color: AppTheme2.onlineColor,
                                    // size: SizeConfig.screenWidth / 25,
                                  ),
                                  onPressed: null))),
                    ),

                    Flexible(
                      child: ClipOval(
                          child: Material(
                              color: AppTheme2.primaryColor20,
                              child: IconButton(
                                highlightColor: AppTheme2.primaryColor21,
                                icon: Icon(
                                  Ionicons.close_outline,
                                  color: AppTheme2.clearColor,
                                  // size: SizeConfig.screenWidth / 25,
                                ),
                                onPressed: () {
                                  print("hi");
                                },
                              ))),
                    ),
                  ],
                ),
                subtitle: widget.subtitle,
                trailing: widget.trailing),
          ),
          ClipRect(
            child: Align(
              alignment: widget.expandedAlignment ?? Alignment.center,
              heightFactor: _heightFactor.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    _borderColorTween.end = theme.dividerColor;
    _headerColorTween
      ..begin = theme.textTheme.subtitle1.color
      ..end = theme.accentColor;
    _iconColorTween
      ..begin = theme.unselectedWidgetColor
      ..end = theme.accentColor;
    _backgroundColorTween.end = widget.backgroundColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    final bool shouldRemoveChildren = closed && !widget.maintainState;

    final Widget result = Offstage(
        child: TickerMode(
          child: Padding(
            padding: widget.childrenPadding ?? EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: widget.expandedCrossAxisAlignment ??
                  CrossAxisAlignment.center,
              children: widget.children,
            ),
          ),
          enabled: !closed,
        ),
        offstage: closed);

    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: shouldRemoveChildren ? null : result,
    );
  }
}
