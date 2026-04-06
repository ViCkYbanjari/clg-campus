import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart'; // Import this
import '../features/colors.dart';

class StudentGatepass extends StatefulWidget {
  const StudentGatepass({super.key});

  @override
  State<StudentGatepass> createState() => _StudentGatepassState();
}

class _StudentGatepassState extends State<StudentGatepass> {

  String studentName = "Loading...";
  String semester = "Loading...";
  final TextEditingController _reasonController = TextEditingController();

  // Date and Time variables
  String currentDate = "";
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    _loadStudentData();
    // Set current date
    final now = DateTime.now();
    currentDate = "${now.day}-${now.month}-${now.year}";
  }

  Future<void> _loadStudentData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      studentName = prefs.getString('fullName') ?? "Unknown Student";
      semester = prefs.getString('semester') ?? "Unknown Semester";
    });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  // --- NEW FUNCTION: Send to WhatsApp ---
  Future<void> _launchWhatsApp() async {
    // 1. Get the reason text. If empty, provide a default.
    String reason = _reasonController.text.trim();
    if (reason.isEmpty) reason = "Personal Work";

    // 2. Format the message clearly
    String message =
        "*GATE PASS REQUEST*\n\n"
        "*Name:* $studentName\n"
        "*Semester:* $semester\n"
        "*Branch:* Computer Science\n"
        "*Date:* $currentDate\n"
        "*Time:* ${selectedTime.format(context)}\n"
        "*Reason:* $reason\n\n"
        "✅ *Status:* Approved by HOD";

    // 3. Create the WhatsApp URL
    // Use 'whatsapp://send' to open the app directly.
    // If you have a specific security guard number, use: whatsapp://send?phone=919999999999&text=...
    final String whatsappUrl = "whatsapp://send?text=${Uri.encodeComponent(message)}";
    final Uri uri = Uri.parse(whatsappUrl);

    // 4. Launch the URL
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        // Fallback if whatsapp:// scheme fails (e.g. on some emulators)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Could not open WhatsApp. Make sure it is installed.")),
        );
      }
    } catch (e) {
      print("Error launching WhatsApp: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Defining colors based on the image
    final Color bgLightPurple = const Color(0xFFE2E6FF);
    final Color textDark = const Color(0xFF1A1A1A);
    final Color textGrey = const Color(0xFF666666);
    final Color successBg = const Color(0xFFE0F3DD);
    final Color successText = const Color(0xFF2E7D32);
    final Color whatsappGreen = const Color(0xFF2E7D32);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        elevation: 0,
        title: const Text(
            'Gate Pass',
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w600, color: Colors.black87)
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: bgLightPurple,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- Profile Header ---
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person, size: 40, color: Colors.brown),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                studentName,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: textDark,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Computer Science\nBranch',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: textGrey,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // --- Semester Info ---
                      Text(
                        semester,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: textDark,
                        ),
                      ),
                      Text(
                        'Current Semester',
                        style: TextStyle(color: textGrey, fontSize: 12),
                      ),

                      const SizedBox(height: 25),

                      // --- Leave Details Header ---
                      Text("Reason", style: TextStyle(color: Color(0xFF555555), fontSize: 15)),
                      SizedBox(height: 5),
                      TextField(
                        controller: _reasonController,
                        decoration: InputDecoration(
                          hintText: "Enter reason for leave...",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        ),
                      ),

                      const SizedBox(height: 15),

                      // --- Date (Auto Filled) ---
                      _buildDetailRow('Date', currentDate),

                      const SizedBox(height: 15),

                      // --- Time (Changeable) ---
                      InkWell(
                        onTap: () => _selectTime(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Time",
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color(0xFF555555),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    selectedTime.format(context),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF1A1A1A),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(Icons.access_time, size: 18, color: Colors.grey),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // This 'Send Request' button can call the same function or a backend API
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Request Saved Locally"))
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: TextDarkBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 0,
                          ),
                          icon: const Icon(Icons.send, color: Colors.white),
                          label: const Text(
                            'Send Request',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: cardLightGreen1,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: successBg,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'HOD Permission',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: textDark,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Approved',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: successText,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.check_circle,
                                color: successText,
                                size: 32,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // --- WhatsApp Button (Updated) ---
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton.icon(
                            // --- CONNECTED FUNCTION HERE ---
                            onPressed: _launchWhatsApp,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: whatsappGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 0,
                            ),
                            icon: const Icon(Icons.chat_bubble_outline, color: Colors.white),
                            label: const Text(
                              'Send to Security via WhatsApp',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF555555),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ],
      ),
    );
  }
}