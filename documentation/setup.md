[На головну](../README.md)

# Setup

## Firebase

Для початку, треба встановити firebase, якщо у вас _Windows_,
то рекомендую це робити через npm,
набагато зручніше і менше кроків.

_Встановлюємо CLI:_

`npm install -g firebase-tools`

_Далі входимо до свого аккаунту:_

`firebase login`

Потім, встановлюємо FlutterFire CLI,

_за допомогою цієї команди:_

`dart pub global activate flutterfire_cli`

Після цього, у Flutter проекті, _виконуємо_:

`flutterfire configure`

_УВАГА:_

За якимось странними подіями, в мене не знаходить цю команду, тільки якщо виконувати її у _PowerShell_

Запитає, чи створювати новий проект, або обрати вже існуючий і наступним шагом, буде обрати,
які платформи використовуються ( за замовчунням усі ), команда створить для кожної платформи, окремий firebase проект.

Потрібно запускати кожен раз цю команду, якщо додаєете нову платформу, або вход за допомогою Google, чи Crashlytics, Performance Monitoring або Realtime Database.

Далі, ініціюємо Firebase у проекті

_виконайте:_

`flutter pub add firebase_core`

додасть до залежностей, та встановить модуль / пакет _firebase_core_, то є основний плагін.

_Знову, виконайте:_

`flutterfire configure`

щоб переконатися, що усе ап ту дейт.

## Flutter

Додайте до файлу _lib/main.dart_

```
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
```

_УВАГА:_

Файл _firebase_options.dart_ в моєму випадку містив помилку, мов там з імпортами було щось не те, тому я зробив _quick fix_ що є у VSCode і обрав встановити цей модуль ще раз - помилка пройшла, однак, можливо є і інші варіанти.

У метод _main_ додаємо

```
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
```

Перша строка, потрібна, щоб дочекатись, що усі нативні модулі були загружені, а WidgetsBinding - це такий собі мост, задля виклику нативних модулів.
Друга - це ініціалізуємо firebase проект.

Готово.

_УВАГА:_

Під час запуску, викинуло що firebase потребує щоб найнижча версія sdk була 19,
тому, потрібно у **android/app/build.gradle** знайти **defaultConfig** та замінити minSdlVersion на 19, замість мінімальної версію, що підтримує flutter.
Також, туди потрібно додати підтримку _multidex_ **multiDexEnabled true**

## Plugins

Для використання cloud firestore _встановити необхідний плагін:_

```
flutter pub add cloud_firestore
```

_І тоді, використовувати це так:_

```
FirebaseFirestore firestore = FirebaseFirestore.instance;
```

Буде використовувати Firebase App за замовчуванням, що було встановленно за допомогою FlutterFire

_або, якщо необхідно інший проект:_

```
FirebaseApp secondaryApp = Firebase.app('SecondaryApp');
FirebaseFirestore firestore = FirebaseFirestore.instanceFor(app: secondaryApp);
```

можливо, буде цікаво [стиль коду](./coding_convention.md)
