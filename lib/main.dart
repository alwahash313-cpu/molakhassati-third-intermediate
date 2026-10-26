import 'package:flutter/material.dart';

void main() {
  runApp(const MolakhassatiApp());
}

const Color pageColor = Color(0xFF11151A);
const Color cardColor = Color(0xFF20262E);
const Color goldColor = Color(0xFFC8A875);
const Color mutedColor = Color(0xFFAEB6C1);

class MolakhassatiApp extends StatelessWidget {
  const MolakhassatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ملخصاتي - الثالث متوسط العراقي',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: pageColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: goldColor,
          brightness: Brightness.dark,
          surface: cardColor,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class Subject {
  final String name;
  final IconData icon;

  const Subject(this.name, this.icon);
}

const List<Subject> subjects = [
  Subject('اللغة العربية', Icons.menu_book_outlined),
  Subject('اللغة الإنكليزية', Icons.translate_outlined),
  Subject('الرياضيات', Icons.calculate_outlined),
  Subject('الفيزياء', Icons.bubble_chart_outlined),
  Subject('الكيمياء', Icons.science_outlined),
  Subject('الاجتماعيات', Icons.groups_outlined),
  Subject('الأحياء', Icons.spa_outlined),
  Subject('الإسلامية', Icons.mosque_outlined),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'ملخصاتي',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: pageColor,
          foregroundColor: Colors.white,
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF303740),
                      Color(0xFF1C2229),
                    ],
                  ),
                  border: Border.all(color: Colors.white10),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.school_outlined,
                      size: 42,
                      color: goldColor,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'الثالث متوسط العراقي',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'ملخصات ومراجعة المواد الدراسية',
                      style: TextStyle(color: mutedColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'المواد الدراسية',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: subjects.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.25,
                ),
                itemBuilder: (context, index) {
                  final subject = subjects[index];

                  return Card(
                    color: cardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(18),
                      onTap: () {
                        if (subject.name == 'الكيمياء') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ChemistryPage(),
                            ),
                          );
                        } else if (subject.name == 'الاجتماعيات') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SocialStudiesPage(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'قسم ${subject.name} قيد التجهيز',
                              ),
                            ),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              subject.icon,
                              size: 32,
                              color: goldColor,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              subject.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChemistryPage extends StatelessWidget {
  const ChemistryPage({super.key});

  static const chapters = [
    'الفصل الأول',
    'الفصل الثاني',
    'الفصل الثالث',
    'الفصل الرابع',
    'الفصل الخامس',
    'الفصل السادس',
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الكيمياء'),
          backgroundColor: pageColor,
          foregroundColor: Colors.white,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: goldColor),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'كيمياء الثالث متوسط',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'ملخصات وتعريفات وتعاليل ومسائل وأسئلة وزارية',
                    style: TextStyle(color: mutedColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ...chapters.asMap().entries.map((entry) {
              return Card(
                color: cardColor,
                child: ExpansionTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFF39414B),
                    foregroundColor: goldColor,
                    child: Text('${entry.key + 1}'),
                  ),
                  title: Text(entry.value),
                  children: const [
                    ListTile(
                      leading: Icon(Icons.notes, color: goldColor),
                      title: Text('الملخص'),
                      subtitle: Text('يُضاف ملخص الفصل بعد مراجعة الكتاب.'),
                    ),
                    ListTile(
                      leading: Icon(Icons.menu_book, color: goldColor),
                      title: Text('التعاريف والتعاليل'),
                      subtitle: Text('قسم للتعاريف والأسباب المهمة.'),
                    ),
                    ListTile(
                      leading: Icon(Icons.calculate, color: goldColor),
                      title: Text('المسائل والمعادلات'),
                      subtitle: Text('أمثلة وخطوات الحل حسب المنهج.'),
                    ),
                    ListTile(
                      leading: Icon(Icons.assignment, color: goldColor),
                      title: Text('الأسئلة الوزارية'),
                      subtitle: Text(
                        'تُضاف الأسئلة السابقة بعد التحقق من مصادرها.',
                      ),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 12),
            const Text(
              'ملاحظة: أسماء الفصول مؤقتة إلى أن نطابقها مع فهرس الكتاب العراقي المعتمد.',
              style: TextStyle(color: mutedColor),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialStudiesPage extends StatelessWidget {
  const SocialStudiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    const sections = [
      ('التاريخ', Icons.account_balance),
      ('الوطنية', Icons.flag),
      ('الجغرافية', Icons.public),
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الاجتماعيات'),
          backgroundColor: pageColor,
          foregroundColor: Colors.white,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'ملف الاجتماعيات',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'التاريخ والوطنية والجغرافية في مكان واحد.',
              style: TextStyle(color: mutedColor),
            ),
            const SizedBox(height: 16),
            ...sections.map((section) {
              return Card(
                color: cardColor,
                child: ListTile(
                  leading: Icon(section.$2, color: goldColor, size: 30),
                  title: Text(
                    section.$1,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('ملخصات ومراجعة'),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
