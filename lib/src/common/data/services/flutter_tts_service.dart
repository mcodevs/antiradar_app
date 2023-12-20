import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  static late final FlutterTts _tts;

  const TTSService._();

  static Future<void> initialize() async {
    _tts = FlutterTts();
    await _tts.awaitSpeakCompletion(true);
    await _tts.setVolume(1);
    await _tts.setSpeechRate(0.6);
    await _tts.setLanguage("ru");
  }

  static void speakMeter(int meter) =>
      _tts.speak("До радара осталось $meter метров");

  static void speakOtherRadar() => _tts
    ..stop()
    ..speak("Рядом обнаружен еще один радар");
}
