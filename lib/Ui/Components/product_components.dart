import 'package:flutter/material.dart';

typedef ItemPopulater = String Function(int index);
typedef ItemActivationFunction = bool Function(int index);

class OptionalItemsWidget extends StatefulWidget {
  final String title;
  final int itemCount;
  final Color? itemBackgroundColor;
  final ItemPopulater itemPopulater;
  final ItemActivationFunction? onItemPressed;

  const OptionalItemsWidget(
    this.title, {
    Key? key,
    required this.itemCount,
    required this.itemPopulater,
    this.itemBackgroundColor,
    this.onItemPressed,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OptionalItemsWidgetState();
}

class _OptionalItemsWidgetState extends State<OptionalItemsWidget> {
  late ThemeData theme;
  final double seperatorWidth = 5.0;

  _ItemWidget buildOptionalItem(BuildContext context, int index) {
    String item = widget.itemPopulater(index);
    Color itemColor =
        widget.itemBackgroundColor ?? theme.scaffoldBackgroundColor;
    return _ItemWidget(
      index,
      Icons.ac_unit,
      color: itemColor,
      onItemPressed: widget.onItemPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.title,
          style: theme.textTheme.headline2,
        ),
        SizedBox(
            height: 50,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) =>
                  SizedBox(width: seperatorWidth),
              itemCount: widget.itemCount,
              itemBuilder: (context, index) =>
                  buildOptionalItem(context, index),
            ))
      ],
    );
  }
}

class _ItemWidget extends StatefulWidget {
  final IconData icon;
  final Color color;
  final ItemActivationFunction? onItemPressed;
  final int index;

  const _ItemWidget(
    this.index,
    this.icon, {
    required this.color,
    this.onItemPressed,
  });

  @override
  State<_ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<_ItemWidget> {
  late ItemActivationFunction onItemPressed;
  late BoxDecoration selectedBorderDecoration;
  late BoxDecoration unselectedDecoration;
  bool isSelected = false;

  bool selfToggle(int index) {
    return !isSelected;
  }

  void setup() {
    onItemPressed = widget.onItemPressed ?? selfToggle;
    selectedBorderDecoration = BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor));
    unselectedDecoration = BoxDecoration(color: widget.color);
  }

  @override
  Widget build(BuildContext context) {
    setup();

    return Container(
        decoration:
            isSelected ? selectedBorderDecoration : unselectedDecoration,
        child: IconButton(
          icon: Icon(widget.icon),
          onPressed: () {
            setState(() {
              isSelected = onItemPressed(widget.index);
            });
          },
        ));
  }
}
