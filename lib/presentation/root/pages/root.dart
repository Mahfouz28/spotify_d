import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/is_dark_mode.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_color.dart';
import 'package:spotify/presentation/root/widgets/news_songs.dart';

class RootPage extends StatefulWidget {
  RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(AppVectors.searsh),
                  Image.asset(AppVectors.spotifyLogo, height: 33, width: 108),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_rounded),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 170,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SvgPicture.asset(AppVectors.homePageCard),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 44),
                      child: Image.asset(AppVectors.billieEillieshHomePage),
                    ),
                  ),
                ],
              ),
            ),
            taps(),
            SizedBox(
              height: 260,
              child: TabBarView(
                controller: tabController,
                children: [NewsSongs(), Container(), Container(), Container()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget taps() {
    return TabBar(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      labelPadding: EdgeInsets.symmetric(horizontal: 20),
      isScrollable: true,
      unselectedLabelColor: AppColors.gray,
      indicatorColor: AppColors.primaryColor,
      dividerColor: Colors.transparent,
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      controller: tabController,
      labelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      tabs: [
        Text('  News  '),
        Text('  Video  '),
        Text('  Artists  '),
        Text('  Podcast  '),
      ],
    );
  }
}
