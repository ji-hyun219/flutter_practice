




/*
실제로 사용될 때 memory 에 로드된다
initialBing 에 여러 컨트롤러를 inject 해놓고
실제로 사용할 때 mem 에 올리게 코딩하면 효율적이다


기본적으로 오직 한번만 dependency 를 load 한다
route 를 지웠다가 다시 create 한다고 가정해보자
route 를 지우는 순간 dependency 도 지워진다
그리고 route 가 다시 create 되어도 
Get.lazyPut 은 다시 Load 되지 않는다


fenix 를 true 로 주면 dependency 가 지워진 후 
다시 re-initialize 가 가능해진다


getputasync 는
비동기
이걸 put 해놓고 다른걸 하겠다
시간이 오래걸리니까
나중에 getfind 로 찾으면 됨



*/