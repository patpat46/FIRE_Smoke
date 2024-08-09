import 'package:fire_smoke/screan/Firedef.dart';
import 'package:fire_smoke/screan/factor.dart';
import 'package:flutter/material.dart';

class FirePanicle extends StatefulWidget {
  const FirePanicle({Key? key}) : super(key: key);

  @override
  State<FirePanicle> createState() => _FirePanicleState();
}

class _FirePanicleState extends State<FirePanicle>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 106, 0),
      body: Column(
        children: [
          Container(
            height: 70,
            color: const Color.fromARGB(255, 254, 106, 0),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: const Text(
              "สาเหตุ และ การป้องกัน",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
          Container(
            height: 70,
            color: const Color.fromARGB(255, 254, 106, 0),
            child: Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.grey),
              ),
              child: TabBar(
                physics: const ClampingScrollPhysics(),
                indicatorSize:
                    TabBarIndicatorSize.tab, // ให้ indicator ครอบคลุมแท็บ
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                indicatorPadding: EdgeInsets.zero, // ปรับ indicator padding
                indicatorWeight: 0.01, // ทำให้เส้น indicator บางที่สุด
                padding: const EdgeInsets.symmetric(
                    horizontal: 0), // ปรับขนาด padding ของ TabBar
                labelColor: Colors.white, // สีของตัวอักษรที่ถูกเลือก
                unselectedLabelColor:
                    Colors.black, // สีของตัวอักษรที่ไม่ได้ถูกเลือก
                tabs: const [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "สาเหตุ",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "การป้องกัน",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
                controller: _tabController,
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController, // เพิ่ม controller ที่นี่
              children: const [
                Factor(), // เปลี่ยนเป็นหน้าจอที่ต้องการแสดงผลในแท็บ "สาเหตุ"
                Disease(), // เปลี่ยนเป็นหน้าจอที่ต้องการแสดงผลในแท็บ "ลักษณะอาการ"
                // หน้าจออื่น ๆ ที่คุณต้องการแสดงผลในแท็บอื่น ๆ
              ],
            ),
          ),
        ],
      ),
    );
  }
}
