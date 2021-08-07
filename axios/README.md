## Axios 란?

- Axios는 브라우저, Node.js를 위한 Promise API를 활용하는 HTTP 비동기 통신 라이브러리이다.
- 쉽게 말해서 백엔드랑 프론트엔드랑 통신을 쉽게하기 위해 Ajax와 더불어 사용한다.

## Axios 특징

- 운영 환경에 따라 브라우저의 XMLHttpRequest 객체 또는 Node.js의 http api 사용
- Promise(ES6) API 사용
- 요청과 응답 데이터의 변형
- HTTP 요청 취소
- HTTP 요청과 응답을 JSON 형태로 자동 변경

## Axios 사용

```bash
    $ npm i axios
```

```javascript
// POST 요청 전송
axios({
  method: "post",
  url: "/user/12345",
  data: {
    firstName: "Fred",
    lastName: "Flintstone",
  },
});
```

 <br/>

별칭 메소드를 사용하면 속성을 지정할 필요가 없다.

```javascript
// axios.get() 별칭 메서드 사용 시
axios.get(url).then().then();

axios.post("url주소", { data객체 }, [, config]

// axios.put() 별칭 메서드 사용 시
axios.put('/user/12345', {
  firstName: 'Fred',
  lastName: 'Flintstone'
}));
```

<br/>

async await를 같이 사용

```javascript
async function getUser() {
  try {
    const response = await axios.get("/user?ID=12345");
    console.log(response);
  } catch (error) {
    console.error(error);
  }
}
```

3. 작성 페이지

|                      axios                      |                             fetch                              | 비고 |
| :---------------------------------------------: | :------------------------------------------------------------: | :--: |
|             요청 객체에 url이 있다.             |                    요청 객체에 url이 없다.                     |      |
|        써드파티 라이브러리로 설치가 필요        |           현대 브라우저에 빌트인이라 설치 필요 없음            |      |
|                data 속성을 사용                 |                         별도 보호 없음                         |      |
|               XSRF 보호를 해준다.               |                        body 속성을 사용                        |      |
| status가 200이고 statusText가 ‘OK’이면 성공이다 |             응답객체가 ok 속성을 포함하면 성공이다             |      |
|      자동으로 JSON데이터 형식으로 변환된다      |                 .json()메서드를 사용해야 한다.                 |      |
|  요청을 취소할 수 있고 타임아웃을 걸 수 있다.   |                    해당 기능 존재 하지않음                     |      |
|            HTTP 요청을 가로챌수 있음            |                    기본적으로 제공하지 않음                    |      |
|     download진행에 대해 기본적인 지원을 함      |                         지원하지 않음                          |      |
|           좀더 많은 브라우저에 지원됨           | Chrome 42+, Firefox 39+, Edge 14+, and Safari 10.1+이상에 지원 |      |
