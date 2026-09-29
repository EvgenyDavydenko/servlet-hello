<%@page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Приветствие</title>
</head>
<body>
    <h1>Результат приветствия!</h1>
    
    <!-- Вывод переменных через EL(Expression Language) -->
    <p>${greeting}</p>
    <p>Страница была посещена ${counter} раз.</p>
    
    <br><br>
    <a href="/">Вернуться назад</a>
</body>
</html>