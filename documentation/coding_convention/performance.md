# performance

## Widget чи build-метод

Якщо потрібно розбити віджет, то потрібно виносити частину кода в самостійний віджет, замість створення функції. Це пов'язано з тим, що функція повністю перебудує усе дерево, на відміну від віджет - перебудується тільки він.

Єдине що функція робить краще - це треба писати трохи менше коду.

Завжди, якщо можливо, потрібно ставити _const_ віджет / конструктор классу.

_Вірно:_

```
class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);
}
```

_Не вірно:_

```
Widget buildMyWidget () {
  return Text('Bad example');
}
```

## const constructors

```
class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);
}
```

_const_ покращує швидкість роботи Flutter`a, тобто робиться ребілд тільки тих віджетів, що не вказані як констати, приклад зі стейтом

```

class _MyWidgetState extends State<MyWidget> {
  String myState = 'Hello World';

  void changeState () {
    setState({
      myState = 'New Value';
    })
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeState,
      child: Text(myState),
    );
  }
}

```

По-перше: Text віджет не позначен як конст, бо ми передаємо до нього якісь змінну, По-друге, саме ця змінна і є стейтом. Якби вона була const чи final - ми не мали б можливості змінити її, так само і з віджетом, він би просто був статичним, а на разі - нам відобразить помилку, що Text не може бути const.
