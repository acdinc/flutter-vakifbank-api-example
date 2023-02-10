import 'app/app.dart';
import 'app/injection_container.dart' as di;
import 'core/bootstrap/bootstrap.dart';

/*
Code with ❤️
┌──────────────────────────┐
│ Created by Ali Dinç      │
│ ──────────────────────── │
│ alcmdnc@gmail.com        │
│ ──────────────────────── │
│ 30.01.2023               │
└──────────────────────────┘
*/

Future<void> main() async {
  await di.init();

  bootstrap(const MyAwesomeApp());
}
