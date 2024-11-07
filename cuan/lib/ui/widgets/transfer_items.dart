import 'package:cuan/models/user_model.dart';
import 'package:cuan/service/custom_width_height.dart';
import 'package:cuan/shared/animation.dart';
import 'package:cuan/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecentUser extends StatelessWidget {
  final UserModel user;
  final bool isSelect;
  const RecentUser({super.key, required this.user, this.isSelect = false});

  @override
  Widget build(BuildContext context) {
    return CustomAnimation(
      delay: 1,
      child: Container(
        width: getW(context, 327),
        padding: const EdgeInsets.all(22),
        margin: EdgeInsets.only(bottom: getH(context, 18)),
        decoration: BoxDecoration(
            color: whiteColor,
            boxShadow: isSelect ? lightShadow : null,
            borderRadius: BorderRadius.circular(20),
            border: isSelect ? Border.all(color: blueColor, width: 1.5) : null),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: greyColor,
              backgroundImage: user.profilePicture == null
                  ? const AssetImage('assets/img_profile.png')
                  : NetworkImage(user.profilePicture!) as ImageProvider,
            ),
            SizedBox(
              width: getW(context, 14),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name ?? 'null',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                  ),
                  Text(
                    '@${user.username}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: greyTextStyle.copyWith(fontSize: 12, fontWeight: regular),
                  )
                ],
              ),
            ),
            if (user.verified == 1)
              Row(
                children: [
                  Image.asset(
                    'assets/ic_check.png',
                    width: 14,
                    height: 14,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    'Verified',
                    style: greenTextStyle.copyWith(fontWeight: medium, fontSize: 11),
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}

class ResultUser extends StatelessWidget {
  final UserModel user;
  final bool isSelect;
  final bool isAny;
  const ResultUser({super.key, required this.user, this.isSelect = false, this.isAny = false});

  @override
  Widget build(BuildContext context) {
    return CustomAnimation(
      delay: 1,
      child: Container(
        width: getW(context, 155),
        height: getH(context, 171),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20),
            border: isSelect ? Border.all(color: blueColor, width: 1.5) : null),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: getH(context, 60),
                width: getW(context, 60),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: !isAny
                        ? (user.profilePicture != null)
                            ? NetworkImage(user.profilePicture!) as ImageProvider
                            : const AssetImage('assets/img_profile.png')
                        : const AssetImage('assets/img_profile.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: (user.verified == 1)
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: whiteColor,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.check_circle,
                              color: greenColor,
                              size: 14,
                            ),
                          ),
                        ),
                      )
                    : null),
            const SizedBox(
              height: 13,
            ),
            Text(
              user.name!,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            Text(
              "@${user.username}",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: greyTextStyle.copyWith(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
