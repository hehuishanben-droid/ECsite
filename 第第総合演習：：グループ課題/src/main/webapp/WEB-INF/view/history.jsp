<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.OrderHistory" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>注文履歴</title>

</head>
<body>

  <h1>注文履歴</h1>

  <%
    List<OrderHistory> orderHistory = (List<OrderHistory>) request.getAttribute("orderHistory");
    if (orderHistory == null || orderHistory.isEmpty()) {
  %>
    <p style="text-align: center;">注文履歴がありません。</p>
  <%
    } else {
  %>
    <table>
      <tr>
        <th>商品名</th>
        <th>価格</th>
        <th>数量</th>
        <th>注文日時</th>
      </tr>
      <%
        for (OrderHistory item : orderHistory) {
      %>
      <tr>
        <td><%= item.getShohinMei() %></td>
        <td><%= item.getKakaku() %>円</td>

        <td><%= item.getQuantity() %></td>
        <td><fmt:formatDate value="<%= item.getOrderTime() %>" pattern="yyyy年MM月dd日 HH:mm"/></td>
      </tr>
      <%
        }
      %>
    </table>
  <%
    }
  %>

  <a href="MenuServlet" class="back-link">メニューへ戻る</a>

</body>
</html>
  <style>
    body {
      font-family: 'Oswald', sans-serif;
      background-color: black;
      color: white;
      margin: 0;
      padding: 0;
    }

    h1 {
      margin: 30px 0;
      color: white;
      text-align: center;
    }

    table {
      border-collapse: separate;
      border-spacing: 0;
      width: 80%;
      margin: 0 auto 30px auto;
      border: 2px solid white;
      border-radius: 12px;
      overflow: hidden;
    }

    th, td {
      border: 1px solid #999;
      padding: 10px;
      text-align: center;
      background-color: #fff;
      color: #000;
    }

    th {
      background-color: #e0e0e0;
    }

    .back-link {
      display: block;
      width: fit-content;
      margin: 0 auto 40px auto;
      padding: 10px 20px;
      background-color: gray;
      color: white;
      text-decoration: none;
      border-radius: 5px;
      text-align: center;
      transition: background-color 0.3s;
    }

    .back-link:hover {
      background-color: #555;
    }
  </style>