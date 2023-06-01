import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quantsapp_task/audio_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<AudioModel> audiolist = [
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  icon: const Icon(Icons.arrow_back_ios_new_outlined,
                      color: Colors.white24),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white10,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.heart, color: Colors.white24),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(height: 25),
                const Text(
                  "Recent favourites",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                 
                  ),
                  itemCount: audiolist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(alignment: Alignment.center,
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                audiolist[index].imageurl,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          ),
                          Text(
                            audiolist[index].title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                              overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            
                            audiolist[index].artist,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
