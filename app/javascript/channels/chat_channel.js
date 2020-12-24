import consumer from "./consumer"


let App = {}
let message_count = 0

function subscriptChat() {
    App.chat = consumer.subscriptions.create("ChatChannel", {
        connected() {
            console.log("connected chat channel")
            $("#SendDataContainer").show();
            // Called when the subscription is ready for use on the server
        },

        disconnected() {
            console.log("disconnected chat channel")
            // Called when the subscription has been terminated by the server
        },

        received(data) {
            message_count += 1;

            $('#LogContainer').append("<label class='drop' style='display: block;' for='_s" + message_count + "'>" + data.user.replace(/\s/g, "&nbsp;") + "</label>");
            $('#LogContainer').append("<input id='_s" + message_count + "' type='checkbox' style='display: none'>");
            var msg = "<span class='chat_span' style='color: " + data.color + "'>" + data.message + "</span>";

            $('#LogContainer').append(msg);
            var LogContainer = document.getElementById("LogContainer");
            LogContainer.scrollTop = LogContainer.scrollHeight;
            // Called when there's incoming data on the websocket for this channel
        }
    });
}

function send_message() {
    let dataSelector = $("#DataToSend")
    let msg = dataSelector.val().replace(/<p>&nbsp;<\/p>/g, "").replace(/\n$/g, '').replace(/<p>|<\/p>/g, "")
    if (msg === "") {
        return false;
    }
    dataSelector.val('')
    App.chat.send({color: "black", message: msg})
}


export {subscriptChat, send_message}

