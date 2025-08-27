import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/configs/theme/app_color.dart';
import 'package:spotify/domain/entities/songs_entities/songs_entities.dart';
import 'package:spotify/presentation/root/bloc/news_songs_cubit.dart';
import 'package:spotify/service_locator.dart';
import 'package:spotify/presentation/root/bloc/news_songs_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NewsSongs extends StatefulWidget {
  const NewsSongs({super.key});

  @override
  State<NewsSongs> createState() => _NewsSongsState();
}

class _NewsSongsState extends State<NewsSongs> {
  List<String> covers = [];

  @override
  void initState() {
    super.initState();
    _loadCovers();
  }

  Future<void> _loadCovers() async {
    final urls = await CoversService().fetchAllCovers();
    setState(() {
      covers = urls;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit(sl())..fetchNewsSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
          builder: (context, state) {
            if (state is NewsSongsLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              );
            }

            if (state is NewsSongsLoaded) {
              return songs(state.songs, covers);
            }

            return const Center(
              child: Text(
                "No songs found",
                style: TextStyle(color: Colors.black),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget songs(List<SongsEntities> songs, List<String> covers) {
  return ListView.separated(
    scrollDirection: Axis.horizontal,
    shrinkWrap: true,
    itemBuilder: (BuildContext context, int index) {
      final String? coverUrl =
          (covers.isNotEmpty && index < covers.length) ? covers[index] : null;

      return Column(
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[900],
            ),
            clipBehavior: Clip.antiAlias,
            child:
                coverUrl != null
                    ? Image.network(
                      coverUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error, color: Colors.red);
                      },
                    )
                    : const Icon(Icons.music_note, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            songs[index].titel,
            style: const TextStyle(color: Colors.white, fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      );
    },
    separatorBuilder: (BuildContext context, int index) {
      return const SizedBox(width: 14);
    },
    itemCount: songs.length,
  );
}

class CoversService {
  final SupabaseClient _supabase = Supabase.instance.client;

  /// Fetch all covers from Supabase bucket named "Covers"
  Future<List<String>> fetchAllCovers() async {
    try {
      final response = await _supabase.storage.from('Covers').list();

      List<String> coversUrls =
          response.map((file) {
            final String url = _supabase.storage
                .from('Covers')
                .getPublicUrl(file.name);
            print("COVER URL: $url"); // Debug print
            return url;
          }).toList();

      return coversUrls;
    } catch (e) {
      print('Error fetching covers: $e');
      return [];
    }
  }
}
