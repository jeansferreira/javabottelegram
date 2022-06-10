package br.com.digitro;

import java.io.IOException;
import java.util.concurrent.atomic.AtomicInteger;

import com.pengrad.telegrambot.Callback;
import com.pengrad.telegrambot.TelegramBot;
import com.pengrad.telegrambot.TelegramBotAdapter;
import com.pengrad.telegrambot.model.Update;
import com.pengrad.telegrambot.request.GetUpdates;
import com.pengrad.telegrambot.request.SendMessage;
import com.pengrad.telegrambot.response.GetUpdatesResponse;

/**
 * Classe que recebe um Token do Telegram e envia uma mensagem para o usu�rio que est� cadastrado
 * 
 * @author jean.ferreira
 * Email: jean.ferreira@digitro.com.br
 */
public class Main {

	private static String token = "";
	private static String log_integracao = "";

	public static void main(String[] args) {
		System.out.println("INICIANDO...");

		try {
			token = "COLOCAR AQUI O TOKEN";
			log_integracao = "Teste...";
			
			//token = args[0];
			//log_integracao = args[1];

			new DgtBot().run(token);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static class DgtBot {

		private static int LONG_POOLING_TIMEOUT_IN_SECONDS = 60;

		private AtomicInteger updateId = new AtomicInteger(0);

		public void run(String token) throws InterruptedException {
			final TelegramBot bot = TelegramBotAdapter.build(token);

			// while (true) {
			System.out.println("Checando a lista de updates...");

			bot.execute(new GetUpdates().limit(100).offset(updateId.get()).timeout(LONG_POOLING_TIMEOUT_IN_SECONDS),
					new Callback<GetUpdates, GetUpdatesResponse>() {

						@Override
						public void onResponse(GetUpdates request, GetUpdatesResponse response) {

							for (Update update : response.updates()) {
								// update = resp.updates().get(0);
								long chat_id = update.message().from().id();

								SendMessage message = new SendMessage(chat_id, log_integracao);

								if (update.message() != null) {

									if (update.message().text() != null
											&& update.message().text().toString().equals("/start")) {

										System.err.println("ID MENSAGEM: " + message.toString());
										System.err.println("MENSAGEM   : " + update.updateId().toString());
										// SendMessage messageResp = new SendMessage(chat_id, String.format("Erro na
										// Integra��o : %s", log_integracao.toString() ));
										// System.err.println("ID MENSAGEM: " + messageResp.toString());

										bot.execute(message);
									}

								}
							}
						}

						@Override
						public void onFailure(GetUpdates request, IOException e) {
							e.printStackTrace();
						}
					});

			Thread.sleep(LONG_POOLING_TIMEOUT_IN_SECONDS * 1000);
			// }
		}
	}
}
