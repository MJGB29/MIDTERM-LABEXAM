import 'package:flutter/material.dart';

const String kStudentName = 'Bernal, Mars Jairus G.';
const String kProfessorName = 'Albert Q. Alforja';
const String kStudentTitle = '3rd of BS Information Technology';
const String kAboutMe =
    'A 3rd Year IT student who wanna pursue my skills and knowledge to learn and sharpen them. Discovering new ways and methods for me to gain academically and having connections with other students with the same humor and interests.';

class Palette {
  static const navy = Color.fromARGB(255, 139, 52, 253);
  static const navyDark = Color.fromARGB(255, 0, 0, 0);
  static const teal = Color.fromARGB(255, 0, 0, 0);
  static const gold = Color.fromARGB(255, 255, 255, 255);
  static const background = Color.fromARGB(66, 139, 52, 253);
  static const cardShadow = Color.fromARGB(26, 3, 112, 255);
}

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio — $kStudentName',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Palette.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Palette.navy,
          primary: Palette.navy,
          secondary: Palette.teal,
        ),
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
            color: Palette.navy,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w600,
            color: Palette.navy,
          ),
          bodyMedium: TextStyle(height: 1.5, color: Color(0xFF3C4A5E)),
        ),
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Palette.navy,
        title: const Text(
          'My Portfolio',
          style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.4),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: const [
          _HeaderSection(),
          SizedBox(height: 20),
          _SectionTitle(icon: Icons.person_outline, label: 'About Me'),
          _AboutCard(),
          SizedBox(height: 8),
          _SectionTitle(icon: Icons.star_border_rounded, label: 'Skills'),
          _SkillsCard(),
          SizedBox(height: 8),
          _SectionTitle(icon: Icons.work_outline_rounded, label: 'Projects'),
          _ProjectCard(
            icon: Icons.shopping_bag_outlined,
            title: 'Campus Marketplace App (Sample)',
            description:
                'A project to let students like me to sell their stuff in the University',
          ),
          _ProjectCard(
            icon: Icons.event_available_outlined,
            title: 'Event Attendance Tracker (Sample)',
            description:
                'Used for certain school events and to confirm attendance accordingly',
          ),
          SizedBox(height: 8),
          _SectionTitle(icon: Icons.touch_app_outlined, label: 'Try It Out'),
          _GestureSection(),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Palette.navyDark, Palette.navy],
        ),
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 52,
            backgroundColor: Palette.teal,
            child: CircleAvatar(
              radius: 48,
              backgroundColor: Palette.navyDark,
              child: Icon(Icons.person, size: 54, color: Palette.gold),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            kStudentName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            kStudentTitle,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.75),
              fontSize: 14,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              _ContactIcon(icon: Icons.mail_outline),
              SizedBox(width: 18),
              _ContactIcon(icon: Icons.phone_outlined),
              SizedBox(width: 18),
              _ContactIcon(icon: Icons.link),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContactIcon extends StatelessWidget {
  final IconData icon;
  const _ContactIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Palette.teal, size: 20),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final IconData icon;
  final String label;
  const _SectionTitle({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Palette.teal),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class _AboutCard extends StatelessWidget {
  const _AboutCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 2,
        shadowColor: Palette.cardShadow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: const Padding(
          padding: EdgeInsets.all(18),
          child: Text(kAboutMe),
        ),
      ),
    );
  }
}

class _SkillsCard extends StatelessWidget {
  const _SkillsCard();

  static const List<String> skills = [
    'Flutter',
    'Dart',
    'Java',
    'MySQL',
    'UI/UX Designing',
    'Kotlin',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 2,
        shadowColor: Palette.cardShadow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: skills
                .map(
                  (s) => Chip(
                    label: Text(s),
                    backgroundColor: Palette.navy.withValues(alpha: 0.06),
                    labelStyle: const TextStyle(
                      color: Palette.navy,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.5,
                    ),
                    side: BorderSide.none,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ProjectCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
      child: Card(
        elevation: 2,
        shadowColor: Palette.cardShadow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Palette.teal.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: Palette.navy),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GestureSection extends StatefulWidget {
  const _GestureSection();

  @override
  State<_GestureSection> createState() => _GestureSectionState();
}

class _GestureSectionState extends State<_GestureSection> {
  String _lastAction = 'Tap, double tap, or long-press the button below.';
  bool _pressedDown = false;

  String _formattedDate(DateTime d) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${months[d.month - 1]} ${d.day}, ${d.year}';
  }

  void _logToConsole(String eventLabel, String detail) {
    debugPrint('=' * 45);
    debugPrint('[GESTURE EVENT] $eventLabel');
    debugPrint('  -> $detail');
    debugPrint('  -> timestamp: ${DateTime.now()}');
    debugPrint('=' * 45);
  }

  void _onSingleTap() {
    final today = _formattedDate(DateTime.now());
    _logToConsole('SINGLE TAP', 'Examination date: $today');
    setState(
      () => _lastAction = 'Single tap detected → date printed to console.',
    );
  }

  void _onDoubleTap() {
    _logToConsole('DOUBLE TAP', 'ITP107 Professor: $kProfessorName');
    setState(
      () => _lastAction = 'Double tap detected → professor printed to console.',
    );
  }

  void _onLongPress() {
    _logToConsole('LONG PRESS', 'Student name: $kStudentName');
    setState(
      () => _lastAction = 'Long press detected → full name printed to console.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 2,
        shadowColor: Palette.cardShadow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Single tap → date  •  Double tap → professor  •  Long press → name',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 12.5,
                  color: const Color(0xFF6B7A90),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: _onSingleTap,
                onDoubleTap: _onDoubleTap,
                onLongPress: _onLongPress,
                onTapDown: (_) => setState(() => _pressedDown = true),
                onTapCancel: () => setState(() => _pressedDown = false),
                onTapUp: (_) => setState(() => _pressedDown = false),
                child: AnimatedScale(
                  scale: _pressedDown ? 0.96 : 1.0,
                  duration: const Duration(milliseconds: 100),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Palette.teal, Palette.navy],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Palette.teal.withOpacity(0.35),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Text(
                      'Click Me',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              const Divider(height: 1),
              const SizedBox(height: 10),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Text(
                  _lastAction,
                  key: ValueKey(_lastAction),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Palette.navy,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
