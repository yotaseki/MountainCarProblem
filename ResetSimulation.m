function Sim = ResetSimulation
%ResetSimulation この関数の概要をここに記述
Sim.car.x = -0.5;           % 台車　初期位置
Sim.car.m = 0.2;            % [kg]
Sim.car.a = 0;              % 加速度
Sim.car.v = 0;              % 速度
Sim.car.Actions = [-0.2, 0, 0.2]; % 推進力の選択　∈ [-0.2 ,0 ,0.2]
Sim.k = 0.3;                % 摩擦係数
Sim.t = 0;                  % 時刻(ステップ数)
Sim.T = 10;                % ステップ数上限
Sim.dt = 0.1;               % [s] シミュレーションステップ
Sim.goal.x = 0.5;           % ゴール
end