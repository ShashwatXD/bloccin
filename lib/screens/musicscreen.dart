import 'package:blocbase/bloc/music_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MusicBloc(),
      child: Scaffold(
        
        backgroundColor: Colors.teal.shade50,
        body: Center(
          child: BlocBuilder<MusicBloc, MusicState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.teal.shade100,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.teal.shade200,
                          blurRadius: 10,
                          offset: const Offset(0, 7),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.music_note,
                        size: 80,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  const Text(
                    'Pirates',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  Text(
                    _getStatusText(state),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.teal.shade700,
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildControlButton(
                        context,
                        _getPlayPauseIcon(state),
                        () => _handlePlayPause(context, state),
                        isLarge: true,
                      ),
                      const SizedBox(width: 20),
                      _buildControlButton(
                        context,
                        Icons.stop,
                        () => context.read<MusicBloc>().add(StopMusic()),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
  
  String _getStatusText(MusicState state) {
    if (state is MusicPlaying) {
      return 'Playing';
    } else if (state is MusicPaused) {
      return 'Paused';
    } else if (state is MusicStopped) {
      return 'Stopped';
    } else {
      return 'Tap to Play';
    }
  }
  
  IconData _getPlayPauseIcon(MusicState state) {
    if (state is MusicPlaying) {
      return Icons.pause;
    } else {
      return Icons.play_arrow;
    }
  }
  
  void _handlePlayPause(BuildContext context, MusicState state) {
    if (state is MusicPlaying) {
      context.read<MusicBloc>().add(PauseMusic());
    } else {
      context.read<MusicBloc>().add(PlayMusic());
    }
  }
  
  Widget _buildControlButton(
    BuildContext context,
    IconData icon,
    VoidCallback onPressed, {
    bool isLarge = false,
  })
   {
    return Container(
      
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isLarge ? 35 : 30),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.shade200.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: isLarge ? 35 : 30,
          color: Colors.teal.shade700,
        ),
        onPressed: onPressed,
      ),
    );
  }
}