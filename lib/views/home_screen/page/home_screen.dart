// ignore_for_file: library_private_types_in_public_api
import 'package:color_pallate_generator_app/providers/pallate_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import '../../../modals/pallate.dart';
import '../../../providers/app_theme_provider.dart';

class ColorPellets extends StatefulWidget {
  const ColorPellets({Key? key}) : super(key: key);

  @override
  _ColorPelletsState createState() => _ColorPelletsState();
}

class _ColorPelletsState extends State<ColorPellets> {
  ScreenshotController screenshotController = ScreenshotController();
  int i = 0;
  bool switchValue = false;

  defaultProvider() {
    Provider.of<PaletteProvider>(context, listen: false)
        .changePalette(index: 0);
  }

  @override
  void initState() {
    super.initState();
    defaultProvider();
  }

  late Uint8List imageFile;

  @override
  Widget build(BuildContext context) {
    Palette palette = Provider.of<PaletteProvider>(context).palette;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).dialogBackgroundColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Color Pallate Generator",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  const Spacer(),
                  SimpleOutlinedButton(
                    borderRadius: 10,
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    onPressed: () async {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .changeTheme();
                    },
                    outlineColor: Theme.of(context).primaryColor,
                    child: Icon(
                      Icons.brightness_6_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 510,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context)
                            .dialogBackgroundColor
                            .withOpacity(0.4),
                        Theme.of(context).primaryColor.withOpacity(0.5),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Container(
                      height: 500,
                      width: 240,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Theme.of(context)
                                .dialogBackgroundColor
                                .withOpacity(0.4),
                            Theme.of(context).primaryColor,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Screenshot(
                  controller: screenshotController,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 220,
                        decoration: BoxDecoration(
                          color: palette.colorList[0],
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "#${palette.codeList[0]}",
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Clipboard.setData(ClipboardData(
                                      text: "${palette.codeList[0]}"));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Copied To ClipBoard!"),
                                      backgroundColor: Colors.greenAccent,
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.copy_all_rounded,
                                  color: Colors.white.withOpacity(0.8),
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 220,
                        color: palette.colorList[1],
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "#${palette.codeList[1]}",
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Clipboard.setData(ClipboardData(
                                      text: "${palette.codeList[1]}"));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Copied To ClipBoard!"),
                                      backgroundColor: Colors.greenAccent,
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.copy_all_rounded,
                                  color: Colors.white.withOpacity(0.8),
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 220,
                        color: palette.colorList[2],
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "#${palette.codeList[2]}",
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Clipboard.setData(ClipboardData(
                                      text: "${palette.codeList[2]}"));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Copied To ClipBoard!"),
                                      backgroundColor: Colors.greenAccent,
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.copy_all_rounded,
                                  color: Colors.white.withOpacity(0.8),
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 220,
                        color: palette.colorList[3],
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "#${palette.codeList[3]}",
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Clipboard.setData(ClipboardData(
                                      text: "${palette.codeList[3]}"));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Copied To ClipBoard!"),
                                      backgroundColor: Colors.greenAccent,
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.copy_all_rounded,
                                  color: Colors.white.withOpacity(0.8),
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 220,
                        color: palette.colorList[4],
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "#${palette.codeList[4]}",
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Clipboard.setData(ClipboardData(
                                      text: "${palette.codeList[4]}"));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Copied To ClipBoard!"),
                                      backgroundColor: Colors.greenAccent,
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.copy_all_rounded,
                                  color: Colors.white.withOpacity(0.8),
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 220,
                        decoration: BoxDecoration(
                          color: palette.colorList[5],
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "#${palette.codeList[5]}",
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Clipboard.setData(ClipboardData(
                                      text: "${palette.codeList[5]}"));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Copied To ClipBoard!"),
                                      backgroundColor: Colors.greenAccent,
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.copy_all_rounded,
                                  color: Colors.white.withOpacity(0.8),
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SimpleOutlinedButton(
                  borderRadius: 10,
                  padding: const EdgeInsets.all(15),
                  onPressed: () {
                    if (switchValue) {
                      Provider.of<PaletteProvider>(context, listen: false)
                          .changeColorPalette();
                    } else {
                      (i == 14) ? i = 0 : i++;
                      Provider.of<PaletteProvider>(context, listen: false)
                          .changePalette(index: i);
                    }
                  },
                  outlineColor: Theme.of(context).primaryColor,
                  child: Text(
                    "Change Pallate",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                Switch(
                  value: switchValue,
                  activeColor: Theme.of(context).primaryColor,
                  onChanged: (val) {
                    setState(() {
                      switchValue = val;
                    });
                  },
                ),
                SimpleOutlinedButton(
                  borderRadius: 10,
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  onPressed: () async {
                    await screenshotController
                        .capture()
                        .then((Uint8List? image) {
                      //Capture Done
                      setState(() {
                        imageFile = image!;
                      });
                    }).catchError((onError) {
                    });
                    await ImageGallerySaver.saveImage(imageFile);

                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Palette saved in gallery.."),
                        backgroundColor: Colors.greenAccent,
                      ),
                    );
                  },
                  outlineColor: Theme.of(context).primaryColor,
                  child: Icon(
                    Icons.download,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}

class SimpleOutlinedButton extends StatelessWidget {
  const SimpleOutlinedButton(
      {this.child,
      this.textColor,
      this.outlineColor,
      required this.onPressed,
      this.borderRadius = 6,
      this.padding = const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
      Key? key})
      : super(key: key);
  final Widget? child;
  final Function onPressed;
  final double borderRadius;
  final Color? outlineColor;
  final Color? textColor;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: textColor ?? outlineColor ?? currentTheme.primaryColor,
        padding: padding,
        textStyle: TextStyle(color: currentTheme.primaryColor),
        side: BorderSide(color: outlineColor ?? currentTheme.primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed as void Function()?,
      child: child!,
    );
  }
}
