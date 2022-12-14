# ProcessingFidgets
프로세싱을 사용한 다양한 작은 프로젝트를 저장합니다. 외부 그래픽 라이브러리를 배울 필요 없이 그래픽 부분을 해결 할 수 있기 때문에 프로세싱을 사용했습니다. 

## _Lagrangian_
라그랑지언은 계에서의 포텐셜 에너지와 운동 에너지의 보존사실을 사용해 다음 운동 방정식을 유도할 수 있는 방법입니다.
라그랑지언으로 유도한 방정식으로 다음 프레임에서의 진자 각도를 계산합니다. 

### 2D_Lagrangian_Double_Pendulum
유명한 카오스계 문제인 이중 진자의 운동방정식을 라그랑지언으로 유도후 시뮬레이션 합니다.
https://youtube.com/shorts/uie1Du4iyw8?feature=share

### 2D_Lagrangian_Pendulum_Resistive_Force
라그랑지언에서 비보존력을 구현하는 방법에 두 가지가 있습니다. 첫 번째는 감쇄상수(Damping constant)를 사용하는 방식, 두 번재는 라그랑지언에 비보존력을 고려하여 식을 세우는 방식입니다.
전자는 구현이 간단하지만 매우 단순한 모델이기 때문에, 실제 물리 상수를 사용하고자 한다면 후자로 구현해야 합니다. 해당하는 시뮬레이션은 후자의 방식으로 구현되었고, 사용되는 물리상수는 프로그램 제일 앞에 선언되어 있습니다.
그러나, 시뮬레이션 세계와 실제 세계간 값의 괴리로 인해 실제 상수값을 사용하면 잘 동작하지 않을 수 있습니다. 향후 개선 과제입니다.
https://youtube.com/shorts/xOQXJDn2FeU?feature=share

### 3D_Lagrangian_Pendulum
이차원에서의 일반 좌표계에 각도를 하나 더 도입해 삼차원에서의 추 각도를 계산합니다. 
https://youtube.com/shorts/uPvPE1WobjU?feature=share
