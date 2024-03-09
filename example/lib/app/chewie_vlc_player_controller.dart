import 'dart:ui';

import 'package:chewie/chewie.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:video_player_platform_interface/video_player_platform_interface.dart';

class ChewieVlcPlayerController
    implements ChewieControllerInterface<VlcPlayerValue> {
  ChewieVlcPlayerController({required this.vlcPlayerController});

  final VlcPlayerController vlcPlayerController;

  @override
  void addListener(VoidCallback listener) {
    vlcPlayerController.addListener(listener);
  }

  @override
  double get aspectRatio => vlcPlayerController.value.aspectRatio;

  // VideoPlayer gives a list of buffered ranges, but VlcPlayer gives the buffer percent
  // so we convert it to a list of one range from 0 (start) to the buffer percent
  @override
  List<DurationRange> get buffered => [
        DurationRange(
            const Duration(milliseconds: 0),
            Duration(
                milliseconds: (vlcPlayerController.value.bufferPercent *
                        duration.inMilliseconds)
                    .round()))
      ];

  @override
  Duration get duration => vlcPlayerController.value.duration;

  @override
  String? get errorDescription => vlcPlayerController.value.errorDescription;

  @override
  bool get hasError => vlcPlayerController.value.hasError;

  @override
  Future<void> initialize() {
    return vlcPlayerController.initialize();
  }

  @override
  bool get isBuffering => vlcPlayerController.value.isBuffering;

  @override
  bool get isInitialized => vlcPlayerController.value.isInitialized;

  @override
  bool get isPlaying => vlcPlayerController.value.isPlaying;

  @override
  Future<void> pause() {
    return vlcPlayerController.pause();
  }

  @override
  Future<void> play() {
    return vlcPlayerController.play();
  }

  @override
  double get playbackSpeed => vlcPlayerController.value.playbackSpeed;

  @override
  void removeListener(VoidCallback listener) {
    vlcPlayerController.removeListener(listener);
  }

  @override
  Future<void> seekTo(Duration position) {
    return vlcPlayerController.seekTo(position);
  }

  @override
  Future<void> setLooping(bool looping) {
    return vlcPlayerController.setLooping(looping);
  }

  @override
  Future<void> setPlaybackSpeed(double speed) {
    return vlcPlayerController.setPlaybackSpeed(speed);
  }

  @override
  Future<void> setVolume(double volume) {
    return vlcPlayerController.setVolume((volume * 100).round());
  }

  @override
  Size get size => vlcPlayerController.value.size;

  @override
  VlcPlayerValue get value => vlcPlayerController.value;

  @override
  ValueNotifier<VlcPlayerValue> get valueNotifier => vlcPlayerController;

  @override
  Duration get valuePosition => vlcPlayerController.value.position;

  @override
  double get volume => vlcPlayerController.value.volume / 100;
}
