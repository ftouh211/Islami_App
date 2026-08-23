import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottemSheet extends StatelessWidget {
  const ThemeBottemSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<myProvider>(context);
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
                provider.changeTheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "light".tr(),
                    style: GoogleFonts.elMessiri(
                      color: Theme.of(context).colorScheme.outline,
                      fontSize: 24,
                    ),
                  ),
                  Icon(
                    Icons.done,
                    color: provider.appTheme == ThemeMode.light
                        ? AppColors.PrimaryColor
                        : Colors.transparent,
                    size: 24,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "dark".tr(),
                    style: GoogleFonts.elMessiri(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 24,
                    ),
                  ),
                  Icon(
                    Icons.done,

                    color: provider.appTheme == ThemeMode.dark
                        ? Colors.white
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
