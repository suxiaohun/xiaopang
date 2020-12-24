import * as  chat from '../channels/chat_channel'


chat.subscriptChat()

window.chat = chat


$("#DataToSend").on('keypress', function (event) {
    if (event.keyCode === 13) {
        chat.send_message()
        event.preventDefault()

    }
})

