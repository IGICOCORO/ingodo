import 'package:flutter/material.dart';

class ActionsDialog extends StatelessWidget {
  const ActionsDialog({
    Key? key,
    required this.actions,
    required this.title,
  }) : super(key: key);
  final List<ActionsDialogAction> actions;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(16.0),
      title: Text(title),
      scrollable: true,
      contentPadding: const EdgeInsets.all(0.0),
      content: SingleChildScrollView(
        child: Column(
          children: actions
              .map(
                (e) => Column(
              children: [
                e,
                const Divider(),
              ],
            ),
          )
              .toList(),
        ),
      ),
    );
  }
}

class ActionsDialogAction extends StatelessWidget {
  const ActionsDialogAction({
    Key? key,
    required this.actionLabel,
    required this.onTap,
    required this.iconData,
  }) : super(key: key);
  final String actionLabel;
  final IconData iconData;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData),
      onTap: onTap,
      title: Text(actionLabel),
    );
  }
}
