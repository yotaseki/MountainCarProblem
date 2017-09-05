function [Car, Env] = ResetSimulation
%ResetSimulation この関数の概要をここに記述

Car.x = -0.5;           % 台車　初期位置
Car.m = 0.2;            % [kg]
Car.a = 0;              % 加速度
Car.v = 0;              % 速度
Car.Actions = [-0.2, 0, 0.2]; % 推進力の選択　∈ [-0.2 ,0 ,0.2]
Env.k = 0.3;                % 摩擦係数
Env.t = 0;                  % 時刻(ステップ数)
Env.T = 10;                % ステップ数上限
Env.dt = 0.1;               % [s] シミュレーションステップ
Env.goal = 0.5;           % ゴール
end