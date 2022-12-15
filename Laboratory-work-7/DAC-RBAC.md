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

![image](https://user-images.githubusercontent.com/55207058/207800474-26d7aae3-3e86-4520-af6d-76db8e2777ad.png)

15. Повторіть крок 13.

![image](https://user-images.githubusercontent.com/55207058/207800708-5ebdb7d3-d89b-4f66-bd36-2f2da70a2fa4.png)

16. Створіть команду видалення запису таблиці (DELETE) і виконайте її від імені нового користувача. Проаналізуйте результат виконання команди.

![image](https://user-images.githubusercontent.com/55207058/207800879-9e0618e6-0549-4784-8abe-f3f74bf50f49.png)

![image](https://user-images.githubusercontent.com/55207058/207800898-913be951-9eb7-47f3-93bb-c1172c439539.png)

17. Встановіть повноваження на видалення таблиці новому користувачеві.

![image](https://user-images.githubusercontent.com/55207058/207801029-3a944669-3b1c-45ae-b9a4-6ceb6e35a3a8.png)
















