// This example demonstrates how to play a playlist with a mix of URI and asset
// audio sources, and the ability to add/remove/reorder playlist items.
//
// To run:
//
// flutter run -t lib/example_playlist.dart

import 'package:audio_session/audio_session.dart';
import 'package:book_ogabek/src/Utils/utils.dart';
import 'package:book_ogabek/src/app_theme/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'common.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> with WidgetsBindingObserver {
  late AudioPlayer _player;
  final _playlist = ConcatenatingAudioSource(children: [
    if (kIsWeb ||
        ![TargetPlatform.windows, TargetPlatform.linux]
            .contains(defaultTargetPlatform))
      ClippingAudioSource(
        start: const Duration(seconds: 60),
        end: const Duration(seconds: 90),
        child: AudioSource.uri(Uri.parse(
            "https://xn--80anjg9azc.me/music/artem-tatischevskiy-segodnya-ya-umru-dlya-tebya/")),
        tag: AudioMetadata(
          album: "Science Friday",
          title: "A Salute To Head-Scratching Science (30 seconds)",
          artwork:
              "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
        ),
      ),
    AudioSource.uri(
      Uri.parse(
          "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3"),
      tag: AudioMetadata(
        album: "Science Friday",
        title: "A Salute To Head-Scratching Science",
        artwork:
            "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
      ),
    ),
    AudioSource.uri(
      Uri.parse("https://s3.amazonaws.com/scifri-segments/scifri201711241.mp3"),
      tag: AudioMetadata(
        album: "Science Friday",
        title: "From Cat Rheology To Operatic Incompetence",
        artwork:
            "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
      ),
    ),
    AudioSource.uri(
      Uri.parse("asset:///audio/nature.mp3"),
      tag: AudioMetadata(
        album: "Public Domain",
        title: "Nature Sounds",
        artwork:
            "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
      ),
    ),
  ]);
  int _addedCount = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    _player = AudioPlayer();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    _init();
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      if (kDebugMode) {
        print('A stream error occurred: $e');
      }
    });
    try {
      // Preloading audio is not currently supported on Linux.
      await _player.setAudioSource(_playlist,
          preload: kIsWeb || defaultTargetPlatform != TargetPlatform.linux);
    } catch (e) {
      // Catch load errors: 404, invalid url...
      if (kDebugMode) {
        print("Error loading audio source: $e");
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    _player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      _player.stop();
    }
  }

  bool save = false;

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: StreamBuilder<SequenceState?>(
                  stream: _player.sequenceStateStream,
                  builder: (context, snapshot) {
                    final state = snapshot.data;
                    if (state?.sequence.isEmpty ?? true)
                      return const SizedBox();
                    final metadata = state!.currentSource!.tag as AudioMetadata;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Image.network(
                            metadata.artwork,
                            fit: BoxFit.cover,
                          ),
                          height: 370 * h,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(bottom: 24 * h),
                        ),
                        Container(
                          height: 84 * h,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                            left: 16 * w,
                            right: 18 * w,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Text(
                                  "НИ СЫ. Будь уверен в своих силах и не позволяй сомнениям мешать двигаться тебе вперед",
                                  style: TextStyle(
                                    color: AppTheme.black,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20 * o,
                                    height: 28 / 20 * h,
                                  ),
                                ),
                                height: 84 * h,
                                width:
                                    MediaQuery.of(context).size.width - 83 * w,
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    save = !save;
                                  });
                                },
                                child: save
                                    ? SvgPicture.asset(
                                        "assets/icons/my_books.svg",
                                      )
                                    : SvgPicture.asset(
                                        "assets/icons/mark.svg",
                                      ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 25 * h,
                          width: 135 * h,
                          margin: EdgeInsets.only(top: 16 * h, left: 16 * w),
                          child: Row(
                            children: [
                              Text(
                                "Джен Синсеро",
                                style: TextStyle(
                                  color: AppTheme.black6A,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16 * o,
                                ),
                              ),
                              const Spacer(),
                              SvgPicture.asset("assets/icons/arrow_right.svg"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24 * h,
                        ),
                        Container(
                          height: 22 * h,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 16 * w),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/more.svg",
                              ),
                              SizedBox(
                                width: 8 * w,
                              ),
                              Text(
                                "Содержание",
                                style: TextStyle(
                                  fontFamily: AppTheme.fontFamilyManrope,
                                  color: AppTheme.black6A,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16 * o,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "Длительность: 06:29:08",
                                style: TextStyle(
                                  fontFamily: AppTheme.fontFamilyManrope,
                                  color: AppTheme.black9E,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16 * o,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Text(metadata.album,
                        //     style: Theme.of(context).textTheme.headline6),
                        // Text(metadata.title),
                      ],
                    );
                  },
                ),
              ),
              StreamBuilder<PositionData>(
                stream: _positionDataStream,
                builder: (context, snapshot) {
                  final positionData = snapshot.data;
                  return SeekBar(
                    duration: positionData?.duration ?? Duration.zero,
                    position: positionData?.position ?? Duration.zero,
                    bufferedPosition:
                        positionData?.bufferedPosition ?? Duration.zero,
                    onChangeEnd: (newPosition) {
                      _player.seek(newPosition);
                    },
                  );
                },
              ),
              ControlButtons(_player),

              const SizedBox(height: 8.0),
              Row(
                children: [
                  StreamBuilder<LoopMode>(
                    stream: _player.loopModeStream,
                    builder: (context, snapshot) {
                      final loopMode = snapshot.data ?? LoopMode.off;
                      const icons = [
                        Icon(Icons.repeat, color: Colors.grey),
                        Icon(Icons.repeat, color: Colors.orange),
                        Icon(Icons.repeat_one, color: Colors.orange),
                      ];
                      const cycleModes = [
                        LoopMode.off,
                        LoopMode.all,
                        LoopMode.one,
                      ];
                      final index = cycleModes.indexOf(loopMode);
                      return IconButton(
                        icon: icons[index],
                        onPressed: () {
                          _player.setLoopMode(cycleModes[
                              (cycleModes.indexOf(loopMode) + 1) %
                                  cycleModes.length]);
                        },
                      );
                    },
                  ),
                  Expanded(
                    child: Text(
                      "Playlist",
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  StreamBuilder<bool>(
                    stream: _player.shuffleModeEnabledStream,
                    builder: (context, snapshot) {
                      final shuffleModeEnabled = snapshot.data ?? false;
                      return IconButton(
                        icon: shuffleModeEnabled
                            ? const Icon(Icons.shuffle, color: Colors.orange)
                            : const Icon(Icons.shuffle, color: Colors.grey),
                        onPressed: () async {
                          final enable = !shuffleModeEnabled;
                          if (enable) {
                            await _player.shuffle();
                          }
                          await _player.setShuffleModeEnabled(enable);
                        },
                      );
                    },
                  ),
                ],
              ),
              // SizedBox(
              //   height: 240.0,
              //   child: StreamBuilder<SequenceState?>(
              //     stream: _player.sequenceStateStream,
              //     builder: (context, snapshot) {
              //       final state = snapshot.data;
              //       final sequence = state?.sequence ?? [];
              //       return ReorderableListView(
              //         onReorder: (int oldIndex, int newIndex) {
              //           if (oldIndex < newIndex) newIndex--;
              //           _playlist.move(oldIndex, newIndex);
              //         },
              //         children: [
              //           for (var i = 0; i < sequence.length; i++)
              //             Dismissible(
              //               key: ValueKey(sequence[i]),
              //               background: Container(
              //                 color: Colors.redAccent,
              //                 alignment: Alignment.centerRight,
              //                 child: const Padding(
              //                   padding: EdgeInsets.only(right: 8.0),
              //                   child: Icon(Icons.delete, color: Colors.white),
              //                 ),
              //               ),
              //               onDismissed: (dismissDirection) {
              //                 _playlist.removeAt(i);
              //               },
              //               child: Material(
              //                 color: i == state!.currentIndex
              //                     ? Colors.grey.shade300
              //                     : null,
              //                 child: ListTile(
              //                   title: Text(sequence[i].tag.title as String),
              //                   onTap: () {
              //                     _player.seek(Duration.zero, index: i);
              //                   },
              //                 ),
              //               ),
              //             ),
              //         ],
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            _playlist.add(AudioSource.uri(
              Uri.parse("asset:///audio/nature.mp3"),
              tag: AudioMetadata(
                album: "Public Domain",
                title: "Nature Sounds ${++_addedCount}",
                artwork:
                    "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
              ),
            ));
          },
        ),
      ),
    );
  }
}

