# language: ru

@IgnoreOnWeb

Функционал: Регулярные выражения
	Как Пользователь VB
 	Я хочу выполнять больше различных проверок, используя регулярные выражения
    Чтобы автоматизировать рутинную деятельность разработчика

Сценарий: Соответствие шаблону
    Когда Я запоминаю значение выражения "345" в переменную "ПроверяемаяСтрока"
    Тогда переменная "ПроверяемаяСтрока" соответствует регулярному выражению "\d\d\d"

Сценарий: Соответствие простому шаблону с использованием маски "*", т.е. "любые символы"
    Когда Я запоминаю строку "Привет" как переменную "ПроверяемаяСтрока"
    Тогда переменная "ПроверяемаяСтрока" соответствует простому шаблону "*ри*"

Сценарий: Несовпадение с шаблоном
    Когда Я запоминаю значение выражения "345" в переменную "ПроверяемаяСтрока"
    Тогда переменная "ПроверяемаяСтрока" не соответствует регулярному выражению "\d{4}"

Сценарий: Несовпадение с простым шаблоном с использованием маски "*", т.е. "любые символы"
    Когда Я запоминаю строку "Привет" как переменную "ПроверяемаяСтрока"
    Тогда переменная "ПроверяемаяСтрока" не соответствует простому шаблону "*ДругойТекст*"

Сценарий: Пустые строки равны пустому шаблону
    Когда Я запоминаю строку "" как переменную "ПроверяемаяСтрока"
    Тогда переменная "ПроверяемаяСтрока" соответствует регулярному выражению ""

Сценарий: Соответствие строки с пробелами простому шаблону с использованием маски "*"
    Когда Я запоминаю строку "Строка с пробелами" как переменную "ПроверяемаяСтрока"
    Тогда переменная "ПроверяемаяСтрока" соответствует простому шаблону "Строка*с*пробелами"

Сценарий: Соответствие сложной строки с пробелами и другими символами простому шаблону с использованием маски "*"
    Когда Я запоминаю строку "	- Версия Vanessa-ADD: ver 6.5.0" как переменную "ПроверяемаяСтрока"
    Тогда переменная "ПроверяемаяСтрока" соответствует простому шаблону "*Версия*Vanessa-ADD*"
    Тогда переменная "ПроверяемаяСтрока" соответствует простому шаблону "Версия Vanessa-ADD: *"
    Тогда переменная "ПроверяемаяСтрока" соответствует простому шаблону "- Версия Vanessa-ADD: *.*.*"
