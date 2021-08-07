### react-spring api 통신 시 cors 정책 오류

cors : 교차 출처 리소스 공유

우리가 만든 리엑트는 localhost:3000 주소를 가지고 있음
스프링은 localhost:8080

포트만 다르더라도 브라우저에서 다른 출처이기때문에 접근을 못하도록 막는다.

기본적으로 스프링에서 풀어준다. (리엑트에서 막는 방법도 있다.)

```java
@Configuration
public class WebConfig implements WebMvcConfigurer{

	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry
			.addMapping("/**") 							// 어떤 요청을 허락 해줄것이냐, 모든 경로 /**
			.allowedOrigins("http://localhost:3000") 	// 특정경로 3000만 허락
			.allowedMethods(							// 어떤 메서드를 허락할 것이냐
					HttpMethod.GET.name(),
					HttpMethod.POST.name(),
					HttpMethod.PUT.name(),
					HttpMethod.DELETE.name()
			);
	}
}
```

<br/>

또는 메서드에 CrossOrigin을 써준다.

```java
    @CrossOrigin
	@GetMapping("/user/list")
	public ResponseEntity<?> list() {
		return new ResponseEntity<>(userRepository.findAll(), HttpStatus.OK);
	}
```
