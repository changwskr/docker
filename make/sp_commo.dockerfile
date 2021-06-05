FROM node:12 
#node:12는 컨테이너이름이다

COPY sp_commo.js / 
# hello.js 파일을 컨테이너의 최상위 디렉토리로 복사해라
CMD ["node", "/sp_commo.js"] 
# nodel라는 명령어를 가지고 컨테이너의 최상단에 있는 hello.js을 실행해줘