class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  const ControlButtons(this.player, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // IconButton(
            //   icon: const Icon(Icons.volume_up),
            //   onPressed: () {
            //     showSliderDialog(
            //       context: context,
            //       title: "Adjust volume",
            //       divisions: 10,
            //       min: 0.0,
            //       max: 1.0,
            //       value: player.volume,
            //       stream: player.volumeStream,
            //       onChanged: player.setVolume,
            //     );
            //   },
            // ),
            StreamBuilder<SequenceState?>(
              stream: player.sequenceStateStream,
              builder: (context, snapshot) => IconButton(
                icon: const Icon(Icons.skip_previous),
                onPressed: player.hasPrevious ? player.seekToPrevious : null,
              ),
            ),
            SizedBox(width: 45*w,),
SvgPicture.asset("assets/icons/back30.svg"),
            SizedBox(width: 40*w,),
            StreamBuilder<PlayerState>(
              stream: player.playerStateStream,
              builder: (context, snapshot) {
                final playerState = snapshot.data;
                final processingState = playerState?.processingState;
                final playing = playerState?.playing;
                if (processingState == ProcessingState.loading ||
                    processingState == ProcessingState.buffering) {
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    width: 72.0,
                    height: 72.0,
                    child: const CircularProgressIndicator(),
                  );
                } else if (playing != true) {
                  return IconButton(
                    icon: const Icon(Icons.play_circle_fill),
                    iconSize: 72.0,
                    onPressed: player.play,
                  );
                } else if (processingState != ProcessingState.completed) {
                  return IconButton(
                    icon: const Icon(Icons.pause_circle_filled),
                    iconSize: 72.0,
                    onPressed: player.pause,
                  );
                } else {
                  return IconButton(
                    icon: const Icon(Icons.replay),
                    iconSize: 72.0,
                    onPressed: () => player.seek(Duration.zero,
                        index: player.effectiveIndices!.first),
                  );
                }
              },
            ),
            SizedBox(width: 40*w,),
            SvgPicture.asset("assets/icons/forward30.svg"),
            SizedBox(width: 45*w,),
            StreamBuilder<SequenceState?>(
              stream: player.sequenceStateStream,
              builder: (context, snapshot) => IconButton(
                icon: const Icon(Icons.skip_next),
                onPressed: player.hasNext ? player.seekToNext : null,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 16 * w,
            ),
            SvgPicture.asset("assets/icons/circle.svg"),
            SizedBox(
              width: 8 * w,
            ),
            Text(
              "Скорость",
              style: TextStyle(
                color: AppTheme.black6A,
                fontSize: 16 * o,
                fontFamily: AppTheme.fontFamilyManrope,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
              ),
            ),
            StreamBuilder<double>(
              stream: player.speedStream,
              builder: (context, snapshot) => IconButton(
                icon: Text(
                  "${snapshot.data?.toStringAsFixed(1)}x",
                  style: TextStyle(
                    color: AppTheme.black6A,
                    fontSize: 16 * o,
                    fontFamily: AppTheme.fontFamilyManrope,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  showSliderDialog(
                    context: context,
                    title: "Adjust speed",
                    divisions: 10,
                    min: 0.5,
                    max: 1.5,
                    value: player.speed,
                    stream: player.speedStream,
                    onChanged: player.setSpeed,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AudioMetadata {
  final String album;
  final String title;
  final String artwork;

  AudioMetadata({
    required this.album,
    required this.title,
    required this.artwork,
  });
}
