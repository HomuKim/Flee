package com.flee.chat.controller;

import com.flee.chat.controller.ChatWebSocketHandler;

import com.flee.chat.controller.EchoHandler;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class WsConfig implements WebSocketConfigurer {

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(echoHandler(), "/echo-ws");
		registry.addHandler(chatHandler(), "/chat-ws");
		registry.addHandler(echoHandler(), "/echo.sockjs").withSockJS();
		registry.addHandler(chatHandler(), "/chat.sockjs").withSockJS();
	}

	@Bean
	public EchoHandler echoHandler() {
		return new EchoHandler();
	}
	
	@Bean
	public ChatWebSocketHandler chatHandler() {
		return new ChatWebSocketHandler();
	}

}
