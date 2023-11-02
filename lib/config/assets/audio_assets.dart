class AudioAssets {
  static String get bgAudio => 'bg_audio'.src;

  const AudioAssets._();
}

extension on String {
  String get src => '$this.mp3';
}
