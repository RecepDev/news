import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonWidget extends StatelessWidget {
  const SkeletonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.zone(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: 222,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    clipBehavior: Clip.hardEdge,
                    elevation: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Stack(
                          children: [
                            SizedBox(
                              height: 200,
                              width: double.infinity,
                            )
                          ],
                        ),
                        Stack(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 75,
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height: 40,
                                          width:
                                              MediaQuery.sizeOf(context)
                                                  .width,
                                          child:  const Bone.text(width: 5555555))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Positioned(
                              bottom: 0,
                              right: 0,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Bone.text(),
                              )),
                        ])
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}