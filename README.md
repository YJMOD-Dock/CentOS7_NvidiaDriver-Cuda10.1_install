# CentOS7_NvidiaDriver-Cuda10.1_install
## 필요 환경
CUDA가 지원되는 Nvidia 그래픽 카드\
CentOS7 64bit

## 설치되는 항목
Nvidia Driver\
CUDA 10.1

## 설치 방법
1. CentOS 터미널을 실행 시키고 위 첫번째 shell script를 실행한다.
~~~
sudo bash Nvidia_Driver_install_1.sh
~~~
2. 아래의 명령어를 입력하여 GUI환경을 나간다.
~~~
sudo systemctl isolate multi-user.target
~~~
3. 사용자 로그인 후 위 두번째 shell script를 실행한다.
~~~
sudo bash Nvidia_Driver_install_2.sh
~~~
4. 마지막 shell script를 실행한다.
~~~
sudo bahs Nvidia_Driver_install_3.sh
~~~

## 주의사항
1. Nvidia Driver 설치 홈페이지에서 자신의 그래픽 카드와 맞는 버전의 그래픽 드라이버를 반드시 확인을 한 후 설치를 진행하시기 바랍니다.
2. nouveau 그래픽 드라이버와 충돌을 방지하기 위해서 GUI 환경을 종료합니다.
3. 위 프로그램을 실행시 재부팅이 필요합니다. 작업중인 프로그램은 저장 후 종료한 뒤 실행하시기 바랍니다.

## 설치 확인
~~~
nvidia-smi
~~~
 그래픽 카드 정보가 출력되면 설치완료.
