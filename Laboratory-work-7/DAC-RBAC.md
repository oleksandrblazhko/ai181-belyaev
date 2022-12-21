2. Створіть термінальну консоль psql через утиліту командного рядка вашої ОС та встановіть з’єднання з БД postgres від імені користувача-адміністратора postgres

![image](https://user-images.githubusercontent.com/55207058/207795798-ae426c3d-08db-4d53-9451-eff257a7ac07.png)

3. Зареєструйте нового користувача в СКБД PostgreSQL, назва якого співпадає з вашим ім'ям, наприклад ivan, і довільним паролем.

![image](https://user-images.githubusercontent.com/55207058/207797123-543e2e54-f09f-4da1-b3d8-5f4df8a73584.png)

4. Створіть роль в СКБД PostgreSQL (назва співпадає з вашим прізвищем латинськими літерами) і надайте новому користувачеві можливість наслідувати цю роль.

![image](https://user-images.githubusercontent.com/55207058/207797216-76ece4ec-34df-416e-b5cd-166c44ee4a53.png)

5. Створіть реляційну таблицю з урахуванням варіанту з таблиці 2.1 від імені користувача-адміністратора.

![image](https://user-images.githubusercontent.com/55207058/207798276-fc0b229c-5143-40ea-8811-c84a3facd10c.png)

6. Внесіть один рядок в таблицю, використовуючи команду insert into ..., відповідно до варіанту.

![image](https://user-images.githubusercontent.com/55207058/207798778-f252225e-6a60-43bc-a865-d621c6905aca.png)

7. Додатково створіть ще одну термінальну консоль psql та та встановіть з’єднання з БД postgres від імені нового користувача.

![image](https://user-images.githubusercontent.com/55207058/207799063-be72d007-6905-4dc7-afa1-5b9249828b18.png)

8. Від імені вашого користувача виконайте запит на отримання даних з таблиці (select * from таблиця). Запротоколюйте результат виконання команди.

![image](https://user-images.githubusercontent.com/55207058/207799149-8ea1118c-8403-4f3a-8033-7052c824fcbc.png)

9. Встановіть повноваження на читання таблиці новому користувачеві.

![image](https://user-images.githubusercontent.com/55207058/207799334-bcb9e4b2-6373-45d8-a0f2-83f3498a8f0a.png)

10. Повторіть крок 8.

![image](https://user-images.githubusercontent.com/55207058/207799400-2e404140-66b4-48de-969d-2d9ec50e2c76.png)

11. Зніміть повноваження на читання таблиці для нового користувача.

![image](https://user-images.githubusercontent.com/55207058/207799554-94377017-3f73-494d-8f8f-d81263606b37.png)

12. Повторіть крок 8.

![image](https://user-images.githubusercontent.com/55207058/207799620-7fc8833f-5630-429b-9ae1-7603165bdb17.png)

13. Створіть команду оновлення даних таблиці (UPDATE) і виконайте її від імені нового користувача. Проаналізуйте результат виконання команди.

![image](https://user-images.githubusercontent.com/55207058/207800047-83ca3e89-c9ea-4cc2-8bcc-7734654d60ff.png)

14. Встановіть повноваження на оновлення таблиці новому користувачеві.

![image](https://user-images.githubusercontent.com/55207058/207802217-eea09215-53a5-46da-a31f-662ee831c817.png)

15. Повторіть крок 13.

![image](https://user-images.githubusercontent.com/55207058/207801228-52ba2140-3a1a-4697-bbe6-a09dd5d71231.png)

16. Створіть команду видалення запису таблиці (DELETE) і виконайте її від імені нового користувача. Проаналізуйте результат виконання команди.

![image](https://user-images.githubusercontent.com/55207058/207800879-9e0618e6-0549-4784-8abe-f3f74bf50f49.png)

17. Встановіть повноваження на видалення таблиці новому користувачеві.

![image](https://user-images.githubusercontent.com/55207058/207801029-3a944669-3b1c-45ae-b9a4-6ceb6e35a3a8.png)

18. Повторіть крок 16.

![image](https://user-images.githubusercontent.com/55207058/207801277-3e01e5e3-1db7-4bdb-a609-8e448dcc637d.png)

19. Зніміть всі повноваження з таблиці для нового користувача.

![image](https://user-images.githubusercontent.com/55207058/207801489-304a1ff1-7f9b-42c7-89b8-06f1225a13f6.png)

20. Створіть команду внесення запису в таблицю (INSERT) і виконайте її від імені нового користувача. Проаналізуйте результат виконання команди.

![image](https://user-images.githubusercontent.com/55207058/207801655-e23d1738-667c-46e7-bd58-bb99a327d98e.png)

21. Встановіть повноваження на внесення даних до таблиці для ролі.

![image](https://user-images.githubusercontent.com/55207058/207801838-44fd1ecb-d953-45de-8a89-8fd67d4c3789.png)

22. Повторіть крок 20.

![image](https://user-images.githubusercontent.com/55207058/207801874-0fc055c3-0626-4685-bbce-4dc04076e686.png)
