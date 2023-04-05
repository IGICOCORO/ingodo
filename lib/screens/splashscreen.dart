import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    waiter();
  }

  void waiter() async {
    await Future.delayed(const Duration(seconds:2), () {
      BlocProvider.of<ManagerBloc>(context).add(OnStart());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ManagerBloc, ManagerState>(
        listener: (context, state) {
          if (state.isTheAppInitialized == true) {
            if (state.hasAlreadyLoggedIn == true) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(home, (route) => false);
            } else if (state.hasAlreadyLoggedIn == false) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(login, (route) => false);
            }
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: new Color(0xFF90CAF9),
                  gradient: LinearGradient(
                      colors: [new Color(0xFFE3F2FD), new Color.fromRGBO(11, 136, 180,1)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
            Center(
              child: Container(

              ),
            )
          ],
        ),
      ),
    );
  }
}