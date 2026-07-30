import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

class RadioManagerProvider extends ChangeNotifier {
  String? _currentPlayingUrl;
  double? _currentVolume = 2.0;
  AudioPlayer _player = AudioPlayer();
  bool _isplaying = false;
  String? get currentPlayingUrl => _currentPlayingUrl;
  bool? get isPlaying => _isplaying;

  Future<void> play(String url) async {
    if (_currentPlayingUrl == url) {
      _isplaying ? await _player.pause() : await _player.resume();
      _isplaying = !_isplaying;
    } else {
      await _player.stop();
      _currentPlayingUrl = url;
      await _player.play(UrlSource(url), volume: _currentVolume);
      _isplaying = true;
    }
    notifyListeners();
  }

  Future<void> stop() async {
    await _player.stop();
    _currentPlayingUrl = null;
    _isplaying = false;
    notifyListeners();
  }

  Future<void> setVolume(double volume) async {
    _currentVolume = volume;
    await _player.setVolume(volume);
  }
}
