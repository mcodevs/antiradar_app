import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  static late final FlutterTts _tts;

  const TTSService._();

  static Future<TTSService> initialize() async {
    _tts = FlutterTts();
    await _tts.awaitSpeakCompletion(true);
    await _tts.setVolume(1);
    await _tts.setSpeechRate(0.6);
    await _tts.setLanguage("ru");
    return const TTSService._();
  }
}