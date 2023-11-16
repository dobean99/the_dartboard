class PngAssets {
  //get full path file name .png ==> example "assets/images/blue_ballon.png"
  static String get logo => 'logo_text'.png;
  static String get backgroundImage => 'background_image'.png;
  static String get homeIcon => 'home_icon'.png;
  static String get statisticsIcon => 'statistics_icon'.png;
  static String get playIcon => 'play_icon'.png;
  static String get settingsIcon => 'settings_icon'.png;
  static String get musicIcon => 'music_icon'.png;
  static String get volumeIcon => 'volume_icon'.png;
  static String get engIcon => 'eng'.png;
  static String get porIcon => 'por'.png;
  static String get rusIcon => 'rus'.png;

  static String get pauseIcon => 'pause_icon'.png;
  static String get arrowRightIcon => 'arrow_right_icon'.png;
  static String get cupIcon => 'cup_icon'.png;
  static String get boardBackground => 'board_background'.png;

//get only file name .png ==> example "blue_ballon.png"
  static String get background => 'background_image'.src;
  static String get clockIcon => 'clock'.src;
  static String get scoreBoard => 'score_board'.src;
  static String get dartBoard => 'dart_board'.src;
  static String get longBlueDarts => 'long_blue_darts'.src;
  static String get mediumBlueDarts => 'medium_blue_darts'.src;
  static String get shortBlueDarts => 'short_blue_darts'.src;
  static String get longYellowDarts => 'long_yellow_darts'.src;
  static String get mediumYellowDarts => 'medium_yellow_darts'.src;
  static String get shortYellowDarts => 'short_yellow_darts'.src;
  const PngAssets._();
}

extension on String {
  String get png => 'assets/images/$this.png';
  String get src => '$this.png';
}
