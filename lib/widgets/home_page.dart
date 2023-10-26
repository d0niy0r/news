import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_1/models/Repository.dart';
import 'package:new_1/widgets/news_page.dart';

class HomePage extends StatelessWidget {
  final now = DateTime.now();
  final list1 = Repository.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
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
                    const Text(
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
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    _showToast(context);
                  },
                )
              ],
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(
                  top: 14,
                  left: 14,
                  right: 14,
                ),
                itemCount: list1.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsPage(list1[index]),
                          ),
                        );
                      },
                      child: News(list1[index]));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
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

void _showToast(BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text("This is Setting's bar"),
      action: SnackBarAction(
        label: 'OK',
        onPressed: scaffold.hideCurrentSnackBar,
      ),
    ),
  );
}
