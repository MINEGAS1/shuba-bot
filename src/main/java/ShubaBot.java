import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Update;
import java.util.Random;

public class ShubaBot extends TelegramLongPollingBot {

    private Random random = new Random();

    @Override
    public void onUpdateReceived(Update update) {
        // Фото с подписью
        if (update.hasMessage() && update.getMessage().hasPhoto()) {
            String caption = update.getMessage().getCaption();

            if (caption != null) {
                if (caption.equalsIgnoreCase("Оцени шубу!")) {
                    int price = random.nextInt(5000, 8001);
                    sendReply(update, price + " рублей");
                } else if (caption.equalsIgnoreCase("Оцени шубу.")) {
                    int price = random.nextInt(9000, 15001);
                    sendReply(update, price + " рублей");
                } else if (caption.equalsIgnoreCase("Оцени эту шубу")) {
                    int price = random.nextInt(15000, 20001);
                    sendReply(update, price + " рублей");
                }
            }
        }
    }

    private void sendReply(Update update, String text) {
        SendMessage message = new SendMessage();
        message.setChatId(update.getMessage().getChatId().toString());
        message.setText(text);
        try {
            execute(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getBotUsername() {
        return "OchenchikshubP_bot";
    }

    @Override
    public String getBotToken() {
        return "8400518828:AAGJhXYoYdbPwFH8MMzegbPaqlc-2r2653A";
    }
}

