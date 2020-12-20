import 'dart:convert';

import 'package:duration/duration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/dialogs/AccountDialog.dart';
import 'package:flutter_app/models/bestpodcasts/Podcast.dart';
import 'package:flutter_app/models/playlist/playlist.dart';
import 'package:flutter_app/network/NetworkHelper.dart';
import 'package:flutter_app/pages/MyHomePage.dart';
import 'package:flutter_app/widgets/AudioPanel.dart';
import 'package:flutter_app/widgets/BottomSheet.dart';
import 'package:flutter_app/widgets/SimpleListDivider.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/services.dart' show rootBundle;

class MyHomePageState extends State<MyHomePage> {
  Future<Podcast> podcast;
  Future<List<Items>> playlist;

  @override
  void initState() {
    super.initState();
    podcast = GetPodcasts().getPodcasts();
    playlist = GetPlaylist().getPlaylist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
                backgroundColor: const Color(0xFF202225),
                floating: true,
                pinned: false,
                centerTitle: true,
                title: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Google ',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20.0)),
                  TextSpan(
                      text: 'Podcasts',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 19.0)),
                ])),
                actions: [
                  IconButton(
                    icon: Icon(Icons.account_circle),
                    iconSize: 32.0,
                    splashRadius: 18.0,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) => createAccountDialog(context),
                          barrierDismissible: true);
                    },
                  )
                ]),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    height: 120,
                    child: FutureBuilder<Podcast>(
                      future: podcast,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Row(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data.podcasts.length,
                                    itemBuilder: (context, index) {
                                      var podcast =
                                          snapshot.data.podcasts[index];
                                      return Center(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16.0, horizontal: 4.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                          child: Image.network(podcast.image,
                                              width: 90,
                                              height: 90,
                                              fit: BoxFit.fill),
                                        ),
                                      ));
                                    }),
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          print(snapshot.error);
                          return Text("No podcast now");
                        }
                        // By default, show a loading spinner.
                        return Container();
                      },
                    ),
                  ),
                  SimpleListDivider()
                ],
              ),
            ),
            FutureBuilder<List<Items>>(
              future: playlist,
              builder: (context, snapshot) {
                return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  if (snapshot.hasData) {
                    var episode = snapshot.data;
                    print(episode.length);
                    return InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ListTile(
                              title: Text(episode[index].data.podcast.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                  )),
                              subtitle: Text(timeago.format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      episode[index].data.pubDateMs))),
                              leading: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 42,
                                  minHeight: 42,
                                  maxWidth: 42,
                                  maxHeight: 42,
                                ),
                                child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                    child: Image.network(
                                        episode[index].data.image,
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Align(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Text(
                                    episode[index].data.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                              Align(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 16.0, top: 4.0),
                                  child: Text(
                                    episode[index].data.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: const Color(0xFF939699),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: InkWell(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(64)),
                                      highlightColor: Colors.transparent,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0, horizontal: 4.0),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(0xFF3C4043)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(64))),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.play_circle_outline,
                                              color: const Color(0xFF809ACF),
                                              size: 24,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4.0, right: 4.0),
                                              child: Text(
                                                printDuration(
                                                    Duration(
                                                        seconds: episode[index]
                                                            .data
                                                            .audioLengthSec),
                                                    abbreviated: false,
                                                    spacer: " ",
                                                    delimiter: " ",
                                                    tersity:
                                                        DurationTersity.minute),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.playlist_add,
                                      size: 24,
                                    ),
                                    color: const Color(0xFF809ACF),
                                    splashRadius: 16.0,
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_circle_down,
                                      size: 24,
                                    ),
                                    color: const Color(0xFF809ACF),
                                    splashRadius: 16.0,
                                    onPressed: () {},
                                  ),
                                ], mainAxisAlignment: MainAxisAlignment.start),
                              )
                            ],
                          ),
                          SimpleListDivider()
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    return SliverToBoxAdapter(child: Text("No playlist"));
                  }
                  return SliverToBoxAdapter(
                    child: Container(),
                  );
                }, childCount: snapshot.hasData ? snapshot.data.length : 0));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AudioPanel(
          miniPanel: Card(
              color: const Color(0xFF303035),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: ListTile(
                  title: Text(
                      "Undisciplined: Healthy Forests, Healthy People",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis
                  ),
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 42,
                      minHeight: 42,
                      maxWidth: 42,
                      maxHeight: 42,
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        child: Image.network(
                            "https://cdn-images-1.listennotes.com/podcasts/undisciplined-utah-public-radio-SbW73JyCp-l-xwIZs2mJyvU.300x300.jpg",
                            fit: BoxFit.cover)),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.play_arrow_outlined),
                    onPressed: () {},
                    iconSize: 24.0,
                    splashRadius: 14.0,
                    color: const Color(0xFF809ACF),
                  ),
                ),
              )),
          expandedPanel: Image.network("https://cdn-images-1.listennotes.com/podcasts/undisciplined-utah-public-radio-SbW73JyCp-l-xwIZs2mJyvU.300x300.jpg", width: 500, height: 500)),
          Divider(
              color: const Color(0xFF809ACF),
              thickness: 1.5,
              height: 1.0,
              endIndent: 300
          ),
          BottomNavigationBar(
            backgroundColor: const Color(0xFF202225),
            selectedItemColor: const Color(0xFF809ACF),
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            onTap: (value) {

            },
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home_filled),
              ),
              BottomNavigationBarItem(
                label: 'Explore',
                icon: Icon(Icons.search),
              ),
              BottomNavigationBarItem(
                label: 'Activity',
                icon: Icon(Icons.playlist_play_outlined),
              ),
            ],
          )
        ],
      ),
    );
  }
}
