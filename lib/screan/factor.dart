import 'package:flutter/material.dart';

class Factor extends StatefulWidget {
  const Factor({super.key});

  @override
  State<Factor> createState() => _FactorState();
}

class _FactorState extends State<Factor> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'สาเหตุ\n',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                  'โอกาศการเกิดไฟป่านั้น มีหลายสาเหตุ เช่น การที่นักท่องเที่ยวตั้งแคมแล้วจกไฟทิ้งไว้ การเผ่าขยะไม่หมอด การเกิดฝ่าผ่าใส่ต้นไม้หรือเศษไม่แห้ง',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
