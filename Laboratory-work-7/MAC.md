1. Створіть у БД структури даних, необхідні для роботи повноважного керування доступом.

![image](https://user-images.githubusercontent.com/55207058/208957755-4def6959-85fc-47b6-aa29-f3f7e9a3d377.png)

2. Визначте для кожного рядка таблиці мітки конфіденційності (для кожного рядка свою мітку).

![image](https://user-images.githubusercontent.com/55207058/208958754-c47e5035-3ef6-4eae-a57a-3dab22ffa230.png)

![image](https://user-images.githubusercontent.com/55207058/208960166-af6c1df2-299e-4005-b19d-907a4a2500e6.png)

3. Визначте для користувача його рівень доступу

![image](https://user-images.githubusercontent.com/55207058/208959280-22813cbd-3296-45fa-b153-4a6ffede3f45.png)

4. Створіть нову схему даних.

![image](https://user-images.githubusercontent.com/55207058/208960527-86305bcb-4aac-4753-84db-92afaeaca997.png)

5. Створіть віртуальну таблицю, назва якої співпадає з назвою реальної таблиці та яка забезпечує SELECT-правила повноважного керування доступом для користувача

![image](https://user-images.githubusercontent.com/55207058/208962555-c1829bae-98db-42f6-973c-2032e9fbe56e.png)

![image](https://user-images.githubusercontent.com/55207058/208963097-e5e7e71e-9a4c-485b-8b67-817d54880b8e.png)

Користувач kirill не має доступу до таблиці human, але має доступ до 2 рядків через представення, міткі конфіденційності яких 2 та 1

6. Створіть INSERT/UPDATE/DELETE-правила повноважного керування доступом для користувача.

![image](https://user-images.githubusercontent.com/55207058/208966407-00d9179a-485b-40b8-b032-eb418694f808.png)

![image](https://user-images.githubusercontent.com/55207058/208966832-c88f0dd3-989d-4cf2-9af9-f54826037c8a.png)

7. Перевірте роботу механізму повноважного керування, виконавши операції SELECT, INSERT, UPDATE, DELETE

![image](https://user-images.githubusercontent.com/55207058/208967355-14780e80-08ee-4663-b669-c8540077f984.png)
