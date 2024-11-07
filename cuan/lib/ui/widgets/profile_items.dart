
import 'package:cuan/shared/theme.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final String icUrl;
  final int notif;
  final VoidCallback? onTaps;
  const ProfileMenuItem({super.key, required this.title, required this.icUrl, this.notif = 0, this.onTaps});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTaps,
      child: Container(
        margin: const EdgeInsets.only(bottom: 28),
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Row(
          children: [
            Image.asset(
              icUrl,
              width: 24,
            ),
            const SizedBox(
              width: 18,
            ),
            Text(
              title,
              style: blackTextStyle.copyWith(fontWeight: medium),
            ),
            const Spacer(),
            (notif<=0) ?  const SizedBox(
              height: 24,width: 24,
            ) : Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: orangeColor,
              ),
              child: Center(
                  child: Text(
                "$notif",
                style: whiteTextStyle.copyWith(fontWeight: medium),
              )),
            )
          ],
        ),
      ),
    );
  }
}
