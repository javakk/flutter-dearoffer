import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoadingItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          constraints: BoxConstraints.expand(),
          color: Colors.black12,
          child: Center(
            child: Opacity(
              opacity: 0.9,
              child: SpinKitWave(
                color: Color(0xFF66ccff),
                size: 50.0,
              ),
            ),
          )
      )
    );
  }
}
