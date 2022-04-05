import 'package:elecar/app_colors.dart';
import 'package:flutter/material.dart';

class StartButton extends StatefulWidget {
  const StartButton({Key? key}) : super(key: key);

  @override
  _StartButtonState createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _spreadRadius;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )
      ..addListener(() => setState(() {}))
      ..repeat(reverse: true);

    _spreadRadius = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutQuad,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.0,
      height: 90.0,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF02DB8A),
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 16.0 * _spreadRadius.value,
            blurStyle: BlurStyle.outer,
            color: const Color(0xFF02DB8A),
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFF099260),
            width: 2.0,
          ),
        ),
        child: const Center(
          child: Text(
            'START',
            style: TextStyle(
              height: 1.4,
              fontSize: 13.0,
              fontFamily: 'Exo',
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
