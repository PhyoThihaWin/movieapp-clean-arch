import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp_clean_arch/domain/models/movie_vo.dart';
import 'package:movieapp_clean_arch/generated/locale_keys.g.dart';
import 'package:movieapp_clean_arch/page/favorite/favorite_page_provider.dart';
import 'package:movieapp_clean_arch/page/home/home_page.dart';
import 'package:movieapp_clean_arch/resource/dimens.dart';
import 'package:movieapp_clean_arch/widget/my_cached_network_image.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var favoriteMovies = ref.watch(favoriteMoviesProvider);
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: SectionTitleText(
            LocaleKeys.txtFavoriteMovies.tr(),
            fontSize: Dimens.TEXT_LARGE,
          ),
        ),
        body: favoriteMovies.when(
          data: (data) => ListView.builder(
            padding: const EdgeInsets.all(Dimens.MARGIN_MEDIUM),
            itemCount: data.length,
            itemBuilder: (context, index) => FavoriteMovieItemView(
              movieVo: data[index],
            ),
          ),
          error: (error, stackTrace) {},
          loading: () {},
        ));
  }
}

class FavoriteMovieItemView extends StatelessWidget {
  final MovieVo movieVo;
  const FavoriteMovieItemView({super.key, required this.movieVo});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Dimens.MARGIN_MEDIUM),
                  bottomLeft: Radius.circular(Dimens.MARGIN_MEDIUM)),
              child: MyCachedNetworkImage(
                height: 100,
                width: 90,
                imageUrl: movieVo.posterPath,
              ),
            ),
            const SizedBox(
              width: Dimens.MARGIN_10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: Dimens.MARGIN_MEDIUM_2,
                    bottom: Dimens.MARGIN_MEDIUM_2,
                    right: Dimens.MARGIN_MEDIUM_2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movieVo.title,
                      style: const TextStyle(
                          fontSize: Dimens.TEXT_REGULAR_3,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: Dimens.MARGIN_SMALL,
                    ),
                    Text(
                      movieVo.overview.substring(0, 100),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: Dimens.TEXT_REGULAR),
                    ),
                    const SizedBox(
                      height: Dimens.MARGIN_XSMALL,
                    ),
                    Text(
                      movieVo.releaseDate,
                      style: const TextStyle(fontSize: Dimens.TEXT_REGULAR),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
