import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quantsapp_task/audio_model.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  List<String> typeofmusic = [
    "Trending right now",
    "Rock",
    "Hip Hop",
    "Electro",
    "Classical"
  ];

  List<AudioModel> trendingAudio = [
    const AudioModel(
      title: 'The Dark Side',
      artist: 'Muse-Simulation Theory',
      audiourl: 'audiofile/the_dark_side.mp3',
      imageurl: 'assets/images/the_dark_side.jpg',
      songId: 26334,
    ),
    const AudioModel(
      title: 'Thought Contagion',
      artist: 'Muse-Simulation Theory',
      audiourl: 'audiofile/thought_contagion.mp3',
      imageurl: 'assets/images/thought_contagion.jpg',
      songId: 34345,
    ),
  ];
  
  List<AudioModel> audiolist = [
    const AudioModel(
      title: 'I am Good',
      artist: 'David Gueta & Bebe Rexha',
      audiourl: 'audiofile/i_am_good.mp3',
      imageurl: 'assets/images/i_am_good.jpg',
      songId: 23355,
    ),
    const AudioModel(
      title: 'Under the Influence',
      artist: 'Chris Brown',
      audiourl: 'audiofile/under_the_influence.mp3',
      imageurl: 'assets/images/under_the_influence.jpg',
      songId: 43523,
    ),
    const AudioModel(
      title: 'Forget me',
      artist: 'Lewis Capaldi',
      audiourl: 'audiofile/forget_me.mp3',
      imageurl: 'assets/images/forget_me.jpg',
      songId: 35235,
    ),
  ];

  final player = AudioPlayer();
  int currentsongId = 0;
  bool _isPlaying = false;

  playSound(String path) {
    setState(() {
      _isPlaying = !_isPlaying;
      _isPlaying ? player.play(AssetSource(path)) : player.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 70, 0, 0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white10,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu, color: Colors.white24),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white10,
                  ),
                  child: const TextField(
                    cursorColor: Colors.white24,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white24),
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search, color: Colors.white24),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(height: 25),
                const Text(
                  "Trending right now",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 170,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: trendingAudio.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: SizedBox(
                          width: 250,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  trendingAudio[index].imageurl,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                              const Positioned(
                                top: 15,
                                right: 15,
                                child: Icon(
                                  Icons.more_horiz,
                                  color: Colors.white,
                                ),
                              ),
                              Positioned(
                                bottom: 15,
                                left: 15,
                                right: 15,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.indigo.withOpacity(0.3),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            trendingAudio[index].title,
                                            style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            children: [
                                              const Icon(
                                                CupertinoIcons.music_note_2,
                                                color: Colors.white,
                                                size: 8,
                                              ),
                                              Text(
                                                trendingAudio[index].artist,
                                                style: const TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white60,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          currentsongId =
                                              trendingAudio[index].songId;
                                          playSound(
                                              trendingAudio[index].audiourl);
                                        },
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Colors.white,
                                          child: Icon(
                                            _isPlaying &&
                                                    currentsongId ==
                                                        trendingAudio[index]
                                                            .songId
                                                ? Icons.pause
                                                : Icons.play_arrow_sharp,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 35,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: typeofmusic.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 66, 35, 101),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              typeofmusic[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: audiolist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20, right: 20),
                      child: InkWell(
                        onTap: () {
                          playSound(audiolist[index].audiourl);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                      audiolist[index].imageurl,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      audiolist[index].title,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.person,
                                          size: 12,
                                          color: Colors.white54,
                                        ),
                                        Text(
                                          audiolist[index].artist,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white38,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Icon(
                              CupertinoIcons.heart,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
