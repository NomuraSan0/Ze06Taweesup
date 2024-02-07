import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  List<String> _questions = [
    'ในการเก็บข้อมูลในคอมพิวเตอร์ ว่านั้นฮาร์ดดิสก์เป็นอุปกรณ์ที่ใช้งานในการเก็บข้อมูล',
    'หากคุณต้องการสร้างโปรแกรมเพื่อคำนวณผลบวกของเลข 2 จำนวน คุณคิดว่าควรใช้ภาษาโปรแกรมอะไร?',
    'RAM ย่อมาจากคำว่าอะไร?',
    'คอมพิวเตอร์ที่มีการ์ดจอแยกสามารถทำอะไรได้เพิ่มเติม?',
    'ฮาร์ดแวร์ที่ทำหน้าที่เป็นตัวกลางในการเชื่อมต่ออุปกรณ์ภายนอกกับคอมพิวเตอร์คือ?',
    'ซอฟต์แวร์ไดรเวอร์คืออะไร?',
    'ภาษาโปรแกรมที่มีการสั่งให้คอมพิวเตอร์ทำงานตามลำดับของคำสั่งคือ?',
    'การ์ดเครือข่ายใช้ทำอะไร?',
    'ซอฟต์แวร์แบบไหนที่ใช้สร้างและจัดการเนื้อหาบนเว็บไซต์?',
    'ซอฟต์แวร์แบบไหนที่ใช้สร้างเอกสารและงานเอกสาร?',
  ];
  List<List<String>> _options = [
    ['ใช้แม่เหล็กและแม่เหล็กเปลี่ยนทิศ', 'ใช้ไฟฟ้าเมื่อมีการเข้าถึงข้อมูล', 'ใช้กระบวนการเคลื่อนที่ของดิสก์'],
    ['Python', 'HTML', 'CSS'],
    ['Random Access Memory', 'Read And Modify', 'Real-time Access Module'],
    ['เพิ่มพื้นที่ในการเก็บข้อมูล', 'ปรับปรุงประสิทธิภาพในการทำงานเกี่ยวกับรูปภาพและวิดีโอ', ' ทำให้คอมพิวเตอร์ทำงานได้ช้าลง'],
    [' ฮาร์ดดิสก์', 'การ์ดจอ', 'การ์ดเสียง'],
    ['ซอฟต์แวร์ที่ใช้ในการควบคุมอุปกรณ์ฮาร์ดแวร์', 'ซอฟต์แวร์ที่ใช้ในการออกแบบกราฟิก', 'ซอฟต์แวร์ที่ช่วยในการป้องกันไวรัส'],
    ['ภาษาสร้างสรรค์', 'ภาษาเครื่อง', 'ภาษาองค์ประกอบ'],
    ['เชื่อมต่อคอมพิวเตอร์กับเครือข่ายอื่น ๆ', 'เชื่อมต่อคอมพิวเตอร์กับการ์ดจอ', 'เชื่อมต่อคอมพิวเตอร์กับเม้าส์แ'],
    ['กราฟิกดีไซน์', 'เว็บแอปพลิเคชัน', 'ระบบปฏิบัติการ'],
    ['โปรแกรมสำหรับแต่งรูปภาพ', 'โปรแกรมสำหรับการประมวลผลคำ', 'โปรแกรมสำหรับสร้างสื่อโต้ตอบ'],
  ];
  List<int> _answers = [2, 0, 0, 1, 2, 0, 1, 0, 0, 1];
  int _score = 0;

  void _checkAnswer(int selectedIndex) {
    if (selectedIndex == _answers[_questionIndex]) {
      setState(() {
        _score++;
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
    });
    if (_questionIndex == _questions.length) {
      // Quiz ends, navigate to result screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(score: _score),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _questions[_questionIndex],
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          ...( _options[_questionIndex].map((option) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                onPressed: () => _checkAnswer(_options[_questionIndex].indexOf(option)),
                child: Text(option),
              ),
            );
          }).toList() ),
        ],
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;

  ResultScreen({required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Result'),
      ),
      body: Center(
        child: Text(
          'Your Score: $score',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
