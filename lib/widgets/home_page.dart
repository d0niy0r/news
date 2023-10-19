import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_1/models/Repository.dart';

class HomePage extends StatelessWidget {
  final now = DateTime.now();
  final list1 = Repository.list;

  // static List<Repository> list = [
  //   Repository("CNN", "assets/image/1.jpg",
  //       "Biden offers message for KIm Jong Un as he prepares to wrap first leg of his Asia trip-Cnn"),
  //   Repository("Reuters", "assets/image/2.jpg",
  //       "Palestine supporters march in London against Israel action in Gaza - Reuters"),
  //   Repository("CNN", "assets/image/3.jpg",
  //       "Trump tells judge he will appeal gag order in federal election interference case - NBC News"),
  //   Repository("CNN", "assets/image/4.jpg",
  //       "Drug retailer Rite Aid files for bankruptcy amid rising debt, opioid litigation - Reuters"),
  //   Repository("CNN", "assets/image/1.jpg", ""),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      DateFormat("EEEE, d MMMM").format(DateTime.now()),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "Breaking News",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 100),
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(
                  top: 14,
                  left: 14,
                  right: 14,
                ),
                itemCount: list1.length,
                itemBuilder: (BuildContext context, int index) {
                  return News(list1[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget News(Repository repository) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      elevation: 14,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    repository.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    repository.subtitle,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    DateFormat("MMM d, y").format(DateTime.now()),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 150,
              width: 150,
              margin: EdgeInsets.all(10),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                repository.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
