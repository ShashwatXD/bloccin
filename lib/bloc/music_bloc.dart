import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MusicEvent {}

class PlayMusic extends MusicEvent {}
class PauseMusic extends MusicEvent {}
class StopMusic extends MusicEvent {}

abstract class MusicState {}

class MusicInitial extends MusicState {}
class MusicPlaying extends MusicState {}
class MusicPaused extends MusicState {}
class MusicStopped extends MusicState {}

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  
  MusicBloc() : super(MusicInitial()) {
    on<PlayMusic>((event, emit) async {
      await _audioPlayer.play(AssetSource('music/poc.mp3'));
      emit(MusicPlaying());
    });
    
    on<PauseMusic>((event, emit) async {
      await _audioPlayer.pause();
      emit(MusicPaused());
    });
    
    on<StopMusic>((event, emit) async {
      await _audioPlayer.stop();
      emit(MusicStopped());
    });
  }
  
}