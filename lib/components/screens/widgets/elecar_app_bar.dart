import 'package:elecar/app_colors.dart';
import 'package:elecar/app_resources.dart';
import 'package:elecar/extensions/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ElecarAppBar extends StatelessWidget with PreferredSizeWidget {
  const ElecarAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: preferredSize.width,
      height: preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTitle(),
          SizedBox(
            width: 32.0,
            height: 32.0,
            child: GestureDetector(
              onTap: Feedback.wrapForTap(
                () {},
                context,
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppResources.menu,
                ),
              ),
              behavior: HitTestBehavior.opaque,
            ),
          ),
        ],
      ).withPaddingSymmetric(24.0, 8.0),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        SvgPicture.asset(
          AppResources.logo,
          width: 16.0,
        ),
        const SizedBox(width: 6.0),
        const Text(
          'Elecar',
          style: TextStyle(
            fontSize: 15.0,
            fontFamily: 'Exo',
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
