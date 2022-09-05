# widgets

## FutureBuilder

Усі async методи, повертають Future, тобто, якщо ми робимо async запит, і він поветрає якісь данні, то тип будет таким:

```
Future<MyModel> makeRequest () async { ... }
```

і якщо, нам потрібно потім, відобразити, до того як прийде відповідь, зробимо перевірку, що данних ще немає, відобразимо лоадінг:

```
 if(data.isEmpty) {
  return const CircularProgressIndicator();
 }
```

інакше, відобразимо данні:

```
else if(data) {
  return Text(data.name);
}
```

Ось тут, FutureBuilder допомоще нам, зменшити кількість шаблонного коду:

```
FutureBuilder (
  future: makeRequest,
  builder: (context, AsyncSnapshot snapshot) {
    if(snapshot.hasData) {
      return Text(data.name);
    } else if(snapshot.hasError) {
      return Text(snapshot.error);
    } else {
        return const CircularProgressIndicator();
    }
  }
)
```

Передаємо функцію, та в залежності від стейту, рендеримо потрібні віджети.
