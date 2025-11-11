import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  
  static const String termsText = '''
تاريخ السريان: 11 نوفمبر 2025

=================================
1. القبول بالشروط
=================================

* الموافقة الإلزامية: باستخدامك للتطبيق، فإنك توافق على الالتزام بهذه الشروط والأحكام وسياسة الخصوصية. يجب التوقف فوراً عن الاستخدام في حال عدم الموافقة.
* الأهلية القانونية: أنت تقر بأنك تبلغ السن القانونية (18 عاماً) أو لديك موافقة ولي الأمر.

=================================
2. حقوق الملكية الفكرية
=================================

* حقوق التطبيق: جميع المحتويات والميزات هي ملكية حصرية لـ [اسم شركتك/التطبيق] وتخضع لحماية قوانين الملكية الفكرية.
* الترخيص الممنوح: نمنحك ترخيصاً محدوداً للاستخدام الشخصي وغير التجاري فقط.
* الحظر: يُحظر نسخ، تعديل، توزيع، أو فك تجميع أي جزء من التطبيق.

=================================
3. حسابات المستخدمين
=================================

* إنشاء الحساب: أنت مسؤول عن توفير معلومات دقيقة وكاملة.
* أمن الحساب: أنت المسؤول الوحيد عن الحفاظ على سرية كلمة المرور وأنشطة حسابك.
* إنهاء الحساب: نحتفظ بالحق في تعليق أو إنهاء حسابك لأي سبب، بما في ذلك انتهاك الشروط.

=================================
4. السلوك المحظور
=================================

* يُحظر استخدام التطبيق لأي غرض غير قانوني، أو نشر محتوى مسيء، تشهيري، أو انتحال شخصية.

=================================
5. إخلاء المسؤولية
=================================

* يتم توفير التطبيق "كما هو" و "حسب التوفر" دون أي ضمانات.
* لن نكون مسؤولين عن أي أضرار تنشأ عن استخدامك أو عدم قدرتك على استخدام التطبيق.
''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('شروط الاستخدام')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),

        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(
              termsText,
              textAlign: TextAlign.justify, // محاذاة للنص الطويل
              style: const TextStyle(
                fontSize: 15,
                height: 1.6, // لزيادة التباعد بين السطور
              ),
            ),
                ElevatedButton(
                  onPressed: () {
                    // Pop this screen and return "Yes" to the previous screen
                    Navigator.pop(context, 'true');
                  },
                  child: const Text('أوافق'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Pop this screen and return "No" to the previous screen
                    Navigator.pop(context, 'false');
                  },
                  child: const Text('لا أوافق'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
