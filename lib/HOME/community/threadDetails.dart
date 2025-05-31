import 'package:animate_do/animate_do.dart';
import 'package:bike/thread/thread_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ThreadDetailPage extends StatefulWidget {
  final ThreadModel thread;

  const ThreadDetailPage({super.key, required this.thread});

  @override
  State<ThreadDetailPage> createState() => _ThreadDetailPageState();
}

class _ThreadDetailPageState extends State<ThreadDetailPage> {
  final TextEditingController _commentController = TextEditingController();
  List<String> _comments = [];

  @override
  void initState() {
    super.initState();
    _comments = List.from(widget.thread.comments);
  }

  void _addComment() {
    final comment = _commentController.text.trim();
    if (comment.isNotEmpty) {
      setState(() {
        _comments.add(comment);
        widget.thread.comments.add(comment);
      });
      _commentController
          .clear(); // Move clear outside setState for better UI update
    }
  }

  void _markSafe(TextEditingController reasonController, BuildContext context) {
    final reason = reasonController.text.trim();
    if (reason.isNotEmpty) {
      setState(() {
        widget.thread.status = 'Safe';
        widget.thread.safeReason = reason;
        final safeComment = '✅ Rider marked safe (Reason: $reason)';
        _comments.add(safeComment);
        widget.thread.comments.add(safeComment);
      });
      Navigator.of(context).pop();
    }
  }

  void _showMarkSafeDialog() {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) {
        final reasonController = TextEditingController();
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Material(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.verified_user_rounded,
                      color: Colors.green,
                      size: 36,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Reason for Marking Safe',
                      style: GoogleFonts.poppins(
                        // fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: reasonController,
                      decoration: InputDecoration(
                        hintText: 'e.g. Family contacted',
                        hintStyle: GoogleFonts.poppins(
                          color: Colors.blueGrey[300],
                          fontStyle: FontStyle.italic,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.green[600]!,
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 9, 220, 174),
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                      ),
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => _markSafe(reasonController, context),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.check_circle,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Mark Safe',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[700],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.all(10),
                          textStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        onPressed: () => _markSafe(reasonController, context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final thread = widget.thread;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Rider Status',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInDown(
              duration: const Duration(milliseconds: 900),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      thread.riderName,
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.directions_bike,
                          size: 18,
                          color: Colors.blueGrey[400],
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Plate: ${thread.numberPlate}',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.blueGrey[700],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 18,
                          color: Colors.red[300],
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Location: ${thread.location}',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.blueGrey[700],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Chip(
                      label: Text(
                        'Status: ${thread.status}',
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
                    const SizedBox(height: 12),
                    Text(
                      thread.post,
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black87,
                      ),
                    ),
                    if (thread.status == 'Safe' && thread.safeReason != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          '✅ Reason: ${thread.safeReason!}',
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const Divider(height: 32),
            Row(
              children: [
                Icon(Icons.forum, color: Colors.blueGrey[400]),
                const SizedBox(width: 8),
                Text(
                  'Comments',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.blueGrey[800],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child:
                  _comments.isEmpty
                      ? Center(
                        child: Text(
                          'No comments yet.',
                          style: GoogleFonts.poppins(
                            color: Colors.blueGrey[400],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )
                      : ListView.separated(
                        itemCount: _comments.length,
                        separatorBuilder:
                            (_, __) => Divider(
                              color: Colors.grey[200],
                              height: 1,
                              thickness: 1,
                              indent: 12,
                              endIndent: 12,
                            ),
                        itemBuilder:
                            (context, index) => Container(
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[50],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.blueGrey[100],
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.blueGrey[600],
                                      size: 18,
                                    ),
                                    radius: 16,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      _comments[index],
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: Colors.blueGrey[900],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      ),
            ),
            if (thread.status != 'Safe')
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.07),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _commentController,
                          style: GoogleFonts.poppins(fontSize: 15),
                          decoration: InputDecoration(
                            hintText: 'Write a comment...',
                            hintStyle: GoogleFonts.poppins(
                              color: Colors.blueGrey[300],
                              fontStyle: FontStyle.italic,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Material(
                      color: Colors.blueAccent,
                      shape: const CircleBorder(),
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.white),
                        onPressed: _addComment,
                        splashRadius: 20,
                        tooltip: 'Send',
                        //  alignment: Alignment.botto,
                      ),
                    ),
                  ],
                ),
              ),
            if (thread.status != 'Safe')
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: OutlinedButton.icon(
                    icon: const Icon(
                      Icons.verified_user_rounded,
                      color: Colors.green,
                    ),
                    label: Text(
                      'Mark as Safe',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.green[700],
                        letterSpacing: 0.5,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.green[600]!, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      backgroundColor: Colors.green[50],
                    ),
                    onPressed: _showMarkSafeDialog,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
