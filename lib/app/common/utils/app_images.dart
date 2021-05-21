import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage {
  AppImage._();

  static Widget fromSVG({
    double width = 18,
    double height = 18,
    @required String image,
  }) {
    return SvgPicture.asset(
      image,
      width: width,
      height: height,
      fit: BoxFit.contain,
      semanticsLabel: 'label',
    );
  }
}

class AppAssets {
  AppAssets._();

  static const logo = 'assets/icons/logo_telegram.svg';
  static const icMenu = 'assets/icons/ic_menu.svg';
  static const icEllipse = 'assets/icons/ic_ellipse_1.svg';
  static const icPlus = 'assets/icons/ic_plus.svg';
  static const icUnion = 'assets/icons/ic_union.svg';
  static const icTrash = 'assets/icons/ic_trash.svg';
  static const icSearchBlue = 'assets/icons/ic_search.svg';
  static const icSearchWhite = 'assets/icons/ic_search_white.svg';
  static const icBookmarkWhite = 'assets/icons/ic_bookmark.svg';
  static const icNotificationBlue = 'assets/icons/ic_notification.svg';
  static const icNotificationWhite = 'assets/icons/ic_notification_white.svg';
  static const icArrowBack = 'assets/icons/ic_arrow_back.svg';
  static const icProfileMenu = 'assets/icons/ic_profile_menu.svg';
  static const icVideoMessage = 'assets/icons/ic_video_message.svg';
  static const icFace = 'assets/icons/ic_face.svg';
  static const icDelete = 'assets/icons/ic_delete.svg';
  static const icCallWhite = 'assets/icons/ic_call.svg';
  static const icCallBlue = 'assets/icons/ic_call_blue.svg';
  static const icQuestionBlue = 'assets/icons/ic_questions_blue.svg';
  static const icInviteFriendsBlue = 'assets/icons/ic_invite_friends_blue.svg';
  static const icBookmarkBlue = 'assets/icons/ic_bookmark_blue.svg';
  static const icContactBlue = 'assets/icons/ic_contacts.svg';
  static const icArrowForward = 'assets/icons/ic_arrow_forward_blue.svg';
  static const icSetting = 'assets/icons/ic_setting_blue.svg';
  static const avatarGirl = 'assets/icons/girl_avatar.svg';
}
