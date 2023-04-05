import 'package:flutter/material.dart';

enum AlertDialogType { success, error, warning, info }

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    Key? key,
    required this.dialogType,
    required this.message,
    this.actions,
  }) : super(key: key);
  final AlertDialogType dialogType;
  final String message;
  final List<CustomAlertDialogAction>? actions;

  @override
  Widget build(BuildContext context) {
    switch (dialogType) {
      case AlertDialogType.info:
        return dialog(context, Theme.of(context).primaryColor, Icons.info,
            'Info', message,
            actions: actions);
      case AlertDialogType.error:
        return dialog(context, Colors.red, Icons.close, 'Erreur', message,
            actions: actions);
      case AlertDialogType.warning:
        return dialog(
            context, Colors.deepOrange, Icons.warning, 'Attention', message,
            actions: actions);
      case AlertDialogType.success:
        return dialog(context, Colors.green, Icons.done, 'Success', message,
            actions: actions);
    }
  }

  AlertDialog dialog(BuildContext context, Color color, IconData icon,
      String title, String message,
      {List<CustomAlertDialogAction>? actions}) {
    return AlertDialog(
      scrollable: true,
      contentPadding: const EdgeInsets.all(0.0),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(),
                      ],
                      color: color,
                    ),
                    child: Icon(
                      icon,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.subtitle2!.color,
                        ),
                  ),
                  const Divider(),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            if (actions == null || actions.isEmpty)
              CustomAlertDialogAction(
                actionLabel: 'Fermer',
                onTap: () {
                  Navigator.of(context).pop();
                },
              )
            else
              Row(
                children: actions
                    .map(
                      (e) => Expanded(
                        child: e,
                      ),
                    )
                    .toList(),
              )
          ],
        ),
      ),
    );
  }
}

class CustomAlertDialogAction extends StatelessWidget {
  const CustomAlertDialogAction({
    Key? key,
    required this.actionLabel,
    required this.onTap,
  }) : super(key: key);
  final String actionLabel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
        ),
        child: Text(
          actionLabel,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Theme.of(context).textTheme.bodyText2!.color,
                fontSize:
                    Theme.of(context).textTheme.headline6!.fontSize! - 3.0,
              ),
        ),
      ),
    );
  }
}
