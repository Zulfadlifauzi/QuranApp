import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/provider/surah_provider.dart';
import 'detail_surah_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<IndexSurah>(context, listen: false).fetchIndexSurah();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(child: Consumer(
          // Consumer
          builder: (context, IndexSurah indexSurah, _) {
            if (indexSurah.indexSurah == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                primary: false,
                shrinkWrap: true,
                itemCount: indexSurah.indexSurah.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailSurahScreen(
                                    id: indexSurah.indexSurah[index]['nomor'],
                                  )));
                    },
                    leading: CircleAvatar(
                      child: Text(
                        indexSurah.indexSurah[index]['nomor'].toString(),
                      ),
                    ),
                    title: Text(
                      '${indexSurah.indexSurah[index]['namaLatin']} ${indexSurah.indexSurah[index]['nama']}',
                      textAlign: TextAlign.right,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${indexSurah.indexSurah[index]['jumlahAyat']} ayat'
                              .toString(),
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          indexSurah.indexSurah[index]['deskripsi'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        )));
  }
}
