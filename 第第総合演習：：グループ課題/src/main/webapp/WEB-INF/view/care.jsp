<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>購入内容確認画面</title>
    <style>
        body {
            font-family: sans-serif;
        }
        h1 {
            margin-bottom: 20px;
        }
        table {
            border-collapse: collapse;
            width: 80%;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #999;
            padding: 8px;
            text-align: center;
        }
        .form-section {
            margin-top: 30px;
        }
        .form-group {
            margin-bottom: 10px;
        }
        input[type="text"],
        textarea {
            width: 300px;
            padding: 5px;
        }
        textarea {
            height: 100px;
        }
        .register-button {
            padding: 10px 20px;
            background-color: #2b90d9;
            color: white;
            border: none;
            cursor: pointer;
        }
        .register-button:hover {
            background-color: #1c6ca8;
        }
    </style>
</head>
<body>

<h1>購入内容確認画面</h1>

<c:if test="${empty cartList}">
    <p>カートには商品がありません。</p>
</c:if>

<c:if test="${not empty cartList}">
    <table>
        <tr>
            <th>商品名</th>
            <th>価格</th>
            <th>数量</th>
            <th>小計</th>
        </tr>
        <c:forEach var="item" items="${cartList}">
            <tr>
                <td>${item.shohinMei}</td>
                <td>${item.kakaku} 円</td>
                <td>${item.quantity}</td>
                <td>${item.kakaku * item.quantity} 円</td>
            </tr>
        </c:forEach>
    </table>

    <h3>合計金額: ${totalPrice} 円</h3>

    <div class="form-section">
        <h2>注文確認</h2>
        <p>この商品をを購入しますがよろしいでしょうか？</p>

        <form action="OrderCompServlet" method="post">
   <input type="submit" value="注文確定" class="register-button">
        </form>
    </div>
</c:if>

<br>
<div><a href="MenuServlet">← メニューに戻る</a></div>

</body>
</html>
