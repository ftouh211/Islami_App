import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageBottemSheet extends StatelessWidget {
  const LanguageBottemSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                context.setLocale(Locale("en"));
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "english".tr(),
                    style: GoogleFonts.elMessiri(
                      color: Theme.of(context).colorScheme.outline,
                      fontSize: 24,
                    ),
                  ),
                  Icon(
                    Icons.done,

                    color: context.locale.languageCode == "en"
                        ? Theme.of(context).colorScheme.outline
                        : Colors.transparent,
                    size: 24,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                context.setLocale(Locale("ar"));
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "arabic".tr(),
                    style: GoogleFonts.elMessiri(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 24,
                    ),
                  ),
                  Icon(
                    Icons.done,
                    color:
                    context.locale.languageCode == "ar"
                        ? Theme.of(context).colorScheme.outline
                        : Colors.transparent,
                    size: 24,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
