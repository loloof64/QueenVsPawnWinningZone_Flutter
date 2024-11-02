import 'package:flutter/material.dart';
import 'package:queen_vs_pawn_winning_zone/i18n/strings.g.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(t.pages.home.hello),
      ),
    );
  }
}
