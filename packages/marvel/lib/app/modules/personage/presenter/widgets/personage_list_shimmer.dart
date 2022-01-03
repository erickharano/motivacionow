import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PersonageListShimmer extends StatelessWidget {
  const PersonageListShimmer({
    Key? key,
  }) : super(key: key);

  Shimmer shimmer(Widget child) {
    return Shimmer.fromColors(
      child: Container(color: Colors.black, child: child),
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade200,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: 220,
          width: double.infinity,
          child: Row(
            children: <Widget>[
              shimmer(const SizedBox(height: 220, width: 180)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shimmer(
                        Row(
                          children: const [
                            Text(
                              "Titulo",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Column(
                          children: [
                            shimmer(
                              Row(
                                children: const [
                                  Text(
                                    "Titulo",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            shimmer(
                              Row(
                                children: const [
                                  Text(
                                    "Description",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
