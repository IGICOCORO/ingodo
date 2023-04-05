import 'package:flutter/material.dart';
class ProgressModal extends StatelessWidget {
  final Widget child;
  final bool isAsyncCall;
  final double opacity;

  const ProgressModal({
    Key? key,
    required this.child,
    required this.isAsyncCall,
    this.opacity = 0.5,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child);
    if (isAsyncCall) {
      final modal = Stack(
        children: [
          Opacity(
            opacity: opacity,
            child: const ModalBarrier(
              dismissible: false,
              color: Colors.black,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(30.0),
                padding: const EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(width: 16.0),
                    Text(
                      'Veuillez Patienter',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}
