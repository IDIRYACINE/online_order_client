import 'package:flutter/material.dart';
import 'package:online_order_client/Domain/Catalogue/optional_item.dart';

typedef ItemPopulater = OptionalItem Function(int index);
typedef ItemActivationFunction = bool Function(int index);
typedef OptionalItemBuilder = Widget Function(BuildContext context, int index);

class OptionalItemsWidget extends StatefulWidget {
  final String title;
  final int itemCount;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final Color? selectedItemTextColor;
  final Color? unselectedItemTextColor;
  final ItemPopulater itemPopulater;
  final ItemActivationFunction onItemPressed;
  final bool displayItemLabel;
  final bool displayItemIcon;
  final ShapeBorder? itemShape;
  final double? minItemWidth;
  const OptionalItemsWidget(
    this.title, {
    Key? key,
    required this.itemCount,
    required this.itemPopulater,
    required this.onItemPressed,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedItemTextColor,
    this.unselectedItemTextColor,
    this.displayItemLabel = true,
    this.displayItemIcon = false,
    this.itemShape,
    this.minItemWidth,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OptionalItemsWidgetState();
}

class _OptionalItemsWidgetState extends State<OptionalItemsWidget> {
  late ThemeData theme;
  final double seperatorWidth = 5.0;
  final double maxItemHeight = 50.0;

  Widget buildOptionalItem(BuildContext context, ThemeData theme, int index) {
    OptionalItem item = widget.itemPopulater(index);
    return _ItemWidget(
      index,
      item.getLabel(),
      onItemPressed: widget.onItemPressed,
      displayIcon: widget.displayItemIcon,
      displayLabel: widget.displayItemLabel,
      icon: item.getIconData(),
      selectedItemColor: widget.selectedItemColor ?? theme.primaryColor,
      unselectedItemColor:
          widget.unselectedItemColor ?? theme.colorScheme.background,
      selectedItemTextColor:
          widget.selectedItemTextColor ?? theme.backgroundColor,
      unselectedItemTextColor:
          widget.unselectedItemTextColor ?? theme.colorScheme.onBackground,
      shape: widget.itemShape ?? const StadiumBorder(),
      minWidth: widget.minItemWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: Text(
            widget.title,
            style: theme.textTheme.headline2,
          ),
        ),
        SizedBox(
            height: maxItemHeight,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) =>
                  SizedBox(width: seperatorWidth),
              itemCount: widget.itemCount,
              itemBuilder: (context, index) {
                return buildOptionalItem(context, theme, index);
              },
            ))
      ],
    );
  }
}

class _ItemWidget extends StatefulWidget {
  final IconData? icon;
  final String label;
  final ItemActivationFunction? onItemPressed;
  final int index;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Color selectedItemTextColor;
  final Color unselectedItemTextColor;
  final ShapeBorder shape;
  final bool displayLabel;
  final bool displayIcon;
  final double? minWidth;

  const _ItemWidget(
    this.index,
    this.label, {
    this.onItemPressed,
    required this.selectedItemColor,
    required this.unselectedItemColor,
    required this.shape,
    required this.selectedItemTextColor,
    required this.unselectedItemTextColor,
    this.displayLabel = true,
    this.displayIcon = false,
    this.icon,
    this.minWidth,
  });

  @override
  State<_ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<_ItemWidget> {
  bool isSelected = false;
  late Color backgroundColor;
  late Color textColor;
  late ItemActivationFunction onPressed;

  bool selfToggle(int index) {
    return !isSelected;
  }

  void setup() {
    onPressed = widget.onItemPressed ?? selfToggle;
    backgroundColor = widget.unselectedItemColor;
    textColor = widget.unselectedItemTextColor;
  }

  @override
  Widget build(BuildContext context) {
    setup();

    return MaterialButton(
      color: isSelected ? widget.selectedItemColor : widget.unselectedItemColor,
      minWidth: widget.minWidth,
      shape: widget.shape,
      child: Row(
        children: [
          if (widget.displayIcon)
            Icon(
              widget.icon,
            ),
          if (widget.displayLabel)
            Text(
              widget.label,
              style: TextStyle(
                  color: isSelected
                      ? widget.selectedItemTextColor
                      : widget.unselectedItemTextColor),
            )
        ],
      ),
      onPressed: () {
        setState(() {
          isSelected = onPressed(widget.index);
        });
      },
    );
  }
}
