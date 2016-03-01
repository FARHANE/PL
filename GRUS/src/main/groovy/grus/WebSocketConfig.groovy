package grus

import grails.plugin.springwebsocket.GrailsSimpAnnotationMethodMessageHandler
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.messaging.MessageChannel
import org.springframework.messaging.simp.SimpMessagingTemplate
import org.springframework.messaging.simp.config.MessageBrokerRegistry
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker
import org.springframework.web.socket.config.annotation.StompEndpointRegistry
import org.springframework.web.socket.server.support.DefaultHandshakeHandler
import org.springframework.web.socket.WebSocketHandler
import org.springframework.http.server.ServerHttpRequest
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import java.security.Principal


@Configuration
@EnableWebSocketMessageBroker
class WebSocketConfig extends AbstractWebSocketMessageBrokerConfigurer {

	@Override
	void configureMessageBroker(MessageBrokerRegistry messageBrokerRegistry) {
		messageBrokerRegistry.enableSimpleBroker "/queue", "/topic"
		messageBrokerRegistry.setApplicationDestinationPrefixes "/app"
	}

	@Override
	void registerStompEndpoints(StompEndpointRegistry stompEndpointRegistry) {
		stompEndpointRegistry.addEndpoint("/stomp").setHandshakeHandler(new UserName()).withSockJS()
	}

	@Bean
	GrailsSimpAnnotationMethodMessageHandler grailsSimpAnnotationMethodMessageHandler(
		MessageChannel clientInboundChannel,
		MessageChannel clientOutboundChannel,
		SimpMessagingTemplate brokerMessagingTemplate
	) {
		def handler = new GrailsSimpAnnotationMethodMessageHandler(clientInboundChannel, clientOutboundChannel, brokerMessagingTemplate)
		handler.destinationPrefixes = ["/app"]
		return handler
	}
	private class UserName extends DefaultHandshakeHandler{
		@Override
		protected Principal determineUser(ServerHttpRequest request, WebSocketHandler wsHandler,Map<String,Objects> attributes){
			String username  = SecurityContextHolder.getContext().getAuthentication().getPrincipal().getUsername()
			return new UsernamePasswordAuthenticationToken(username,null)
		}
	}
	
}
