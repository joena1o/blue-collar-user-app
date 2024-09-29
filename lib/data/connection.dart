import "package:flutter_dotenv/flutter_dotenv.dart";

String conn = "${dotenv.env['ANDROID_CONN']}:5000";
