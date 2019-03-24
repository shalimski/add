﻿# language: ru

@IgnoreOnOFBuilds
@IgnoreOn82Builds
@IgnoreOnWeb

Функционал: Передача параметра в сценарй
	Как Разработчик
	Я Хочу чтобы я мог использоват параметризованные  вложенные сценарии
	Чтобы я мог упростить вызов однотипных сценариев


Контекст:
	Дано Я открываю VanessaADD в режиме TestClient


Сценарий: Передача параметра во вложенный сценарий в таблицу
	Когда В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "ДляПроверкиПередачиПараметровВоВложенныеСценарииВТаблицу"
	И В открытой форме я перехожу к закладке с заголовком "Библиотеки"
	И В открытой форме я нажимаю на кнопку с именем "КаталогиБиблиотекДобавить"
	И я добавляю в библиотеки строку с стандартной библиотекой "libraries"
	И Я нажимаю на кнопку перезагрузить сценарии в Vanessa-ADD TestClient
	И     Я нажимаю на кнопку выполнить сценарии в Vanessa-ADD TestClient
	И     таблица формы с именем "ДеревоТестов" стала равной:
		| 'Статус'  |
		| ''        |
		| ''        |
		| 'Success' |
		| ''        |
		| 'Success' |
		| ''        |
		| ''        |
		| 'Success' |
		| 'Success' |



Сценарий: Проверка ошибки когда в одной строке похожие параметры
	Когда В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "ДляПроверкиПередачиПараметровВоВложенныеСценарииПохожиеПараметры"
	И В открытой форме я перехожу к закладке с заголовком "Библиотеки"
	И В открытой форме я нажимаю на кнопку с именем "КаталогиБиблиотекДобавить"
	И я добавляю в библиотеки строку с стандартной библиотекой "libraries"
	И Я нажимаю на кнопку перезагрузить сценарии в Vanessa-ADD TestClient
	И     Я нажимаю на кнопку выполнить сценарии в Vanessa-ADD TestClient
	И     таблица формы с именем "ДеревоТестов" стала равной:
		| 'Статус'  |
		| ''        |
		| ''        |
		| 'Success' |
		| ''        |
		| 'Success' |
		| 'Success' |


Сценарий: Передача параметра во вложенный сценарий первого и второго уровня
	Когда В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "ДляПроверкиПередачиПараметровВоВложенныеСценарии1"
	И В открытой форме я перехожу к закладке с заголовком "Библиотеки"
	И В открытой форме я нажимаю на кнопку с именем "КаталогиБиблиотекДобавить"
	И я добавляю в библиотеки строку с стандартной библиотекой "libraries"
	И Я нажимаю на кнопку перезагрузить сценарии в Vanessa-ADD TestClient
	И     Я нажимаю на кнопку выполнить сценарии в Vanessa-ADD TestClient
	И     таблица формы с именем "ДеревоТестов" стала равной:
		| 'Статус'  |
		| ''        |
		| ''        |
		| 'Success' |
		| ''        |
		| 'Success' |
		| 'Success' |
		| 'Success' |
		| 'Success' |
		| 'Success' |
		| 'Success' |
		| 'Success' |
		| 'Success' |
		| 'Success' |
