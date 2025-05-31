import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_flutter/icons_flutter.dart';

class SlidebarNoti extends StatefulWidget {
  const SlidebarNoti({super.key});

  @override
  State<SlidebarNoti> createState() => _SlidebarNotiState();
}

class _SlidebarNotiState extends State<SlidebarNoti> {
  // Example dummy notification list
  List<String> notifications = [
    'Shawon Sadman has encountered an accident near Dhanmondi.',
    'A rider reported injured in Mirpur. Check Community.',
    'New incident reported by Anik. View details in Community.',
  ];

  bool hasNewNotification = true;

  void _showNotificationsDialog() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Notifications",
      transitionDuration: const Duration(milliseconds: 450),
      pageBuilder: (context, anim1, anim2) {
        return const SizedBox.shrink(); // Required but not used
      },
      transitionBuilder: (context, anim1, anim2, child) {
        final scale = Tween<double>(
          begin: 0.8,
          end: 1.0,
        ).animate(CurvedAnimation(parent: anim1, curve: Curves.easeOutBack));
        return Transform.scale(
          scale: scale.value,
          child: Opacity(
            opacity: anim1.value,
            child: AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Row(
                children: [
                  const Icon(
                    Icons.notifications_active_rounded,
                    color: Colors.deepPurple,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Notifications',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: notifications.length,
                  separatorBuilder:
                      (context, index) => Divider(
                        thickness: 1,
                        height: 16,
                        color: Colors.grey[300],
                      ),
                  itemBuilder:
                      (context, index) => Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.08),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              color: Colors.red[50],
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(6),
                            child: const Icon(
                              Icons.warning_amber_rounded,
                              color: Colors.redAccent,
                            ),
                          ),
                          title: Text(
                            notifications[index],
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                        ),
                      ),
                ),
              ),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.deepPurple,
                    textStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    backgroundColor: Colors.deepPurple.withOpacity(0.08),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    ).then((_) {
      setState(() {
        hasNewNotification = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(FlutterIcons.menu_fea),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
        ),
        Stack(
          children: [
            IconButton(
              icon: const Icon(FlutterIcons.notification_ant),
              onPressed: _showNotificationsDialog,
            ),
            if (hasNewNotification)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
