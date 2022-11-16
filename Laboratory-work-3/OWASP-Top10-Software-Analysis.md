| Ідентифікатор та назва атаки (вразливості) | Вимога (FR, NFR) | Приклад вразливостей, які може використовувати атака | Приклад запобігання успішної реалізації атаки |
|---|---|---|---|
| A2 – невдачі (збої) у криптографії (Cryptographic Failures) | FR1 Функція реєстрації<br>FR2 Функція аутентифікації | - Чи використовуються старі або слабкі криптографічні алгоритми або протоколи за замовчуванням або в старішому коді?<br> - Чи використовуються криптоключі за замовчуванням, слабкі криптоключі згенеровані або повторно використані, чи немає належного керування ключами чи ротації? Чи перевіряються криптоключі в сховищах вихідного коду?<br> - Чи не застосовується шифрування, наприклад, чи відсутні якісь заголовки HTTP (браузер) або заголовки? | - Забезпечте наявність актуальних і надійних стандартних алгоритмів, протоколів і ключів; використовувати правильне керування ключами.<br> - Завжди використовуйте автентифіковане шифрування замість простого шифрування. |
| A5 – неправильна конфігурація безпеки |  FR1 Функція реєстрації<br>FR2 Функція аутентифікації | - Увімкнено або встановлено непотрібні функції (наприклад, непотрібні порти, служби, сторінки, облікові записи або привілеї).<br> - Облікові записи за замовчуванням і їхні паролі залишаються активними та не змінюються.<br> - Обробка помилок виявляє користувачам трасування стека або інші надто інформативні повідомлення про помилки. | Завдання переглядати й оновлювати конфігурації, що відповідають усім приміткам щодо безпеки, оновленням і виправленням у рамках процесу керування виправленнями. Перегляньте дозволи на хмарне сховище. |
| A7 – помилки ідентифікації та аутентифікації |  FR1 Функція реєстрації<br>FR2 Функція аутентифікації | - Дозволяє стандартні, слабкі або добре відомі паролі, як-от «Password1» або «admin/admin».<br> - Відсутня або неефективна багатофакторна автентифікація. | - Застосовуйте слабкі перевірки паролів, наприклад перевіряйте нові або змінені паролі зі списком 10 000 найгірших паролів.<br> - Узгодьте політику щодо довжини, складності та ротації пароля з інструкціями Національного інституту стандартів і технологій (NIST) 800-63b у розділі 5.1.1 щодо секретів, що запам’ятовуються, або іншими сучасними політиками паролів, заснованими на фактах.<br> - Переконайтеся, що реєстрація, відновлення облікових даних і шляхи API захищені від атак нумерації облікових записів за допомогою однакових повідомлень для всіх результатів. |
| A8 – невдачі (збої) у забезпеченні цілісності програмного забезпечення та даних | FR3 Функція налаштування гітари<br>FR5 Функція перевірки знань акордів | Порушення цілісності програмного забезпечення та даних стосуються коду та інфраструктури, які не захищають від порушень цілісності. | - Переконайтеся, що бібліотеки та залежності, такі як npm або Maven, використовують надійні репозиторії. Якщо у вас вищий профіль ризику, подумайте про розміщення перевіреного внутрішнього завідомо справного сховища. |
| A10 – підробка запитів на стороні сервера | NFR2 Для запуску застосунку необхідне підключення до інтернету | Помилки SSRF виникають щоразу, коли веб-програма отримує віддалений ресурс без перевірки наданої користувачем URL-адреси. Це дозволяє зловмиснику змусити програму надіслати створений запит до неочікуваного адресата, навіть якщо він захищений брандмауером, VPN або іншим типом списку контролю доступу до мережі (ACL). | - Розділіть функції віддаленого доступу до ресурсів у окремі мережі, щоб зменшити вплив SSRF<br> - Не надсилайте необроблені відповіді клієнтам |