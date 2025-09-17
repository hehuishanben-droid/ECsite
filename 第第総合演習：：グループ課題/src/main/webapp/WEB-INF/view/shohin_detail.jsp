<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品詳細画面</title>
</head>
<body>

    <h1>商品詳細画面</h1>

<div class="product-detail">
    <c:choose>
        <c:when test="${not empty shohin}">
            <div class="product-container">
                <!-- 左：画像 -->
                <div class="product-image">
                    <img src="images/${shohin.shouhinGazou}" alt="商品画像" class="shouhin_gazou">
                </div>

                <!-- 右：商品詳細 ＋ ボタン類 -->
                <div class="product-right">
                    <div class="product-info">
                        <h2>${shohin.shouhinMei}</h2>
                        <p><strong>価格:</strong> <fmt:formatNumber value="${shohin.kakaku}" type="number" /> 円</p>
                        <p><strong>在庫数:</strong> ${shohin.zaikoSuuryou} 個</p>
                        <p><strong>商品説明:</strong><br>${shohin.shouhinSetsumei}</p>
                    </div>

                    <!-- 商品情報の下に表示 -->
                    <div class="back-links">
                        <form action="CartServlet" method="post">
                            <input type="hidden" name="shohin_id" value="${shohin.shohinId}">
                            <label>数量:
                                <input type="number" name="quantity" value="1" min="1" max="${shohin.zaikoSuuryou}">
                            </label><br><br>
                            <button type="submit" class="register-button">カートに追加</button>
                        </form>
                        <a href="CartListServlet" class="register-button">ショッピングカート画面へ</a>
                        <a href="MenuServlet" class="register-button">メニューへ</a>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <p>商品情報が取得できませんでした。</p>
        </c:otherwise>
    </c:choose>
</div>



</body>
</html>
<style>
    body {
        background-color: black;
        font-family: sans-serif;
        color: white;
        font-weight: bold;
    }

    .product-detail {
        max-width: 2000px;
        
        padding: 20px;
      
    }

    .product-image {
        max-width: 600px;
        height: auto;
    }
.product-container {
    display: flex;
    align-items: flex-start;
    gap: 30px;
    padding: 20px;
    border: 1px solid black;
    background-color: #222;
    height: auto;
    min-height: 0;
}

.product-image img {
    max-width: 500px;
    height: auto;
    border: 1px solid #fff;
}

/* 右側のブロック（商品情報＋ボタン） */
.product-right {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
     height: auto;
}

.product-info {
    text-align: left;
    margin-bottom: 20px;
}

.product-info h2,
.product-info p {
    margin-bottom: 10px;
}

/* ボタンやフォームの位置調整 */
.back-links {
    text-align: left;
}

.back-links form {
    margin-bottom: 10px;
}

label {
    color: white;
}

.register-button {
    display: inline-block;
    padding: 8px 16px;
    background-color: #ff0000;
    color: white;
    text-decoration: none;
    border-radius: 4px;
    margin-right: 10px;
    font-weight: bold;
}

.register-button:hover {
    background-color: #45a049;
}

</style>
