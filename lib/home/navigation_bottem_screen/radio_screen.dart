// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:islami_app/app_colors.dart';
//
// class RadioTab extends StatefulWidget {
//   const RadioTab({super.key});
//
//   @override
//   State<RadioTab> createState() => _RadioTabState();
// }
//
// class _RadioTabState extends State<RadioTab> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         SizedBox(height: 100),
//         Image.asset("assets/images/radio_bg.png", height: 222),
//         SizedBox(height: 100),
//         Text(
//           "إذاعة القرآن الكريم",
//           style: GoogleFonts.elMessiri(
//             fontSize: 24,
//             fontWeight: FontWeight(700),
//           ),
//           textAlign: TextAlign.center,
//         ),
//
//         SizedBox(height: 50),
//
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             GestureDetector(
//               onTap: () {},
//               child: Icon(
//                 Icons.skip_previous,
//                 size: 50,
//                 color: AppColors.PrimaryColor,
//               ),
//             ),
//
//             GestureDetector(
//               onTap: () {},
//               child: Icon(Icons.pause, size: 50, color: AppColors.PrimaryColor),
//             ),
//             GestureDetector(
//               onTap: () {},
//               child: Icon(
//                 Icons.skip_next,
//                 size: 50,
//                 color: AppColors.PrimaryColor,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// lib/radio/radio_tab.dart

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/api_models/radio_model.dart';
import 'package:islami_app/home/api_models/radio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:islami_app/app_colors.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  List<RadioModel> _radios = [];
  int _currentIndex = 0;

  bool _isLoading = true;
  bool _isBuffering = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadRadios();

    // بنسمع لحالة التشغيل عشان نغير الأيقونة (play/pause) ونعرض
    // مؤشر تحميل وقت الـ buffering بتاع البث المباشر
    _audioPlayer.playerStateStream.listen((state) {
      if (!mounted) return;

      setState(() {
        _isBuffering =
            state.processingState == ProcessingState.loading ||
            state.processingState == ProcessingState.buffering;
      });
    });
  }

  Future<void> _loadRadios() async {
    try {
      final radios = await RadioService.getRadios();

      if (!mounted) return;

      setState(() {
        _radios = radios;
        _isLoading = false;
      });

      if (radios.isNotEmpty) {
        await _playCurrent();
      }
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _isLoading = false;
        _errorMessage = 'حدث خطأ أثناء تحميل الإذاعات';
      });
    }
  }

  Future<void> _playCurrent() async {
    if (_radios.isEmpty) return;

    try {
      await _audioPlayer.setUrl(_radios[_currentIndex].url);
      await _audioPlayer.play();
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _errorMessage = 'تعذر تشغيل هذه الإذاعة';
      });
    }
  }

  void _togglePlayPause() {
    if (_audioPlayer.playing) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
    setState(() {});
  }

  void _playNext() {
    if (_radios.isEmpty) return;

    setState(() {
      _currentIndex = (_currentIndex + 1) % _radios.length;
    });

    _playCurrent();
  }

  void _playPrevious() {
    if (_radios.isEmpty) return;

    setState(() {
      _currentIndex = (_currentIndex - 1 + _radios.length) % _radios.length;
    });

    _playCurrent();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.outline,));
    }

    if (_errorMessage != null && _radios.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _errorMessage!,
              style: GoogleFonts.elMessiri(
                fontSize: 18,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isLoading = true;
                  _errorMessage = null;
                });
                _loadRadios();
              },
              child: Text(
                'إعادة المحاولة',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
      );
    }

    final currentRadio = _radios[_currentIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 100),
        Image.asset("assets/images/radio_bg.png", height: 222),
        SizedBox(height: 60),

        Text(
          "holy_quran_radio".tr(),
          style: GoogleFonts.elMessiri(
            fontSize: 24,
            fontWeight: FontWeight(700),
            color: Theme.of(context).colorScheme.onSurface,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 60),

        // اسم الإذاعة الحالية بدل النص الثابت
        Text(
          currentRadio.name,
          style: GoogleFonts.elMessiri(
            fontSize: 24,
            fontWeight: FontWeight(700),
            color: Theme.of(context).colorScheme.onSurface,
          ),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: 10),

        // مؤشر صغير وقت ما البث بيعمل buffering
        if (_isBuffering)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ),

        SizedBox(height: 30),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: _playPrevious,
              child: Icon(
                Icons.skip_previous,
                size: 50,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),

            StreamBuilder<PlayerState>(
              stream: _audioPlayer.playerStateStream,
              builder: (context, snapshot) {
                final playing = snapshot.data?.playing ?? false;

                return GestureDetector(
                  onTap: _togglePlayPause,
                  child: Icon(
                    playing ? Icons.pause : Icons.play_arrow,
                    size: 50,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                );
              },
            ),

            GestureDetector(
              onTap: _playNext,
              child: Icon(
                Icons.skip_next,
                size: 50,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
