# language: ru

@IgnoreOn82Builds
@IgnoreOnOFBuilds
@IgnoreOnWeb



Функционал: Проверка парсинга фичи со структурой сценария

Как разработчик
Я хочу чтобы корректно происходил парсинг фичи со структурами сценария
Чтобы я мог их корректно читать

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий с закрытием всех окон кроме "* Vanessa ADD"


Сценарий: Проверка парсинга фичи, когда используется вертикальная черта
	Когда Я открываю VanessaADD в режиме TestClient
	И В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "ФичаДляПроверкиСтруктурыСценария348"
	И Я нажимаю на кнопку перезагрузить сценарии в Vanessa-ADD TestClient
	И в логе сообщений TestClient есть строка "Таблица параметров должна заканчиваться символом |"