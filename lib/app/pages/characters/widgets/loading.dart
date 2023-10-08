// imports nativos
import 'package:flutter/material.dart';

// import das telas
import 'package:teste_softdesign/app/core/style/app_images.dart';

// import dos paoctes
import 'package:shimmer_animation/shimmer_animation.dart';

class LoadingCharacters extends StatelessWidget {
  const LoadingCharacters({super.key});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      child: GridView.builder(
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: ( itemBuilder, index ) {

          return Card(
            shadowColor: Colors.grey,
            color: theme.colorScheme.tertiary,
            child: GridTile(
              header: Shimmer(
                duration: const Duration(seconds: 5),
                color: theme.colorScheme.secondary,
                colorOpacity: 0.3,
                enabled: true,
                direction: const ShimmerDirection.fromLTRB(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 8, 0),
                  child: Text(
                    "# $index",
                    textAlign: TextAlign.end,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ),
              footer: Shimmer(
                duration: const Duration(seconds: 5),
                color: theme.colorScheme.secondary,
                colorOpacity: 0.3,
                enabled: true,
                direction: const ShimmerDirection.fromLTRB(),
                child: GridTileBar(
                  backgroundColor: theme.colorScheme.primary.withOpacity(0.8),
                  title: Text(
                    "Marvel",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.displayMedium,
                  ),
                ),
              ),
              child: Shimmer(
                duration: const Duration(seconds: 5),
                color: theme.colorScheme.secondary,
                colorOpacity: 0.3,
                enabled: true,
                direction: const ShimmerDirection.fromLTRB(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Padding(
                    padding: const EdgeInsets.only( bottom: 20 ),
                    child: Image.asset(
                      AppImages.allHeroes,
                    ),
                  ),
                ),
              ),
            ),
          );

        },
      ),
    );
  }
}
