<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Chat</title>
    <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>
    <#--<script src="/js/chat.js" type="application/javascript"></script>-->
</head>
<body onload="login('${userDto.currentToken.value}')">
<h1>Ваш Login: ${userDto.user.login}</h1>
<div>
    <input id="message" placeholder="Ваше сообщение">
    <button onclick="sendMessage('${userDto.currentToken.value}',
            $('#message').val())">Отправить</button>
</div>
<div>
    <ul id="messages">

    </ul>
</div>
<script>
    function sendMessage(pageId, text) {
        let body = {
            pageId: pageId,
            text: text
        };

        $.ajax({
            url: "/messages",
            method: "POST",
            data: JSON.stringify(body),
            contentType: "application/json",
            dataType: "json",
            complete: function () {
            }
        });
    }
    function receiveMessage(pageId) {
        $.ajax({
            url: "/messages?pageId=" + pageId,
            method: "GET",
            dataType: "json",
            contentType: "application/json",
            success: function (response) {
                $('#messages').first().after('<li>' + response[0]['text'] + '</li>')
                receiveMessage(pageId);
            }
        })
    }

    function login(pageId) {
        let body = {
            pageId: pageId,
            text: 'Hi!'
        };

        $.ajax({
            url: "/messages",
            method: "POST",
            data: JSON.stringify(body),
            contentType: "application/json",
            dataType: "json",
            complete: function () {
                receiveMessage(pageId);
            }
        });
    }
</script>
</body>
</html>