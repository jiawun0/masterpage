<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="signaltest.aspx.cs" Inherits="masterpage.signaltest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>SignalR Sample</title>
    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script src="Scripts/jquery.signalR-2.4.3.min.js"></script>
    <script src="signalr/hubs"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderTitle" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Sidebar" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title" runat="server">
    <!-- 訊息輸入框和發送按鈕 -->
    <input type="text" id="messageInput" placeholder="Type your message here...">
    <button id="sendButton">Send</button>

    <!-- 顯示歷史訊息 -->
    <div id="messageHistory"></div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="content" runat="server"> 
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.signalr/2.4.3/jquery.signalR.min.js"></script>
    <script>
        $(function () {
            var chat = $.connection.chatHub;

            // 在這裡設定 SignalR Hub 的 URL
            $.connection.hub.url = "https://localhost:44392/Album_Front.aspx";

            $.connection.hub.start().done(function () {
                // 連接成功，你可以在這裡進行額外的初始化
                console.log("WebSocket connected");
                showConfirmation();
                getChatHistory(); // 取得聊天歷史訊息
            });

            chat.client.broadcastMessage = function (message) {
                // 處理接收到的訊息
                console.log(message);
                displayMessage(message);
            };

            // 顯示確認對話框
            function showConfirmation() {
                var confirmChat = window.confirm("Do you want to start the chat?");

                if (confirmChat) {
                    console.log("Chat started.");
                    // 在此處執行其他需要在聊天開始後執行的程式碼
                } else {
                    console.log("Chat not started.");
                }
            }

            // 取得聊天歷史訊息
            function getChatHistory() {
                // 在這裡加入取得聊天歷史訊息的程式碼，例如從伺服器獲取歷史訊息
                // 這裡只是個範例，你需要自己實現從伺服器獲取歷史訊息的邏輯
                var history = ["History message 1", "History message 2", "History message 3"];
                for (var i = 0; i < history.length; i++) {
                    displayMessage(history[i]);
                }
            }

            // 顯示訊息
            function displayMessage(message) {
                var messageElement = $("<div></div>").text(message);
                $("#messageHistory").append(messageElement);
            }

            // 例：按鈕點擊事件觸發 Send 方法
            $("#sendButton").click(function () {
                var message = $("#messageInput").val();
                chat.server.send(message);
                displayMessage(message); // 顯示發送的訊息
                $("#messageInput").val(""); // 清空輸入框
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="body" runat="server">
</asp:Content>

