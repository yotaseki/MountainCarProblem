%% MATLAB 5.0 MAT-file, Platform: GLNXA64, Created on: Sun Aug 27 15:36:11 2017                                                 IM

clear all

options.gamma    = 0.95;        %割引率
options.centers  = gaussian;    %ガウス関数の中心行列
options.var      = 0.5;    %ガウス関数の幅
options.epsilon  = 0.2;         %ε-greedyの変数ε

L = 10; % 反復
M = 100;  % エピソード
T = 100;  % ステップ
B = 12; % 基底関数の数
theta = LeastSquaresPolicyIterations(L, M, T, B, options)
%theta = ones(B*3,1);
figure(3);
subplot(1,3,1);
syms x y;
f1 = ValueFunction(x,y,theta,B,options,1);
fsurf(f1,[-1.2 0.5 -1.5 1.5]);
title("行動 -0.2");
xlabel("位置");
ylabel("速度");
zlabel("価値");

subplot(1,3,2);
syms x y;
f2 = ValueFunction(x,y,theta,B,options,2);
fsurf(f2,[-1.2 0.5 -1.5 1.5]);
title("行動 0");
xlabel("位置");
ylabel("速度");
zlabel("価値");

subplot(1,3,3);
syms x y;
f3 = ValueFunction(x,y,theta,B,options,3);
fsurf(f3,[-1.2 0.5 -1.5 1.5]);
title("行動 0.2");
xlabel("位置");
ylabel("速度");
zlabel("価値");

    function Q=ValueFunction(x,y,theta,B,options,index)
            state = [x;y];
            nactions = 3;
            dist = sum((options.centers - repmat(state',B,1)).^2,2);
            % 現在の状態における基底関数z
            phis = exp(-dist/2/(options.var^2));
            % 現在の状態における価値関数
            q = phis'*reshape(theta,B,nactions);
            Q = q(index);
    end

% while and(car.x < goal.x, t < T)
%     i = randi([1 3],1,1);
%     car.a = car.Actions(i);
%     Action
%end