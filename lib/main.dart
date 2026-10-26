
import 'package:flutter/material.dart';

void main() {
  runApp(const MolakhassatiApp());
}

class MolakhassatiApp extends StatelessWidget {
  const MolakhassatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ملخصاتي',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFC5A66A),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF08090B),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF101114),
          centerTitle: true,
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFF151619),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const subjects = [
    'الإسلامية',
    'اللغة العربية',
    'اللغة الإنكليزية',
    'الرياضيات',
    'العلوم',
    'الكيمياء',
    'الفيزياء',
    'الاجتماعيات',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ملخصاتي',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'الصف الثالث المتوسط',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'ملخصاتك الدراسية بمكان واحد',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white60),
          ),
          const SizedBox(height: 24),
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.lock_outline,
                color: Color(0xFFC5A66A),
              ),
              title: const Text('خصوصيتك مهمة'),
              subtitle: const Text(
                'استخدم التطبيق لمراجعة دروسك وتنظيم دراستك.',
              ),
            ),
          ),
          const SizedBox(height: 16),
          ...subjects.map(
            (subject) => Card(
              child: ListTile(
                leading: const Icon(
                  Icons.menu_book_rounded,
                  color: Color(0xFFC5A66A),
                ),
                title: Text(subject),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  if (subject == 'الكيمياء') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ChemistryPage(),
                      ),
                    );
                  } else if (subject == 'الاجتماعيات') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SocialStudiesPage(),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SubjectPage(subject: subject),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'ملخصاتي | الثالث المتوسط',
              style: TextStyle(color: Colors.white38),
            ),
          ),
        ],
      ),
    );
  }
}

class SubjectPage extends StatelessWidget {
  final String subject;

  const SubjectPage({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(subject)),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'سيُضاف محتوى هذه المادة بعد ترتيب الملخصات ومراجعتها.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17),
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
    'الفصل السابع',
    'الفصل الثامن',
    'الفصل التاسع',
  ];

  static const sections = [
    'الملخص',
    'التعاريف والتعاليل',
    'المسائل والمعادلات',
    'الأسئلة الوزارية',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الكيمياء')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Icon(
                    Icons.science_outlined,
                    size: 42,
                    color: Color(0xFFC5A66A),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'كيمياء الثالث المتوسط',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'اختر الفصل للوصول إلى أقسام المراجعة.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white60),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          ...chapters.asMap().entries.map((entry) {
            final index = entry.key;
            final chapter = entry.value;

            return Card(
              child: ExpansionTile(
                key: PageStorageKey<String>(chapter),
                leading: CircleAvatar(
                  backgroundColor: const Color(0xFFC5A66A),
                  foregroundColor: Colors.black,
                  child: Text('${index + 1}'),
                ),
                title: Text(
                  chapter,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                children: sections.map((section) {
                  return ListTile(
                    leading: const Icon(
                      Icons.article_outlined,
                      color: Color(0xFFC5A66A),
                    ),
                    title: Text(section),
                    subtitle: const Text(
                      'سيُضاف المحتوى بعد مطابقته مع الكتاب المدرسي.',
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '$chapter - $section: المحتوى قيد الإعداد.',
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            );
          }),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'ملاحظة: أسماء الفصول هنا مؤقتة. يجب مطابقتها مع فهرس كتاب الكيمياء العراقي قبل إضافة الملخصات النهائية.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white54),
            ),
          ),
        ],
      ),
    );
  }
}

class SocialStudiesPage extends StatelessWidget {
  const SocialStudiesPage({super.key});

  static const sections = [
    'التاريخ',
    'الجغرافية',
    'التربية الوطنية',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الاجتماعيات')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: sections.map((section) {
          return Card(
            child: ListTile(
              leading: const Icon(
                Icons.public,
                color: Color(0xFFC5A66A),
              ),
              title: Text(section),
              subtitle: const Text('سيُضاف المحتوى الدراسي لاحقاً.'),
            ),
          );
        }).toList(),
      ),
    );
  }
}
