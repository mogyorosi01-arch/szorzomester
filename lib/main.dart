import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const SzorzomesterApp());
}

// ============================================================
// ALKALMAZÁS
// ============================================================

class SzorzomesterApp extends StatelessWidget {
  const SzorzomesterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Szorzómester',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
      ),
      home: const Fomenu(),
    );
  }
}

// ============================================================
// JÁTÉK MÓDOK
// ============================================================

enum JatekMod {
  beiras,
  valasztas,
  hianyzo,
}

// ============================================================
// FŐMENÜ
// ============================================================

class Fomenu extends StatelessWidget {
  const Fomenu({super.key});

  String tablaFelirat(int tabla) {
    switch (tabla) {
      case 2:
        return '2-es';
      case 3:
        return '3-as';
      case 4:
        return '4-es';
      case 5:
        return '5-ös';
      case 6:
        return '6-os';
      case 7:
        return '7-es';
      case 8:
        return '8-as';
      case 9:
        return '9-es';
      case 10:
        return '10-es';
      default:
        return '$tabla-es';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FF),

      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '🧮 Szorzómester',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              18,
              20,
              18,
              30,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 520,
              ),
              child: Column(
                children: [
                  // ------------------------------------------------
                  // CÍM
                  // ------------------------------------------------

                  const Text(
                    'Tanulj meg ügyesen számolni!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Válaszd ki a gyakorláshoz a szorzótáblát!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // ------------------------------------------------
                  // SZORZÓTÁBLA CÍM
                  // ------------------------------------------------

                  const Text(
                    'Szorzótábla',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // ------------------------------------------------
                  // ELSŐ SOR
                  // 2-es | 3-as | 4-es | 5-ös
                  // ------------------------------------------------

                  Row(
                    children: [
                      Expanded(
                        child: _TablaButton(
                          felirat: tablaFelirat(2),
                          tabla: 2,
                          onPressed: () {
                            _jatekModValasztas(
                              context,
                              2,
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: _TablaButton(
                          felirat: tablaFelirat(3),
                          tabla: 3,
                          onPressed: () {
                            _jatekModValasztas(
                              context,
                              3,
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: _TablaButton(
                          felirat: tablaFelirat(4),
                          tabla: 4,
                          onPressed: () {
                            _jatekModValasztas(
                              context,
                              4,
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: _TablaButton(
                          felirat: tablaFelirat(5),
                          tabla: 5,
                          onPressed: () {
                            _jatekModValasztas(
                              context,
                              5,
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // ------------------------------------------------
                  // MÁSODIK SOR
                  // 6-os | 7-es | 8-as | 9-es | 10-es
                  // ------------------------------------------------

                  Row(
                    children: [
                      Expanded(
                        child: _TablaButton(
                          felirat: tablaFelirat(6),
                          tabla: 6,
                          onPressed: () {
                            _jatekModValasztas(
                              context,
                              6,
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: _TablaButton(
                          felirat: tablaFelirat(7),
                          tabla: 7,
                          onPressed: () {
                            _jatekModValasztas(
                              context,
                              7,
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: _TablaButton(
                          felirat: tablaFelirat(8),
                          tabla: 8,
                          onPressed: () {
                            _jatekModValasztas(
                              context,
                              8,
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: _TablaButton(
                          felirat: tablaFelirat(9),
                          tabla: 9,
                          onPressed: () {
                            _jatekModValasztas(
                              context,
                              9,
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: _TablaButton(
                          felirat: tablaFelirat(10),
                          tabla: 10,
                          onPressed: () {
                            _jatekModValasztas(
                              context,
                              10,
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // ------------------------------------------------
                  // VEGYES
                  // ------------------------------------------------

                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _jatekModValasztas(
                          context,
                          null,
                        );
                      },
                      icon: const Icon(
                        Icons.shuffle,
                        size: 27,
                      ),
                      label: const Text(
                        'VEGYES 2–10',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // ------------------------------------------------
                  // INFORMÁCIÓ
                  // ------------------------------------------------

                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: const [
                          Text(
                            '🎯 Gyakorolj minden nap!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Szerezz pontokat és építs hosszú '
                            'helyes válasz-sorozatokat!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ==========================================================
  // JÁTÉKMÓD VÁLASZTÓ
  // ==========================================================

  void _jatekModValasztas(
    BuildContext context,
    int? tabla,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(22),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              20,
              20,
              15,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  tabla == null
                      ? '🔀 Vegyes 2–10'
                      : '📚 ${tablaFelirat(tabla)}',
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),

                const SizedBox(height: 7),

                const Text(
                  'Válassz játékmódot!',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),

                const SizedBox(height: 14),

                // ----------------------------------------------
                // BEÍRÁS
                // ----------------------------------------------

                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  leading: const CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                  title: const Text(
                    'Írd be a választ!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    'Számold ki és írd be a megoldást',
                  ),
                  onTap: () {
                    Navigator.pop(context);

                    _inditJatekot(
                      context,
                      JatekMod.beiras,
                      tabla,
                    );
                  },
                ),

                // ----------------------------------------------
                // NÉGY VÁLASZ
                // ----------------------------------------------

                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  leading: const CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.touch_app,
                      color: Colors.white,
                    ),
                  ),
                  title: const Text(
                    'Válaszd ki a helyes választ!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    '4 lehetőség közül választhatsz',
                  ),
                  onTap: () {
                    Navigator.pop(context);

                    _inditJatekot(
                      context,
                      JatekMod.valasztas,
                      tabla,
                    );
                  },
                ),

                // ----------------------------------------------
                // HIÁNYZÓ SZÁM
                // ----------------------------------------------

                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  leading: const CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Icon(
                      Icons.psychology,
                      color: Colors.white,
                    ),
                  ),
                  title: const Text(
                    'Találd ki, mi hiányzik!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    'Melyik szám került a négyzet helyére?',
                  ),
                  onTap: () {
                    Navigator.pop(context);

                    _inditJatekot(
                      context,
                      JatekMod.hianyzo,
                      tabla,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ==========================================================
  // JÁTÉK INDÍTÁSA
  // ==========================================================

  void _inditJatekot(
    BuildContext context,
    JatekMod mod,
    int? tabla,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return JatekKepernyo(
            mod: mod,
            tabla: tabla,
          );
        },
      ),
    );
  }
}

// ============================================================
// SZORZÓTÁBLA GOMB
// ============================================================

class _TablaButton extends StatelessWidget {
  final String felirat;
  final int tabla;
  final VoidCallback onPressed;

  const _TablaButton({
    required this.felirat,
    required this.tabla,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 3,
      ),
      child: SizedBox(
        height: 52,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 2,
            ),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              felirat,
              maxLines: 1,
              softWrap: false,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// JÁTÉK KÉPERNYŐ
// ============================================================

class JatekKepernyo extends StatefulWidget {
  final JatekMod mod;
  final int? tabla;

  const JatekKepernyo({
    super.key,
    required this.mod,
    required this.tabla,
  });

  @override
  State<JatekKepernyo> createState() =>
      _JatekKepernyoState();
}

class _JatekKepernyoState
    extends State<JatekKepernyo> {
  final Random _random = Random();

  final TextEditingController _controller =
      TextEditingController();

  // ----------------------------------------------------------
  // FELADAT ADATAI
  // ----------------------------------------------------------

  int szam1 = 0;
  int szam2 = 0;
  int helyesValasz = 0;

  bool hianyzoElso = true;

  List<int> valaszok = [];

  final Set<String> hasznaltSzorzok = {};

  // ----------------------------------------------------------
  // PONTSZÁM
  // ----------------------------------------------------------

  int pont = 0;

  int sorozat = 0;

  int legjobbSorozat = 0;

  int kerdesSzam = 1;

  final int osszesKerdes = 10;

  bool valaszolt = false;

  bool helyes = false;

  @override
  void initState() {
    super.initState();

    _ujKerdes();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  // ==========================================================
  // ÚJ KÉRDÉS
  // ==========================================================

  void _ujKerdes() {
    int ujSzam1;
    int ujSzam2;
    String kulcs;

    do {
      if (widget.tabla == null) {
        ujSzam1 = _random.nextInt(9) + 2;
      } else {
        ujSzam1 = widget.tabla!;
      }

      // 1–10 között választunk, így minden kiválasztott
      // szorzótáblában pontosan 10 különböző feladat lehet.
      ujSzam2 = _random.nextInt(10) + 1;

      // Vegyes módban a 7×8 és 8×7 ugyanannak számít.
      final kisebb = min(ujSzam1, ujSzam2);
      final nagyobb = max(ujSzam1, ujSzam2);
      kulcs = '$kisebb×$nagyobb';
    } while (hasznaltSzorzok.contains(kulcs));

    hasznaltSzorzok.add(kulcs);
    szam1 = ujSzam1;
    szam2 = ujSzam2;
    helyesValasz = szam1 * szam2;
    hianyzoElso = _random.nextBool();
    _controller.clear();
    valaszolt = false;
    helyes = false;

    if (widget.mod != JatekMod.beiras) {
      _keszitValaszokat();
    }
  }

  // ==========================================================
  // VÁLASZLEHETŐSÉGEK KÉSZÍTÉSE
  // ==========================================================

  void _keszitValaszokat() {
    valaszok = [];

    if (widget.mod == JatekMod.hianyzo) {
      _keszitHianyzoValaszokat();
    } else {
      _keszitSzorzasiValaszokat();
    }

    valaszok.shuffle();
  }

  // ==========================================================
  // SZORZÁS VÁLASZLEHETŐSÉGEK
  // ==========================================================

  void _keszitSzorzasiValaszokat() {
    valaszok.add(helyesValasz);

    while (valaszok.length < 4) {
      int rosszValasz;

      // Legyenek életszerű hibás válaszok.
      final tipus = _random.nextInt(3);

      if (tipus == 0) {
        rosszValasz =
            helyesValasz + _random.nextInt(9) + 1;
      } else if (tipus == 1) {
        rosszValasz =
            helyesValasz - (_random.nextInt(9) + 1);
      } else {
        rosszValasz =
            helyesValasz +
            _random.nextInt(15) -
            7;
      }

      if (rosszValasz < 1) {
        rosszValasz = 1;
      }

      if (!valaszok.contains(rosszValasz)) {
        valaszok.add(rosszValasz);
      }
    }
  }

  // ==========================================================
  // HIÁNYZÓ SZÁM VÁLASZLEHETŐSÉGEK
  // ==========================================================

  void _keszitHianyzoValaszokat() {
    final helyesHianyzo =
        hianyzoElso ? szam1 : szam2;

    valaszok.add(helyesHianyzo);

    while (valaszok.length < 4) {
      int rossz;

      rossz =
          helyesHianyzo +
          _random.nextInt(7) -
          3;

      if (rossz < 1) {
        rossz = 2;
      }

      if (rossz > 10) {
        rossz = 10;
      }

      if (!valaszok.contains(rossz)) {
        valaszok.add(rossz);
      }
    }
  }

  // ==========================================================
  // BEÍRT VÁLASZ ELLENŐRZÉSE
  // ==========================================================

  void _ellenorizBeirast() {
    if (valaszolt) {
      return;
    }

    final beirt = int.tryParse(
      _controller.text.trim(),
    );

    _ellenoriz(
      beirt == helyesValasz,
    );
  }

  // ==========================================================
  // VÁLASZ ELLENŐRZÉSE
  // ==========================================================

  void _ellenoriz(bool eredmeny) {
    setState(() {
      valaszolt = true;

      helyes = eredmeny;

      if (eredmeny) {
        pont++;

        sorozat++;

        if (sorozat > legjobbSorozat) {
          legjobbSorozat = sorozat;
        }
      } else {
        sorozat = 0;
      }
    });
  }

  // ==========================================================
  // KÖVETKEZŐ KÉRDÉS
  // ==========================================================

  void _kovetkezo() {
    if (kerdesSzam >= osszesKerdes) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) {
            return EredmenyKepernyo(
              pont: pont,
              osszes: osszesKerdes,
              legjobbSorozat: legjobbSorozat,
            );
          },
        ),
      );

      return;
    }

    setState(() {
      kerdesSzam++;

      _ujKerdes();
    });
  }

  // ==========================================================
  // KEZDŐLAP
  // ==========================================================

  void _kezdolap() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const Fomenu(),
      ),
      (route) => false,
    );
  }

  // ==========================================================
  // KÉRDÉS SZÖVEGE
  // ==========================================================

  String _kerdesSzoveg() {
    if (widget.mod == JatekMod.hianyzo) {
      if (hianyzoElso) {
        return '□ × $szam2 = $helyesValasz';
      } else {
        return '$szam1 × □ = $helyesValasz';
      }
    }

    return '$szam1 × $szam2 = ?';
  }

  // ==========================================================
  // JÁTÉK MÓD FELIRATA
  // ==========================================================

  String _modFelirat() {
    switch (widget.mod) {
      case JatekMod.beiras:
        return '✏️ Beírás';

      case JatekMod.valasztas:
        return '🎯 Választás';

      case JatekMod.hianyzo:
        return '🧠 Hiányzó szám';
    }
  }

  // ==========================================================
  // JÁTÉK KÉPERNYŐ
  // ==========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FF),

      appBar: AppBar(
        // -----------------------------------------------------
        // KEZDŐLAP GOMB
        // -----------------------------------------------------

        leading: IconButton(
          tooltip: 'Kezdőlap',
          icon: const Icon(
            Icons.home,
            size: 27,
          ),
          onPressed: _kezdolap,
        ),

        // -----------------------------------------------------
        // CÍM
        // -----------------------------------------------------

        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.tabla == null
                  ? '🔀 Vegyes 2–10'
                  : '📚 ${widget.tabla}-es',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        centerTitle: true,
      ),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),
              child: Column(
                children: [
                  // ------------------------------------------------
                  // JÁTÉKMÓD
                  // ------------------------------------------------

                  Text(
                    _modFelirat(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ------------------------------------------------
                  // KÉRDÉS / PONTSZÁM
                  // ------------------------------------------------

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kérdés: '
                        '$kerdesSzam / '
                        '$osszesKerdes',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        '⭐ $pont pont',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),

                  // ------------------------------------------------
                  // SOROZAT
                  // ------------------------------------------------

                  if (sorozat >= 2) ...[
                    const SizedBox(height: 12),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius:
                            BorderRadius.circular(20),
                      ),
                      child: Text(
                        '🔥 $sorozat helyes egymás után!',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(height: 22),

                  // ------------------------------------------------
                  // KÉRDÉS KÁRTYA
                  // ------------------------------------------------

                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        20,
                        30,
                        20,
                        25,
                      ),
                      child: Column(
                        children: [
                          // ------------------------------------------
                          // KÉRDÉS
                          // ------------------------------------------

                          Text(
                            _kerdesSzoveg(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            ),
                          ),

                          const SizedBox(height: 30),

                          // ------------------------------------------
                          // BEÍRÁS VAGY VÁLASZTÁS
                          // ------------------------------------------

                          if (widget.mod ==
                              JatekMod.beiras)
                            _beirasWidget()
                          else
                            _valasztasWidget(),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ------------------------------------------------
                  // VISSZAJELZÉS
                  // ------------------------------------------------

                  if (valaszolt)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: helyes
                            ? Colors.green.shade50
                            : Colors.red.shade50,
                        borderRadius:
                            BorderRadius.circular(15),
                      ),
                      child: Text(
                        helyes
                            ? '🎉 Helyes válasz!'
                            : '❌ Nem jó!\n'
                              'A helyes válasz: '
                              '$helyesValasz',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: helyes
                              ? Colors.green.shade700
                              : Colors.red.shade700,
                        ),
                      ),
                    ),

                  const SizedBox(height: 18),

                  // ------------------------------------------------
                  // KÖVETKEZŐ GOMB
                  // ------------------------------------------------

                  if (valaszolt)
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton.icon(
                        onPressed: _kovetkezo,
                        icon: Icon(
                          kerdesSzam >= osszesKerdes
                              ? Icons.emoji_events
                              : Icons.arrow_forward,
                        ),
                        label: Text(
                          kerdesSzam >= osszesKerdes
                              ? 'Eredmény'
                              : 'Következő feladat',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                  const SizedBox(height: 15),

                  // ------------------------------------------------
                  // KEZDŐLAP FELIRATOS GOMB
                  // ------------------------------------------------

                  OutlinedButton.icon(
                    onPressed: _kezdolap,
                    icon: const Icon(
                      Icons.home,
                    ),
                    label: const Text(
                      'Kezdőlap',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ==========================================================
  // BEÍRÁS WIDGET
  // ==========================================================

  Widget _beirasWidget() {
    return Column(
      children: [
        TextField(
          controller: _controller,
          enabled: !valaszolt,
          keyboardType:
              const TextInputType.numberWithOptions(
            decimal: false,
            signed: false,
          ),
          textAlign: TextAlign.center,

          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),

          decoration: InputDecoration(
            hintText: 'Írd be a választ',
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
            ),
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(14),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(14),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Colors.indigo,
                width: 2,
              ),
            ),
          ),

          onSubmitted: (_) {
            _ellenorizBeirast();
          },
        ),

        const SizedBox(height: 18),

        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton.icon(
            onPressed: valaszolt
                ? null
                : _ellenorizBeirast,
            icon: const Icon(
              Icons.check_circle,
            ),
            label: const Text(
              'Ellenőrzés',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ==========================================================
  // 4 VÁLASZLEHETŐSÉG
  // ==========================================================

  Widget _valasztasWidget() {
    return Column(
      children: valaszok.asMap().entries.map((entry) {
        final index = entry.key;

        final valasz = entry.value;

        return Padding(
          padding: const EdgeInsets.only(
            bottom: 12,
          ),
          child: SizedBox(
            width: double.infinity,
            height: 58,
            child: ElevatedButton(
              onPressed: valaszolt
                  ? null
                  : () {
                      _valasztasKattintas(
                        valasz,
                      );
                    },
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor:
                        Colors.indigo.shade100,
                    child: Text(
                      String.fromCharCode(
                        65 + index,
                      ),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ),

                  const Spacer(),

                  Text(
                    '$valasz',
                  ),

                  const Spacer(),

                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // ==========================================================
  // VÁLASZ GOMB
  // ==========================================================

  void _valasztasKattintas(int valasz) {
    if (widget.mod == JatekMod.hianyzo) {
      final helyesHianyzo =
          hianyzoElso ? szam1 : szam2;

      _ellenoriz(
        valasz == helyesHianyzo,
      );
    } else {
      _ellenoriz(
        valasz == helyesValasz,
      );
    }
  }
}

// ============================================================
// EREDMÉNY KÉPERNYŐ
// ============================================================

class EredmenyKepernyo extends StatelessWidget {
  final int pont;
  final int osszes;
  final int legjobbSorozat;

  const EredmenyKepernyo({
    super.key,
    required this.pont,
    required this.osszes,
    required this.legjobbSorozat,
  });

  // ==========================================================
  // ÉRTÉKELÉS
  // ==========================================================

  String _uzenet() {
    if (pont == osszes) {
      return '🏆 TÖKÉLETES!\n'
          'Szorzómester vagy!';
    }

    if (pont >= 8) {
      return '🌟 Nagyon ügyes!';
    }

    if (pont >= 6) {
      return '👍 Szép munka!';
    }

    if (pont >= 4) {
      return '🙂 Jó kezdet!';
    }

    return '💪 Gyakorolj még egy kicsit!';
  }

  // ==========================================================
  // CSILLAGOK
  // ==========================================================

  String _csillagok() {
    if (pont == osszes) {
      return '⭐⭐⭐⭐⭐';
    }

    if (pont >= 8) {
      return '⭐⭐⭐⭐';
    }

    if (pont >= 6) {
      return '⭐⭐⭐';
    }

    if (pont >= 4) {
      return '⭐⭐';
    }

    return '⭐';
  }

  // ==========================================================
  // KÉPERNYŐ
  // ==========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FF),

      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Kezdőlap',
          icon: const Icon(
            Icons.home,
          ),
          onPressed: () {
            _kezdolap(context);
          },
        ),

        centerTitle: true,

        title: const Text(
          '🏆 Eredmény',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  const Text(
                    '🎉',
                    style: TextStyle(
                      fontSize: 75,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Vége a játéknak!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // ------------------------------------------------
                  // PONTSZÁM
                  // ------------------------------------------------

                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 35,
                        vertical: 25,
                      ),
                      child: Column(
                        children: [
                          Text(
                            '$pont / $osszes',
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            _csillagok(),
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  Text(
                    _uzenet(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ------------------------------------------------
                  // LEGJOBB SOROZAT
                  // ------------------------------------------------

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      borderRadius:
                          BorderRadius.circular(16),
                    ),
                    child: Text(
                      '🔥 Legjobb sorozat: '
                      '$legjobbSorozat helyes válasz',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ------------------------------------------------
                  // ÚJ JÁTÉK
                  // ------------------------------------------------

                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.replay,
                      ),
                      label: const Text(
                        'Új játék',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ------------------------------------------------
                  // KEZDŐLAP
                  // ------------------------------------------------

                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        _kezdolap(context);
                      },
                      icon: const Icon(
                        Icons.home,
                      ),
                      label: const Text(
                        'Kezdőlap',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ==========================================================
  // KEZDŐLAPRA
  // ==========================================================

  void _kezdolap(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const Fomenu(),
      ),
      (route) => false,
    );
  }
}