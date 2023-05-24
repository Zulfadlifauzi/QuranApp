import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/provider/surah_provider.dart';

class DetailSurahScreen extends StatefulWidget {
  final int? id;
  const DetailSurahScreen({super.key, required this.id});

  @override
  State<DetailSurahScreen> createState() => _DetailSurahScreenState();
}

class _DetailSurahScreenState extends State<DetailSurahScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<IndexSurah>(context, listen: false).fetchShowSurah(widget.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: Consumer(
        builder: (context, IndexSurah value, child) {
          if (value.showSurah == null) {
            return const Text('sucks');
          } else {
            return ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                primary: false,
                separatorBuilder: (context, index) => const Divider(),
                itemCount: value.showSurah['ayat'].length,
                itemBuilder: (context, index) {
                  final ayat = value.showSurah['ayat'][index];
                  return ListTile(
                    title: Text(
                      ayat['teksArab'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          ayat['teksLatin'],
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          ayat['teksIndonesia'],
                          textAlign: TextAlign.left,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    trailing: Text(
                      ayat['nomorAyat'].toString(),
                    ),
                  );
                });
          }
        },
      )),
    );
  }
}
