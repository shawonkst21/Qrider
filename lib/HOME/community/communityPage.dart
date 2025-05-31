import 'package:bike/HOME/community/threadDetails.dart';
import 'package:bike/thread/dummy_thread.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'public safety wall',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: threadList.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final thread = threadList[index];
          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ThreadDetailPage(thread: thread),
                ),
              );
            },
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 26, 28, 41),
                      Colors.blueGrey.shade700,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            thread.status == 'Safe'
                                ? Colors.green[100]
                                : Colors.orange[100],
                        child: Text(
                          thread.riderName[0],
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              thread.riderName,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Plate: ${thread.numberPlate}",
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: Colors.white70),
                            ),
                            Text(
                              "Location: ${thread.location}",
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Chip(
                        label: Text(
                          thread.status == 'Safe' ? 'Safe' : 'Not Safe',
                          style: TextStyle(
                            color:
                                thread.status == 'Safe'
                                    ? Colors.green[800]
                                    : Colors.orange[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor:
                            thread.status == 'Safe'
                                ? Colors.green[50]
                                : Colors.orange[50],
                        avatar: Icon(
                          thread.status == 'Safe'
                              ? Icons.check_circle
                              : Icons.warning,
                          color:
                              thread.status == 'Safe'
                                  ? Colors.green
                                  : Colors.orange,
                          size: 20,
                        ),
                      ),
                    ],
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
