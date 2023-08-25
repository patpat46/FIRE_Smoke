import 'package:flutter/material.dart';

class Manual extends StatefulWidget {
  const Manual({super.key});

  @override
  State<Manual> createState() => _ManualState();
}

class _ManualState extends State<Manual> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 254, 106, 0),
        body: Column(
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Manual',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Center(
              child: Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'วิธีการใช้งาน \n เลือกนำรูปภาพเข้ามาในรูปแบบถ่ายหรือเอาออกมาจากคลั่ง และรอการประมวลผล \n มีคำแนะนำสำหรับการใช้งานในหน้าที่เขียนว่า "Fire" ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  )),
            ),
          ],
        ));
  }
}
