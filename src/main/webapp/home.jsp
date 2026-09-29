<%@page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hello Servlet</title>
</head>
<body>
    <h1>Hello Servlet and JSP!!!!!!</h1>
    
    <!-- Вывод переменных через EL(Expression Language) -->
    <p>user-agent: ${ua}</p>
    <p>Сервер: ${serverInfo}</p>
    
    <br/>
    <br/>
    
    <form action="/hello" method="get">
        <label for="username">Введите Ваше имя:</label>
        <input type="text" name="username" id="username">
        <button type="submit">Say Hello</button>
    </form>
</body>
</html>