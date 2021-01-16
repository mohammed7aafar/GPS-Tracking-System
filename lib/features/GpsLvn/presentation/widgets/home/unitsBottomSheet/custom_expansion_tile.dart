import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpsLVN/core/utils/size_config.dart';
import 'package:gpsLVN/features/GpsLvn/presentation/blocs/unitGroups/unitgroups_cubit.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../../theme.dart';

const Duration _kExpand = Duration(milliseconds: 200);

/// A single-line [ListTile] with a trailing button that expands or collapses
/// the tile to reveal or hide the [children].
///
/// This widget is typically used with [ListView] to create an
/// "expand / collapse" list entry. When used with scrolling widgets like
/// [ListView], a unique [PageStorageKey] must be specified to enable the
/// [ExpansionTile] to save and restore its expanded state when it is scrolled
/// in and out of view.
///
/// See also:
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
  final GestureTapCallback handleTap;

  /// Additional content displayed below the title.
  ///
  /// Typically a [Text] widget.
  final Widget subtitle;

  /// Called when the tile expands or collapses.
  ///
  /// When the tile starts expanding, this function is called with the value
  /// true. When the tile starts collapsing, this function is called with
  /// the value false.
  final ValueChanged<bool> onExpansionChanged;

  /// The widgets that are displayed when the tile expands.
  ///
  /// Typically [ListTile] widgets.
  final List<Widget> children;

  /// The color to display behind the sublist when expanded.
  final Color backgroundColor;

  /// A widget to display instead of a rotating arrow icon.
  final Widget trailing;

  /// Specifies if the list tile is initially expanded (true) or collapsed (false, the default).
  final bool initiallyExpanded;

  /// Specifies whether the state of the children is maintained when the tile expands and collapses.
  ///
  /// When true, the children are kept in the tree while the tile is collapsed.
  /// When false (default), the children are removed from the tree when the tile is
  /// collapsed and recreated upon expansion.
  final bool maintainState;

  /// Specifies padding for the [ListTile].
  ///
  /// Analogous to [ListTile.contentPadding], this property defines the insets for
  /// the [leading], [title], [subtitle] and [trailing] widgets. It does not inset
  /// the expanded [children] widgets.
  ///
  /// When the value is null, the tile's padding is `EdgeInsets.symmetric(horizontal: 16.0)`.
  final EdgeInsetsGeometry tilePadding;

  /// Specifies the alignment of [children], which are arranged in a column when
  /// the tile is expanded.
  ///
  /// The internals of the expanded tile make use of a [Column] widget for
  /// [children], and [Align] widget to align the column. The `expandedAlignment`
  /// parameter is passed directly into the [Align].
  ///
  /// Modifying this property controls the alignment of the column within the
  /// expanded tile, not the alignment of [children] widgets within the column.
  /// To align each child within [children], see [expandedCrossAxisAlignment].
  ///
  /// The width of the column is the width of the widest child widget in [children].
  ///
  /// When the value is null, the value of `expandedAlignment` is [Alignment.center].
  final Alignment expandedAlignment;

  /// Specifies the alignment of each child within [children] when the tile is expanded.
  ///
  /// The internals of the expanded tile make use of a [Column] widget for
  /// [children], and the `crossAxisAlignment` parameter is passed directly into the [Column].
  ///
  /// Modifying this property controls the cross axis alignment of each child
  /// within its [Column]. Note that the width of the [Column] that houses
  /// [children] will be the same as the widest child widget in [children]. It is
  /// not necessarily the width of [Column] is equal to the width of expanded tile.
  ///
  /// To align the [Column] along the expanded tile, use the [expandedAlignment] property
  /// instead.
  ///
  /// When the value is null, the value of `expandedCrossAxisAlignment` is [CrossAxisAlignment.center].
  final CrossAxisAlignment expandedCrossAxisAlignment;

  /// Specifies padding for [children].
  ///
  /// When the value is null, the value of `childrenPadding` is [EdgeInsets.zero].
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
    setState(() {
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
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
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
                onTap: widget.handleTap,
                contentPadding: widget.tilePadding,
                // leading: Text(""),
                title: Row(
                  children: [
                    BlocBuilder<UnitgroupsCubit, bool>(
                        builder: (context, state) {
                      if (state)
                        return Flexible(
                          child: ClipOval(
                              child: IconButton(
                                  highlightColor: AppTheme2.primaryColor21,
                                  icon: Icon(
                                    Ionicons.remove_circle_outline,
                                    color: AppTheme2.primaryColor20,
                                    // size: SizeConfig.screenWidth / 25,
                                  ),
                                  onPressed: null)),
                        );
                      else
                        return Container();
                    }),

                    Flexible(
                      child: Checkbox(
                        value: false,
                        onChanged: (bool value) {
                          // homeController.showUnit(
                          //     index, value);
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

                    Flexible(child: 
                    FractionallySizedBox(
                      widthFactor: 1.1,
                    child: Text(
                        "${widget.unitName}",
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: SizeConfig.screenWidth / 35,
                            color: AppTheme2.primaryColor18),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                    ),

                   Flexible(child: 
                    FractionallySizedBox(
                      widthFactor: 1.5 ,
                      child: Text(
                        "",),
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
