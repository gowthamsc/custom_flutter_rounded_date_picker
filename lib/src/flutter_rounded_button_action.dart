import 'package:flutter/material.dart';

class FlutterRoundedButtonAction extends StatelessWidget {
  final String? textButtonNegative;
  final String? textButtonPositive;
  final String? textActionButton;
  final VoidCallback? onTapButtonNegative; // Default is "Cancel" button.
  final VoidCallback? onTapButtonPositive; // Default is "OK" button.
  final VoidCallback? onTapButtonAction; // Default is "Action" button which will be on the left.
  final ButtonStyle? textStyleButtonAction;
  final ButtonStyle? textStyleButtonPositive;
  final ButtonStyle? textStyleButtonNegative;
  final MaterialLocalizations localizations;
  final double borderRadius;
  final EdgeInsets? paddingActionBar;
  final Color? background;

  const FlutterRoundedButtonAction(
      {Key? key,
      required this.localizations,
      this.textButtonNegative,
      this.textButtonPositive,
      this.textActionButton,
      this.onTapButtonAction,
      this.onTapButtonPositive,
      this.onTapButtonNegative,
      this.textStyleButtonPositive,
      this.textStyleButtonNegative,
      this.textStyleButtonAction,
      required this.borderRadius,
      this.paddingActionBar,
      this.background})
      : super(key: key);

  List<Widget> _buildActionsButton() {
    final Widget negativeButton = ElevatedButton(
      child: Text(
        textButtonNegative ?? localizations.cancelButtonLabel,
      ),
      style: textStyleButtonNegative,
      onPressed: onTapButtonNegative,
    );

    final Widget positiveButton = ElevatedButton(
      child: Text(
        textButtonPositive ?? localizations.okButtonLabel,
      ),
      style: textStyleButtonPositive,
      onPressed: onTapButtonPositive,
    );

    if (textActionButton != null) {
      final Widget leftButton = ElevatedButton(
        child: Text(textActionButton!),
        style: textStyleButtonAction,
        onPressed: onTapButtonAction,
      );
      return [
        leftButton,
        Row(children: <Widget>[negativeButton, positiveButton])
      ];
    }

    return [negativeButton, positiveButton];
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      padding: paddingActionBar,
      decoration: BoxDecoration(
          color: background,
          borderRadius:
              orientation == Orientation.landscape ? BorderRadius.only(bottomRight: Radius.circular(borderRadius)) : BorderRadius.vertical(bottom: Radius.circular(borderRadius))),
      child: ButtonBar(
        alignment: textActionButton != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
        children: _buildActionsButton(),
      ),
    );
  }
}
