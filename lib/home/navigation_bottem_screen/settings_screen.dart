import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/details/language_bottem_sheet.dart';
import 'package:islami_app/home/details/theme_bottem_sheet.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  static const String routeName = "SettingsTab";
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<myProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "theme".tr(),
            style: GoogleFonts.elMessiri(
              fontSize: 24,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              // setState(() {
              //
              // });
              showModalBottomSheet(
                context: context,
                isScrollControlled: false,
                builder: (context) {
                  return ThemeBottemSheet();
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(12),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: BoxBorder.all(
                  width: 2,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              child: Text(
                provider.appTheme == ThemeMode.light
                    ? "light".tr()
                    : "dark".tr(),
                style: GoogleFonts.elMessiri(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
          ),
          SizedBox(height: 25),

          Text(
            "language".tr(),
            style: GoogleFonts.elMessiri(
              fontSize: 24,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              // setState(() {
              //
              // });
              showModalBottomSheet(
                context: context,
                isScrollControlled: false,
                builder: (context) {
                  return LanguageBottemSheet();
                },
              );
            },

            child: Container(
              padding: const EdgeInsets.all(12),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: BoxBorder.all(
                  width: 2,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              child: Text(
                context.locale.languageCode == "ar"
                    ? "arabic".tr()
                    : "english".tr(),
                style: GoogleFonts.elMessiri(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
