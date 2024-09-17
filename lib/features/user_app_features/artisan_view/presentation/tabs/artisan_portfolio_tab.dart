import 'package:blue_collar_app/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ArtisanPortfolioPage extends StatefulWidget {
  const ArtisanPortfolioPage({super.key});

  @override
  State<ArtisanPortfolioPage> createState() => _ArtisanPortfolioPageState();
}

class _ArtisanPortfolioPageState extends State<ArtisanPortfolioPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 6,
                axisDirection: AxisDirection.down,
                crossAxisSpacing: 6,
                children: List.generate(7, (index) {
                  return Container(
                    width: size.width * .5,
                    padding: UtilityClass.horizontalPadding,
                    height: index % 2 == 0 ? size.width * .48 : size.width * .4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                  );
                })),
          ),
        ))
      ],
    );
  }
}
