1. Заповніть таблицю БД ще трьома рядками.

![image](https://user-images.githubusercontent.com/55207058/207802772-0b632f8b-c00d-4663-a135-0deb1934c69a.png)

2. Створіть схему даних користувача та віртуальну таблицю у цій схемі з правилами вибіркового керування доступом для користувача так, щоб він міг побачити тільки один з рядків таблиці з урахуванням одного значення її останньої колонки.

![image](https://user-images.githubusercontent.com/55207058/207806458-3750e0bc-cf25-4abc-974e-99c919b05d1b.png)
![image](https://user-images.githubusercontent.com/55207058/207807134-5bd3823f-ce07-4802-b11d-adff5523577a.png)
![image](https://user-images.githubusercontent.com/55207058/207811073-013cd890-fc24-4ba9-b5f4-3fcf36df2aa6.png)

3. Перевірте роботу механізму вибіркового керування, виконавши операції SELECT, INSERT, UPDATE, DELETE.

![image](https://user-images.githubusercontent.com/55207058/207807526-5a01ffcb-46bd-4344-a0fa-c1d3229fd6bd.png)
![image](https://user-images.githubusercontent.com/55207058/207807572-367d4ef5-ab60-4f0b-a719-da2240965186.png)
![image](https://user-images.githubusercontent.com/55207058/207810864-7f75c9e7-b7f5-47de-96dc-3533b2ffc5cb.png)

Операції SELECT, INSERT, UPDATE, DELETE стають доступними, якщо користувач postgres надає права на них. Операції SELECT, UPDATE, DELETE можливо проводити тільки з 1 доступним рядком, але операція INSERT може додати у справжню таблицю human нові значення, які не буде у таблиці схеми при невиконанні умов, або може з'явитися, якщо дата народження зівпадає з умовою.
